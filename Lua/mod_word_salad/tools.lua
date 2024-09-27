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

--[[ @Merge: getlevelsurrounds() was merged ]]


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
