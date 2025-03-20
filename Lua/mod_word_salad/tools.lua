-- OVERRIDE: Add check for ALIVE

--[[ @Merge: isgone() was merged ]]


-- OVERRIDE: keep karma after undoing

--[[ @Merge: delete() was merged ]]


-- OVERRIDE: update code if new unit is "ECHO"

--[[ @Merge: create() was merged ]]


-- OVERRIDE: check for code updates if ECHO is present

--[[ @Merge: update() was merged ]]


-- OVERRIDE: keep track of any text at the level position (including the level itself if it was converted) - This probably doesn't work with levels within levels
-- Also keep track of whether the level was sinful when entering

function getlevelsurrounds(levelid)
    local level = mmf.newObject(levelid)

    local dirids = { "r", "u", "l", "d", "dr", "ur", "ul", "dl", "o" }
    local x, y, dir = level.values[XPOS], level.values[YPOS], level.values[DIR]

    local result = tostring(dir) .. ","

    for i, v in ipairs(dirs_diagonals) do
        result = result .. dirids[i] .. ","

        local ox, oy = v[1], v[2]

        local tileid = (x + ox) + (y + oy) * roomsizex

        if (unitmap[tileid] ~= nil) then
            if (#unitmap[tileid] > 0) then
                for a, b in ipairs(unitmap[tileid]) do
                    if (b ~= levelid) then
                        local unit = mmf.newObject(b)
                        local name = getname(unit)

                        result = result .. name .. ","
                    end
                end
            else
                result = result .. "-" .. ","
            end
        else
            result = result .. "-" .. ","
        end
    end

    -- EDIT: find all texts (including the level itself) at the level's position
    -- NOTE: this assumes that the text being echoed is of the same type as within the level (for example if BABA is a noun in the map, it's treated as a noun inside the level as well)

    ws_overlapping_texts = {}
    -- @Merge(Word Salad x Metatext): set flag for explicit querying of all texts (see findtype() function def for why)
    local text_ids = findtype({ "text" }, x, y, nil, false, true)
    for _, textid in ipairs(text_ids) do
        local text_unit = mmf.newObject(textid)

        --[[
			@Merge(Word Salad x Plasma): A few changes, mainly to account for the fact that when calling levelsurrounds(), you're often moving to a different level, meaning that unitids will not be consistent
			- use get_turning_text_interpretation() to account for turning text
			- if object overlapping an ECHO level is a pointer noun, get all of the things that the pointer noun refers to and process each of them independently
		 ]]
        if is_name_text_this(text_unit.strings[NAME]) then
            for ray_object in pairs(get_raycast_objects(textid)) do
                local unitid = plasma_utils.parse_object(ray_object)
                if unitid == 2 then
                    local text_data = { "empty", 0, -1 } -- If a pointer texxt is pointing to an empty tile, explicitly put in "empty" for the list of echoed texts
                    table.insert(ws_overlapping_texts, text_data)
                else
                    table.insert(text_ids, unitid)
                end
            end
        else
            local text_data = { get_turning_text_interpretation(textid), text_unit.values[TYPE], -1 } -- The position is set to -1, so that any level obj inside the level can echo the text regardless of their position
            table.insert(ws_overlapping_texts, text_data)
        end
        -- EXPERIMENT: Allow echoing WORD units as well
        if (WS_CAN_ECHO_WORD_UNITS) then
            for _, words in ipairs(wordunits) do -- Hopefully this also works?
                -- NOTE: For consistency with how LEVEL IS ECHO handles outer text, we allow a level to echo itself if it's also WORD
                local word_unit = mmf.newObject(words[1])
                if (word_unit.values[XPOS] == x) and (word_unit.values[YPOS] == y) then
                    table.insert(ws_overlapping_texts, { word_unit.strings[NAME], 0, -1 }) -- WORD objects are always nouns, and like above the position is set to -1
                end
            end
        end
    end

    -- EDIT: keep the "sinful" status of a level upon entering
    ws_wasLevelSinful = level.karma
    -- EDIT: keep track of what object the current level is for AMBIENT (ideally this should be stored somewhere)
    local thisLevelIs = getname(level)
    ws_ambientObject = thisLevelIs
    MF_store("save", level.strings[U_LEVELFILE], "ws_ambient", thisLevelIs)
    -- EDIT: check if the level is aligned
    local columnFail, rowFail = false,
        false                             -- columnFail = object in different column, rowFail = object in different row
    for _, u in pairs(unitlists[ws_ambientObject]) do
        local unit = mmf.newObject(u)
        local ux, uy = unit.values[XPOS], unit.values[YPOS]
        if (ux ~= x) then -- Other level in a different column
            columnFail = true
        end
        if (uy ~= y) then -- Other level in a different row
            rowFail = true
        end
        if columnFail and rowFail then -- No need to keep checking
            break
        end
    end
    ws_levelAlignedRow = not rowFail
    ws_levelAlignedColumn = not columnFail

    generaldata2.strings[LEVELSURROUNDS] = result
end

-- OVERRIDE: also keep track of ECHO units

--[[ @Merge: delunit() was merged ]]

-- OVERRIDE: replace "ambient" when looking for units
function findunits(name,db,conds)
    local result = db or {}

    if (name ~= "empty") and (name ~= "all") then
        local checkthese = {}
        if (name == "ambient") then
            checkthese = {ws_ambientObject}
        elseif (string.sub(name, 1, 5) ~= "group") then
            checkthese = {name}
        else
            checkthese = findgroup(name)
        end

        for a,b in ipairs(checkthese) do
            if (unitlists[b] ~= nil) then
                for i,v in ipairs(unitlists[b]) do
                    table.insert(result, {v, conds})
                end
            end
        end
    end

    return result
end
