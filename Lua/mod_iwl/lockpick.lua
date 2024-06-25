doordata = {}
keydata = {}
pickkeys = {}
display0 = {}
datanames = {}
auras = {}
cursed = {}
grayed = {}
iscursed = {}
starval = {}
layers = {}
locklist = {}

mastermode = false
pressedm = false

imode = false
pressedi = false

glitchcolor = "glitch"
glitches = {}
glitchlocks = {}

combosync = {}
comboreq = {}
combodata = {}
combodisplay = {}
showlayer = {}
combocursed = {}
comboiscursed = {}
comboisgray = {}

gatereq = {}
gatesync = {}
gatedisplay = {}

pickkeysi = {}
layersi = {}

hasmovedyeah = {}

salvageid = {}
salvaging = -1
origspecial = {}
doorsalvaged = false

terminaldata = {}
terminaldata2 = {}
terminaldata3 = {}
terminalsid = 0
terminallock = 1
terminalcolor = nil

jammed = false
sigils = {}

noidle = false

shorthand = {
    red = "red",
    blue = "blu",
    brown = "brn",
    master = "mst",
    pure = "pur",
    green = "grn",
    yellow = "yel",
    orange = "ora",
    purple = "pur",
    glitch = "glc"
}

lookup1 = {"F", "E", "EF", "P", "FP", "EP", "EFP"}
lookup2 = {
	master = {3,4},
	pure = {0,2},
	brown = {6,1},
	glitch = {0,1},
	red = {2,1},
	blue = {3,3},
	green = {5,1},
	yellow = {2,4},
	orange = {2,3},
	purple = {3,1},
	black = {0,0},
	blossom = {4,1},
	cyan = {1,4},
	pink = {4,2},
	white = {0,3},
	rainbow = {2,2},
	gray = {0,1},
	void = {1,1}
}

local freezes = {}
local paints = {}
local erodes = {}
local locks = {}

combolocks = {}
hascombolocks = {}

table.insert(editor_objlist_order, "iwldoor")
table.insert(editor_objlist_order, "text_iwldoor")
table.insert(editor_objlist_order, "iwlkey")
table.insert(editor_objlist_order, "text_iwlkey")
table.insert(editor_objlist_order, "iwlmkey")
table.insert(editor_objlist_order, "text_iwlmkey")
table.insert(editor_objlist_order, "inputpoint")
table.insert(editor_objlist_order, "outputpoint")
table.insert(editor_objlist_order, "jam")
table.insert(editor_objlist_order, "voidkey")

editor_objlist["iwldoor"] = 
{
	name = "iwldoor",
	sprite_in_root = false,
	unittype = "object",
	tags = {"abstract"},
	tiling = -1,
	type = 0,
	layer = 15,
	colour = {2, 4},
    sprite = "iwlDoor"
}

editor_objlist["text_iwldoor"] = 
{
	name = "text_iwldoor",
	sprite_in_root = true,
	unittype = "text",
	tags = {"text", "abstract"},
	tiling = -1,
	type = 0,
	layer = 20,
	colour = {6, 1},
	colour_active = {2, 4},
    sprite = "text_door"
}

editor_objlist["iwlkey"] = 
{
	name = "iwlkey",
	sprite_in_root = false,
	unittype = "object",
	tags = {"abstract"},
	tiling = -1,
	type = 0,
	layer = 15,
	colour = {2, 4},
    sprite = "iwlKey"
}

editor_objlist["text_iwlkey"] = 
{
	name = "text_iwlkey",
	sprite_in_root = true,
	unittype = "text",
	tags = {"text", "abstract"},
	tiling = -1,
	type = 0,
	layer = 20,
	colour = {6, 1},
    colour_active = {2, 4},
    sprite = "text_key"
}

editor_objlist["iwlmkey"] = 
{
	name = "iwlmkey",
	sprite_in_root = false,
	unittype = "object",
	tags = {"abstract"},
	tiling = -1,
	type = 0,
	layer = 15,
	colour = {0, 3},
    sprite = "iwlMKey"
}

editor_objlist["inputpoint"] = 
{
	name = "inputpoint",
	sprite_in_root = false,
	unittype = "object",
	tags = {"abstract"},
	tiling = -1,
	type = 0,
	layer = 2,
	colour = {4, 1},
    sprite = "iwlInput"
}

editor_objlist["outputpoint"] = 
{
	name = "outputpoint",
	sprite_in_root = false,
	unittype = "object",
	tags = {"abstract"},
	tiling = -1,
	type = 0,
	layer = 2,
	colour = {1, 4},
    sprite = "iwlOutput"
}

editor_objlist["text_iwlmkey"] = 
{
	name = "text_iwlmkey",
	sprite_in_root = true,
	unittype = "text",
	tags = {"text", "abstract"},
	tiling = -1,
	type = 0,
	layer = 20,
	colour = {0, 1},
    colour_active = {0, 3},
    sprite = "text_key"
}


editor_objlist["jam"] = 
{
	name = "jam",
	sprite_in_root = false,
	unittype = "object",
	tags = {"abstract"},
	tiling = -1,
	type = 0,
	layer = 15,
	colour = {0, 3}
}

editor_objlist["voidkey"] = 
{
	name = "voidkey",
	sprite_in_root = false,
	unittype = "object",
	tags = {"abstract"},
	tiling = -1,
	type = 0,
	layer = 15,
	colour = {0, 3}
}

formatobjlist()

table.insert(mod_hook_functions["level_start"], function()
	local blossoms = 0
	if (editor.values[INEDITOR] == 0) then
		local world = generaldata.strings[WORLD]
		blossoms = tonumber(MF_read("save",world .. "_clears","total")) or 0
	end
    doorcount = {}
    keycount = {}
    doordata = {}
    keydata = {}
    layers = {}
    pickkeys = {
        master = 0,
		blossom = blossoms,
		void = 0
    }
    auras = {}
    datanames = {}
    display0 = {}
    freezes = {}
    paints = {}
    starval = {}
    erodes = {}
	locks = {}
    cursed = {}
	grayed = {}
    iscursed = {}
    glitchcolor = "glitch"
    glitches = {}
	combolocks = {}
	hascombolocks = {}

    combosync = {}
    comboreq = {}
    combodisplay = {}
    combodata = {}
    showlayer = {}
    combocursed = {}
    comboiscursed = {}
	comboisgray = {}

	gatereq = {}
	gatesync = {}
	gatedisplay = {}

    pickkeysi = {
        master = 0,
		blossom = 0,
		void = 0
	}
    layersi = {}

    salvageid = {}
    salvaging = -1
    origspecial = {}
    doorsalvaged = false

	jammed = false
	sigils = {}

	terminaldata = {}
	terminaldata2 = {}
	terminaldata3 = {}
	terminalsid = 0
	terminallock = 1
	terminalcolor = nil
	getomegas()
	getsalvages()

    mastermode = false
    pressedm = false
    imode = false
    pressedi = false
    local curr = generaldata.strings[CURRLEVEL]
    local world = generaldata.strings[WORLD]
    MF_setfile("level","Data/Worlds/" .. world .. "/" .. curr .. ".ld")
    MF_setfile("world","Data/Worlds/" .. generaldata.strings[WORLD] .. "/" .. "world_data.txt")
    local valid = true
    local index = 0
	local redo = {}
    while valid do
        local i = tostring(index)
	    local speicalthing = MF_read("level","specials",i .. "data")
        if (speicalthing ~= nil) and (speicalthing ~= "") then
            local x = tonumber(MF_read("level","specials",i .. "X"))
            local y = tonumber(MF_read("level","specials",i .. "Y"))
            local result = {""}
            local j = 1
            while j <= string.len(speicalthing) do
                local char = string.sub(speicalthing,j,j)
                if char == "," then
                    table.insert(result, "")
                else
                    result[#result] = result[#result] .. char
                end
                j = j + 1
            end
            local kind = result[1]
            table.remove(result,1)
            handlemyspeicals(x,y,kind,result, speicalthing)
			table.insert(redo, {x,y,kind,result, speicalthing})
        else
            valid = false
        end
        index = index + 1
    end
	eraseomegakeys()
	for i, j in pairs(redo) do
		handlemyspeicals(j[1],j[2],j[3],j[4], j[5],true)
	end
	comboconfig()
    handleoutputpoints()
end)

table.insert(mod_hook_functions["turn_end"], function()
    if doorsalvaged then
        if (editor.values[INEDITOR] == 0) then
            uplevel()
        end
        level_to_convert = {}
        MF_levelconversion()
    end
end)

function unlockable(unitid)
    if imode then
        local result, usedmaster = unlockablemode(unitid,true)
        local killIt = (issafe(unitid) == false) and (result[3] == 0) and (result[5] == 0)
        if result ~= "no" then
            return result, usedmaster, killIt
        end
        result, usedmaster = unlockablemode(unitid,false)
        return result, usedmaster, killIt
    else
        local result, usedmaster = unlockablemode(unitid,false)
        local killIt = (issafe(unitid) == false) and (result[3] == 0) and (result[5] == 0)
        if result ~= "no" then
            return result, usedmaster, killIt
        end
        result, usedmaster = unlockablemode(unitid,true)
        return result, usedmaster, killIt
    end
end

function unlockablemode(unitid,usingimode)
    local unit = mmf.newObject(unitid)
    if unit == nil then
        return "no"
    end
    local id = unit.values[ID]
    if ((doordata[id]) == nil) and (combosync[id] == nil) then
        return "no"
    end
    if (auras[id] ~= nil) and (auras[id] ~= 0) then
        return "no"
    end
	local tabler = {}
	local tablei = {}
	for i, j in pairs(pickkeys) do
		if (i ~= "blossom") and ((j ~= 0) or (pickkeysi[j] ~= 0)) and (j ~= nil) then
            if pickkeys[i] == nil then
                pickkeys[i] = 0
            end
            if pickkeysi[i] == nil then
                pickkeysi[i] = 0
            end
			tabler[i] = 0
			tablei[i] = 0
		end
	end
    if not usingimode then
        if combosync[id] == nil then
            local color = doordata[id][1]
            if color == "glitch" then
                color = glitchlocks[id][2]
            end
            local count = doordata[id][2]
			if grayed[id] == true then
				count = count * -1
			end
            local doortype = doordata[id][3]
            local spend = doordata[id][4]
            if spend == "glitch" then
                spend = glitchlocks[id][1]
            end
            local layer = layers[id]
            local thenext = layer - 1
            if (layer < 0) then
                thenext = layer + 1
                count = count * -1
            end
            local layeri = layersi[id]
            local keycount = pickkeys[color]
            local keycounti = pickkeysi[color]
            if pickkeys[spend] == nil then
                pickkeys[spend] = 0
            end
            if pickkeysi[spend] == nil then
                pickkeysi[spend] = 0
            end
            if pickkeys[color] == nil then
                pickkeys[color] = 0
            end
            if pickkeysi[color] == nil then
                pickkeysi[color] = 0
            end
            if keycount == nil then
                pickkeys[color] = 0
                pickkeysi[color] = 0
                keycount = 0
                keycounti = 0
            end
            if mastermode and (pickkeys["master"] >= 1) and (color ~= "master") and (color ~= "pure") and (spend ~= "master") and (spend ~= "pure") then
                return {"master", 1, layer - 1, 0, layeri},true
            end
            if mastermode and (pickkeys["master"] <= -1) and (color ~= "master") and (color ~= "pure") and (spend ~= "master") and (spend ~= "pure") then
                return {"master", -1, layer + 1, 0, layeri},true
            end
            if (layer == 0) then
                return "no"
            end
			if (color == "rainbow") then
				if spend == "rainbow" then
					local valid = updaterainbowtable(tabler, tablei, count, doortype)
					if valid then
						return {spend, 0, thenext, 0, layeri, tabler, tablei},false
					else
						return "no"
					end
				else
					local spendr, spendi = rainbowlock(count, doortype)
					if spendr == "no" then
						return "no"
					end
					return {spend, spendr, thenext, spendi, layeri},false
				end
			elseif count >= 0 then
				if (keycount >= count) and (doortype == "normal") then
                    return {spend, count, thenext, 0, layeri},false
                elseif ((keycount == 0) and (keycounti == 0)) and (doortype == "blank") then
                    return {spend, 0, thenext, 0, layeri},false
                elseif (keycount >= 1) and (doortype == "blast") then
                    return {spend, keycount, thenext, 0, layeri},false
                elseif (keycounti >= count) and (doortype == "i") then
                    return {spend, 0, thenext, count, layeri},false
                elseif (keycounti >= 1) and (doortype == "blasti") then
                    return {spend, 0, thenext, keycounti, layeri},false
                elseif ((keycount ~= 0) or (keycounti ~= 0)) and (doortype == "all") then
                    return {spend, keycount, thenext, keycounti, layeri},false
				elseif (doortype == "infinity") then
					return "no"
                else
                    return "no"
                end
            else
                if (keycount <= count) and (doortype == "normal") then
                    return {spend, count, thenext, 0, layeri},false
                elseif ((keycount == 0) and (keycounti == 0)) and (doortype == "blank") then
                    return {spend, 0, thenext, 0, layeri},false
                elseif (keycount <= -1) and (doortype == "blast") then
                    return {spend, keycount, thenext, 0, layeri},false
                elseif (keycounti <= count) and (doortype == "i") then
                    return {spend, 0, thenext, count, layeri},false
                elseif (keycounti <= -1) and (doortype == "blasti") then
                    return {spend, 0, thenext, keycounti, layeri},false
                elseif ((keycount ~= 0) or (keycounti ~= 0)) and (doortype == "all") then
                    return {spend, keycount, thenext, keycounti, layeri},false
				elseif (doortype == "infinity") then
					return "no"
                else
                    return "no"
                end
            end
        else
            local sync = combosync[id]
            local spendcolor = combodata[sync][1]
            if spendcolor == "glitch" then
                spendcolor = glitchlocks[id][1]
            end
            local aura = combodata[sync][2]
            local layer = combodata[sync][3]
            local layeri = combodata[sync][4]
            local spendcount = 0
            local spendcounti = 0
            local thenext = layer - 1
            if (layer < 0) then
                thenext = layer + 1
            end
            if pickkeys[spendcolor] == nil then
                pickkeys[spendcolor] = 0
            end
            if pickkeysi[spendcolor] == nil then
                pickkeysi[spendcolor] = 0
            end
            if (aura ~= nil) and (aura ~= 0) then
                return "no"
            end
            local valid = true
            local foundpure = false
            if (spendcolor == "pure") or (spendcolor == "master") then
                foundpure = true
            end
            if pickkeys[spendcolor] == nil then
                pickkeys[spendcolor] = 0
            end
            for i, j in pairs(comboreq[sync]) do
                local color = j[1]
                if color == "glitch" then
                    color = glitchlocks[id][i + 1]
                end
                local count = j[2]
				if grayed[sync] == true then
					count = count * -1
				end
                if (layer < 0) then
                    count = count * -1
                end
                local doortype = j[3]
                local keycount = pickkeys[color]
                local keycounti = pickkeysi[color]
                if (keycount == nil) or (keycounti == nil) then
                    pickkeys[color] = 0
                    pickkeysi[color] = 0
                    keycount = 0
                    keycounti = 0
                end
                if (color == "pure") or (color == "master") then
                    foundpure = true
                end
				if (color == "rainbow") then
					if spend == "rainbow" then
						valid = updaterainbowtable(tabler, tablei, count, doortype)
					else
						local spendr, spendi = rainbowlock(count, doortype)
						if (spendr ~= "no") then
							spendcount = spendcount + spendr
							spendcounti = spendcounti + spendi
						else
							valid = false
						end
					end
                elseif count >= 0 then
                    if (keycount >= count) and (doortype == "normal") then
                        spendcount = spendcount + count
                    elseif ((keycount == 0) and (keycounti == 0)) and (doortype == "blank") then

                    elseif (keycount >= 1) and (doortype == "blast") then
                        spendcount = spendcount + keycount
                    elseif (keycounti >= count) and (doortype == "i") then
                        spendcounti = spendcounti + count
                    elseif (keycount >= 1) and (doortype == "blasti") then
                        spendcounti = spendcounti + keycounti
                    elseif ((keycount ~= 0) or (keycounti ~= 0)) and (doortype == "all") then
                        spendcounti = spendcounti + keycounti
                        spendcount = spendcount + keycount
					elseif (doortype == "infinity") then
						valid = false
                    else
                        valid = false
                    end
                else
                    if (keycount <= count) and (doortype == "normal") then
                        spendcount = spendcount + count
                    elseif ((keycount == 0) and (keycounti == 0)) and (doortype == "blank") then

                    elseif (keycount <= -1) and (doortype == "blast") then
                        spendcount = spendcount + keycount
                    elseif (keycounti <= count) and (doortype == "i") then
                        spendcounti = spendcounti + count
                    elseif (keycount <= 1) and (doortype == "blasti") then
                        spendcounti = spendcounti + keycounti
                    elseif ((keycount ~= 0) or (keycounti ~= 0)) and (doortype == "all") then
                        spendcounti = spendcounti + keycounti
                        spendcount = spendcount + keycount
					elseif (doortype == "infinity") then
						valid = false
                    else
                        valid = false
                    end
                end
            end
            if mastermode and (pickkeys["master"] >= 1) and (spendcolor ~= "master") and (spendcolor ~= "pure") and not foundpure then
                return {"master", 1, layer - 1, 0, layeri},true
            end
            if mastermode and (pickkeys["master"] <= -1) and (spendcolor ~= "master") and (spendcolor ~= "pure") and not foundpure then
                return {"master", -1, layer + 1, 0, layeri},true
            end
            if (layer == 0) then
                return "no"
            end
            if valid then
                return {spendcolor, spendcount, thenext, spendcounti, layeri, tabler, tablei},false
            else
                return "no"
            end
        end
    else
        if combosync[id] == nil then
            local color = doordata[id][1]
            if color == "glitch" then
                color = glitchlocks[id][2]
            end
            local count = doordata[id][2]
			if grayed[id] == true then
				count = count * -1
			end
            local doortype = doordata[id][3]
            local spend = doordata[id][4]
            if spend == "glitch" then
                spend = glitchlocks[id][1]
            end
            local layer = layers[id]
            local layeri = layersi[id]
            local thenext = layeri - 1
            if (layeri < 0) then
                thenext = layeri + 1
                count = count * -1
            end
            local keycount = pickkeys[color]
            local keycounti = pickkeysi[color]
            if pickkeys[spend] == nil then
                pickkeys[spend] = 0
            end
            if pickkeysi[spend] == nil then
                pickkeysi[spend] = 0
            end
            if keycount == nil then
                pickkeys[color] = 0
                keycount = 0
            end
            if mastermode and (pickkeysi["master"] >= 1) and (color ~= "master") and (color ~= "pure") and (spend ~= "master") and (spend ~= "pure") then
                return {"master", 0, layer, 1, layeri - 1},true
            end
            if mastermode and (pickkeysi["master"] <= -1) and (color ~= "master") and (color ~= "pure") and (spend ~= "master") and (spend ~= "pure") then
                return {"master", 0, layer, -1, layeri + 1},true
            end
            if (layeri == 0) then
                return "no"
            end
            if doortype == "normal" then
                doortype = "i"
            elseif doortype == "blast" then
                doortype = "blasti"
            elseif doortype == "i" then
                doortype = "normal"
                count = count * -1
            elseif doortype == "blasti" then
                doortype = "blast"
                count = count * -1
            end
            
			if (color == "rainbow") then
				if spend == "rainbow" then
					local valid = updaterainbowtable(tabler, tablei, count, doortype)
					if valid then
						return {spend, 0, thenext, 0, layeri, tabler, tablei},false
					else
						return "no"
					end
				else
					local spendr, spendi = rainbowlock(count, doortype)
					if spendr == "no" then
						return "no"
					end
					return {spend, spendr, thenext, spendi, layeri},false
				end
			elseif count >= 0 then
				if (keycount >= count) and (doortype == "normal") then
                    return {spend, count, layer, 0, thenext},false
                elseif ((keycount == 0) and (keycounti == 0)) and (doortype == "blank") then
                    return {spend, 0, layer, 0, layeri - 1},false
                elseif (keycount >= 1) and (doortype == "blast") then
                    return {spend, keycount, layer, 0, thenext},false
                elseif (keycounti >= count) and (doortype == "i") then
                    return {spend, 0, layer, count, thenext},false
                elseif (keycounti >= 1) and (doortype == "blasti") then
                    return {spend, 0, layer, keycounti, thenext},false
                elseif ((keycount ~= 0) or (keycounti ~= 0)) and (doortype == "all") then
                    return {spend, keycount, layer, keycounti, thenext},false
				elseif (doortype == "infinity") then
					return "no"
                else
                    return "no"
                end
            else
                if (keycount <= count) and (doortype == "normal") then
                    return {spend, count, layer, 0, thenext},false
                elseif ((keycount == 0) and (keycounti == 0)) and (doortype == "blank") then
                    return {spend, 0, layer, 0, thenext},false
                elseif (keycount <= -1) and (doortype == "blast") then
                    return {spend, keycount, layer, 0, thenext},false
                elseif (keycounti <= count) and (doortype == "i") then
                    return {spend, 0, layer, count, thenext},false
                elseif (keycounti <= -1) and (doortype == "blasti") then
                    return {spend, 0, layer, keycounti, thenext},false
                elseif ((keycount ~= 0) or (keycounti ~= 0)) and (doortype == "all") then
                    return {spend, keycount, layer, keycounti, thenext},false
				elseif (doortype == "infinity") then
					return "no"
                else
                    return "no"
                end
            end
        else
            local sync = combosync[id]
            local spendcolor = combodata[sync][1]
            if spendcolor == "glitch" then
                spendcolor = glitchlocks[id][1]
            end
            local aura = combodata[sync][2]
            local layer = combodata[sync][3]
            local layeri = combodata[sync][4]
            local thenext = layeri - 1
            if (layeri < 0) then
                thenext = layeri + 1
            end
            local spendcount = 0
            local spendcounti = 0
            if pickkeys[spendcolor] == nil then
                pickkeys[spendcolor] = 0
            end
            if pickkeysi[spendcolor] == nil then
                pickkeysi[spendcolor] = 0
            end
            if (aura ~= nil) and (aura ~= 0) then
                return "no"
            end
            local valid = true
            local foundpure = false
            if (spendcolor == "pure") or (spendcolor == "master") then
                foundpure = true
            end
            if pickkeys[spendcolor] == nil then
                pickkeys[spendcolor] = 0
            end
            for i, j in pairs(comboreq[sync]) do
                local color = j[1]
                if color == "glitch" then
                    color = glitchlocks[id][i + 1]
                end
                local count = j[2]
				if grayed[sync] == true then
					count = count * -1
				end
                if (layeri < 0) then
                    count = count * -1
                end
                local doortype = j[3]
                local keycount = pickkeys[color]
                local keycounti = pickkeysi[color]
                if keycount == nil then
                    pickkeys[color] = 0
                    pickkeysi[color] = 0
                    keycount = 0
                    keycounti = 0
                end
                if (color == "pure") or (color == "master") then
                    foundpure = true
                end
                if doortype == "normal" then
                    doortype = "i"
                elseif doortype == "blast" then
                    doortype = "blasti"
                elseif doortype == "i" then
                    doortype = "normal"
                    count = count * -1
                elseif doortype == "blasti" then
                    doortype = "blast"
                    count = count * -1
                end
                if (color == "rainbow") then
					if spend == "rainbow" then
						valid = updaterainbowtable(tabler, tablei, count, doortype)
					else
						local spendr, spendi = rainbowlock(count, doortype)
						if (spendr ~= "no") then
							spendcount = spendcount + spendr
							spendcounti = spendcounti + spendi
						else
							valid = false
						end
					end
                elseif count >= 0 then
                    if (keycount >= count) and (doortype == "normal") then
                        spendcount = spendcount + count
                    elseif ((keycount == 0) and (keycounti == 0)) and (doortype == "blank") then
    
                    elseif (keycount >= 1) and (doortype == "blast") then
                        spendcount = spendcount + keycount
                    elseif (keycounti >= count) and (doortype == "i") then
                        spendcounti = spendcounti + count
                    elseif (keycount >= 1) and (doortype == "blasti") then
                        spendcounti = spendcounti + keycounti
                    elseif ((keycount ~= 0) or (keycounti ~= 0)) and (doortype == "all") then
                        spendcounti = spendcounti + keycounti
                        spendcount = spendcount + keycount
					elseif (doortype == "infinity") then
						valid = false
                    else
                        valid = false
                    end
                else
                    if (keycount <= count) and (doortype == "normal") then
                        spendcount = spendcount + count
                    elseif ((keycount == 0) and (keycounti == 0)) and (doortype == "blank") then
    
                    elseif (keycount <= -1) and (doortype == "blast") then
                        spendcount = spendcount + keycount
                    elseif (keycounti <= count) and (doortype == "i") then
                        spendcounti = spendcounti + count
                    elseif (keycount <= -1) and (doortype == "blasti") then
                        spendcounti = spendcounti + keycounti
                    elseif ((keycount ~= 0) or (keycounti ~= 0)) and (doortype == "all") then
                        spendcounti = spendcounti + keycounti
                        spendcount = spendcount + keycount
					elseif (doortype == "infinity") then
						valid = false
                    else
                        valid = false
                    end
                end
            end
            if mastermode and (pickkeysi["master"] >= 1) and (spendcolor ~= "master") and (spendcolor ~= "pure") and not foundpure then
                return {"master", 0, layer, 1, layeri - 1},true
            end
            if mastermode and (pickkeysi["master"] <= -1) and (spendcolor ~= "master") and (spendcolor ~= "pure") and not foundpure then
                return {"master", 0, layer, -1, layeri + 1},true
            end
            if (layeri == 0) then
                return "no"
            end
            if valid then
                return {spendcolor, spendcount, layer, spendcounti, layeri - 1, tabler, tablei},false
            else
                return "no"
            end
        end
    end
end

function comboconfig()
	local synctiles = {}
	local syncsubs = {}
	for id, sync in pairs(combosync) do
		if syncsubs[sync] == nil then
			syncsubs[sync] = {}
		end
		if synctiles[sync] == nil then
			synctiles[sync] = {}
		end
		local unitid = MF_getfixed(id)
		local unit = mmf.newObject(unitid)
		local x, y = unit.values[XPOS], unit.values[YPOS]
		local tileid = x + y * roomsizex
		local index = 1
		while (index <= #synctiles[sync]) and (synctiles[sync][index] < tileid) do
			index = index + 1
		end
		table.insert(syncsubs[sync], index, id)
		table.insert(synctiles[sync], index, tileid)
	end
	for sync, ids in pairs(syncsubs) do
		if #ids >= #comboreq[sync] then
			for i, j in ipairs(comboreq[sync]) do
				combolocks[ids[i]] = {j, "null"}
			end
			hascombolocks[sync] = 1
		end
	end
	synctiles = {}
	syncsubs = {}
	for id, sync in pairs(gatesync) do
		if syncsubs[sync] == nil then
			syncsubs[sync] = {}
		end
		if synctiles[sync] == nil then
			synctiles[sync] = {}
		end
		local unitid = MF_getfixed(id)
		local unit = mmf.newObject(unitid)
		local x, y = unit.values[XPOS], unit.values[YPOS]
		local tileid = x + y * roomsizex
		local index = 1
		while (index <= #synctiles[sync]) and (synctiles[sync][index] < tileid) do
			index = index + 1
		end
		table.insert(syncsubs[sync], index, id)
		table.insert(synctiles[sync], index, tileid)
	end
	for sync, ids in pairs(syncsubs) do
		if #ids >= #gatereq[sync] then
			for i, j in ipairs(gatereq[sync]) do
				combolocks[ids[i]] = {j, "null"}
			end
		end
	end
end

function rainbowlock(count, doortype)
	local cost = 0
	local costi = 0
	for i, j in pairs(pickkeys) do
		if (i ~= "blossom") and ((j ~= 0) or (pickkeysi[i] ~= 0)) and (j ~= nil) then
			local keycount = j
			local keycounti = pickkeysi[i]
			if keycounti == nil then
				keycounti = 0
			end
			if count >= 0 then
                if (keycount >= count) and (doortype == "normal") then
					cost = cost + count
                elseif ((keycount == 0) and (keycounti == 0)) and (doortype == "blank") then
					
                elseif (keycount >= 1) and (doortype == "blast") then
                    cost = cost + keycount
                elseif (keycounti >= count) and (doortype == "i") then
					costi = costi + count 
                elseif (keycounti >= 1) and (doortype == "blasti") then
                    costi = costi + keycounti
                elseif ((keycount ~= 0) or (keycounti ~= 0)) and (doortype == "all") then
                    costi = costi + keycounti
					cost = cost + count
				elseif (doortype == "infinity") then
					return "no"
                else
                    return "no"
                end
            else
                if (keycount <= count) and (doortype == "normal") then
					cost = cost + count
                elseif ((keycount == 0) and (keycounti == 0)) and (doortype == "blank") then
					
                elseif (keycount <= -1) and (doortype == "blast") then
                    cost = cost + keycount
                elseif (keycounti <= count) and (doortype == "i") then
					costi = costi + count 
                elseif (keycounti <= -1) and (doortype == "blasti") then
                    costi = costi + keycounti
                elseif ((keycount ~= 0) or (keycounti ~= 0)) and (doortype == "all") then
                    costi = costi + keycounti
					cost = cost + count
				elseif (doortype == "infinity") then
					return "no"
                else
                    return "no"
                end
            end
		end
	end
	return cost, costi
end

function updaterainbowtable(tabler, tablei, count, doortype)
	for i, j in pairs(pickkeys) do
		if (i ~= "blossom") and ((j ~= 0) or (pickkeysi[i] ~= 0)) and (j ~= nil) then
			local keycount = j
			local keycounti = pickkeysi[i]
			if keycounti == nil then
				keycounti = 0
			end
			if tabler[i] == nil then
				tabler[i] = 0
			end
			if tablei[i] == nil then
				tablei[i] = 0
			end
			if count >= 0 then
                if (keycount >= count) and (doortype == "normal") then
					tabler[i] = tabler[i] + count
                elseif ((keycount == 0) and (keycounti == 0)) and (doortype == "blank") then
					
                elseif (keycount >= 1) and (doortype == "blast") then
                    tabler[i] = tabler[i] + keycount
                elseif (keycounti >= count) and (doortype == "i") then
					tablei[i] = tablei[i] + count 
                elseif (keycounti >= 1) and (doortype == "blasti") then
                    tablei[i] = tablei[i] + keycounti
                elseif ((keycount ~= 0) or (keycounti ~= 0)) and (doortype == "all") then
                    tablei[i] = tablei[i] + keycounti
					tabler[i] = tabler[i] + count
				elseif (doortype == "infinity") then
					return false
                else
                    return false
                end
            else
                if (keycount <= count) and (doortype == "normal") then
					tabler[i] = tabler[i] + count
                elseif ((keycount == 0) and (keycounti == 0)) and (doortype == "blank") then
					
                elseif (keycount <= -1) and (doortype == "blast") then
                    tabler[i] = tabler[i] + keycount
                elseif (keycounti <= count) and (doortype == "i") then
					tablei[i] = tablei[i] + count 
                elseif (keycounti <= -1) and (doortype == "blasti") then
                    tablei[i] = tablei[i] + keycounti
                elseif ((keycount ~= 0) or (keycounti ~= 0)) and (doortype == "all") then
                    tablei[i] = tablei[i] + keycounti
					tabler[i] = tabler[i] + count
				elseif (doortype == "infinity") then
					return false
                else
                    return false
                end
            end
		end
	end
	return true
end

function gateclosed(unitid)
	local unit = mmf.newObject(unitid)
    if unit == nil then
        return false
    end
	local x, y = unit.values[XPOS], unit.values[YPOS]
    local id = unit.values[ID]
	if gatesync[id] ~= nil then
		local sync = gatesync[id]
		for i, j in pairs(gatesync) do
			if j == sync then
				local unitid2 = MF_getfixed(i)
				if unitid2 ~= nil then
					local unit2 = mmf.newObject(unitid2)
					local x2, y2 = unit2.values[XPOS], unit2.values[YPOS]
					local things = findallhere(x2,y2)
					for i2, j2 in pairs(things) do
						local unit3 = mmf.newObject(j2)
						local name = getname(unit3)
						if (hasfeature(name, "is", "you", j2) == true) and floating(unitid2, j2) then
							return false
						end
					end
				end
			end
		end
		for i, j in pairs(gatereq[sync]) do
			local color = j[1]
			if color == "glitch" then
				color = glitchcolor
			end
			local count = j[2]
			local doortype = j[3]
			local keycount = pickkeys[color]
			local keycounti = pickkeysi[color]
			if (keycount == nil) or (keycounti == nil) then
				pickkeys[color] = 0
				pickkeysi[color] = 0
				keycount = 0
				keycounti = 0
			end
			if count >= 0 then
				if (keycount >= count) and (doortype == "normal") then
				elseif ((keycount == 0) and (keycounti == 0)) and (doortype == "blank") then
				elseif (keycount >= 1) and (doortype == "blast") then
				elseif (keycounti >= count) and (doortype == "i") then
				elseif (keycount >= 1) and (doortype == "blasti") then
				elseif ((keycount ~= 0) or (keycounti ~= 0)) and (doortype == "all") then
				else
					return true
				end
			else
				if (keycount <= count) and (doortype == "normal") then
				elseif ((keycount == 0) and (keycounti == 0)) and (doortype == "blank") then
				elseif (keycount <= -1) and (doortype == "blast") then
				elseif (keycounti <= count) and (doortype == "i") then
				elseif (keycount <= 1) and (doortype == "blasti") then
				elseif ((keycount ~= 0) or (keycounti ~= 0)) and (doortype == "all") then
				else
					return true
				end
			end
		end
	end
	return false
end

function getkeys(x, y)
    local things = findallhere(x, y)
    local result = {}
    for i, j in pairs(things) do
        local unit = mmf.newObject(j)
        if unit ~= nil then
            local id = unit.values[ID]
            if keydata[id] ~= nil then
                table.insert(result, {j, keydata[id]})
            end
        end
    end
    return result
end

function getsigils(x, y)
    local things = findallhere(x, y)
    local result = {}
    for i, j in pairs(things) do
        local unit = mmf.newObject(j)
        if unit ~= nil then
            local id = unit.values[ID]
            if sigils[id] ~= nil then
                table.insert(result, {j, sigils[id]})
            end
        end
    end
    return result
end

function getallkeys()
	local result = {}
	if not showkeyval then
		return result
	end	
	for id, j in pairs(keydata) do
		local unitid = MF_getfixed(id)
		if unitid ~= nil then
			local unit = mmf.newObject(unitid)
			local x, y = unit.values[XPOS], unit.values[YPOS]
            x = Xoffset + (x + 1) * tilesize * spritedata.values[TILEMULT]
            y = Yoffset + (y + 1) * tilesize * spritedata.values[TILEMULT]
			local count = j[2]
			local counti = j[4]
			local keytype = j[3]
			if ((count ~= 1) or (counti ~= 0)) and ((keytype == "normal") or (keytype == "exact")) then
				local show = ""
				if counti == 0 then
					show = tostring(count)
				elseif count == 0 then
					show = tostring(counti) .. "i"
				elseif counti > 0 then
					show = tostring(count) .. "+" .. tostring(counti) .. "i"
				else
					show = tostring(count) .. "-" .. tostring(-counti) .. "i"
				end
				table.insert(result, {x, y, show, (count >= 0)})
			elseif (keytype == "signflip") then
				table.insert(result, {x, y, "x-1", true})
			elseif (keytype == "rotor") then
				table.insert(result, {x, y, "xi", true})
			elseif (keytype == "unrotor") then
				table.insert(result, {x, y, "x-i", true})
			end
		end
	end
	return result
end

function getalldoors()
	local result = {}
	if not showkeyval then
		return result
	end	
	for id, j in pairs(doordata) do
		local unitid = MF_getfixed(id)
		if unitid ~= nil then
			local unit = mmf.newObject(unitid)
			local x, y = unit.values[XPOS], unit.values[YPOS]
            x = Xoffset + (x + .5) * tilesize * spritedata.values[TILEMULT]
            y = Yoffset + (y + .5) * tilesize * spritedata.values[TILEMULT]
			local count = j[2]
			if grayed[id] then
				count = -1 * count
			end
			local doortype = j[3]
			local isblack = (j[1] == "black")
			if glitchlocks[id] ~= nil then
				isblack = (isblack or (glitchlocks[id][2] == "black"))
			end
			local iswhite = (j[1] == "white")
			if glitchlocks[id] ~= nil then
				iswhite = (iswhite or (glitchlocks[id][2] == "white"))
			end
			if imode then
                if doortype == "normal" then
                    doortype = "i"
                elseif doortype == "blast" then
                    doortype = "blasti"
                elseif doortype == "i" then
                    doortype = "normal"
                    count = count * -1
                elseif doortype == "blasti" then
                    doortype = "blast"
                    count = count * -1
                end
			end
			local valid = false
			if imode then
				valid = (layersi[id] ~= 0)
				if (layersi[id] < 0) then
					count = count * -1
				end
			else
				valid = (layers[id] ~= 0)
				if (layers[id] < 0) then
					count = count * -1
				end
			end
			local colorval = 0
			if (count >= 0) or not valid then
				colorval = 1
			else
				colorval = 2
			end
			if iswhite and (colorval == 2) then
				if doortype == "normal" then
					colorval = 1
				else
					colorval = 3
				end
			end
			if isblack and (colorval == 1) then
				if doortype == "normal" then
					colorval = 2
				else
					colorval = 4
				end
			end
			if valid then
				if ((count ~= 1) or addlocks) and (doortype == "normal") then
					table.insert(result, {x, y, tostring(count), colorval})
				elseif (count == -1) and (doortype == "blast") then
					table.insert(result, {x, y, "X", colorval})
				elseif (doortype == "i") then
					table.insert(result, {x, y, tostring(count) .. "i", colorval})
				elseif (count == -1) and (doortype == "blasti") then
					table.insert(result, {x, y, "+", colorval})
				elseif (count == 1) and (doortype == "blasti") and addlocks then
					table.insert(result, {x, y, "+", colorval})
				elseif (count == 1) and (doortype == "blast") and addlocks then
					table.insert(result, {x, y, "x", colorval})
				elseif (count == 1) and (doortype == "all") and addlocks then
					table.insert(result, {x, y, "A", colorval})
				end
			else
				table.insert(result, {x, y, "-", colorval})
			end
		end
	end	
	for id, j in pairs(combolocks) do
		local unitid = MF_getfixed(id)
		if unitid ~= nil then
			local unit = mmf.newObject(unitid)
			local x, y = unit.values[XPOS], unit.values[YPOS]
            x = Xoffset + (x + .5) * tilesize * spritedata.values[TILEMULT]
            y = Yoffset + (y + .5) * tilesize * spritedata.values[TILEMULT]
			local count = j[1][2]
			if grayed[id] then
				count = -1 * count
			end
			local doortype = j[1][3]
			local isblack = (j[1][1] == "black")
			if glitchlocks[id] ~= nil then
				isblack = (isblack or (glitchlocks[id][2] == "black"))
			end
			local iswhite = (j[1][1] == "white")
			if glitchlocks[id] ~= nil then
				iswhite = (iswhite or (glitchlocks[id][2] == "white"))
			end
			local sync = combosync[id]
			local valid = true
			if sync ~= nil then
				if imode then
					if doortype == "normal" then
						doortype = "i"
					elseif doortype == "blast" then
						doortype = "blasti"
					elseif doortype == "i" then
						doortype = "normal"
						count = count * -1
					elseif doortype == "blasti" then
						doortype = "blast"
						count = count * -1
					end
				end
				valid = false
				if imode then
					valid = (combodata[sync][4] ~= 0)
					if (combodata[sync][4] < 0) then
						count = count * -1
					end
				else
					valid = (combodata[sync][3] ~= 0)
					if (combodata[sync][3] < 0) then
						count = count * -1
					end
				end
			end
			local colorval = 0
			if (count >= 0) or not valid then
				colorval = 1
			else
				colorval = 2
			end
			if iswhite and (colorval == 2) then
				if doortype == "normal" then
					colorval = 1
				else
					colorval = 3
				end
			end
			if isblack and (colorval == 1) then
				if doortype == "normal" then
					colorval = 2
				else
					colorval = 4
				end
			end
			if valid then
				if ((count ~= 1) or addlocks) and (doortype == "normal") then
					table.insert(result, {x, y, tostring(count), colorval})
				elseif (count == -1) and (doortype == "blast") then
					table.insert(result, {x, y, "X", colorval})
				elseif (doortype == "i") then
					table.insert(result, {x, y, tostring(count) .. "i", colorval})
				elseif (count == -1) and (doortype == "blasti") then
					table.insert(result, {x, y, "+", colorval})
				elseif (count == 1) and (doortype == "blasti") and addlocks then
					table.insert(result, {x, y, "+", colorval})
				elseif (count == 1) and (doortype == "blast") and addlocks then
					table.insert(result, {x, y, "x", colorval})
				elseif (count == 1) and (doortype == "all") and addlocks then
					table.insert(result, {x, y, "A", colorval})
				end
			else
				table.insert(result, {x, y, "-", colorval})
			end
		end
	end
	for sync, j in pairs(combodata) do
		local id = showlayer[sync]
		local unitid = MF_getfixed(id)
		if unitid ~= nil and (hascombolocks[sync] ~= 1) then
			local unit = mmf.newObject(unitid)
			local x, y = unit.values[XPOS], unit.values[YPOS]
            x = Xoffset + (x + .5) * tilesize * spritedata.values[TILEMULT]
            y = Yoffset + (y + .5) * tilesize * spritedata.values[TILEMULT]
			local isblack = (j[1] == "black")
			if glitchlocks[id] ~= nil then
				isblack = (isblack or (glitchlocks[id][2] == "black"))
			end
			local valid = false
			if imode then
				valid = (combodata[sync][4] ~= 0)
				if (combodata[sync][4] < 0) then
					count = count * -1
				end
			else
				valid = (combodata[sync][3] ~= 0)
				if (combodata[sync][3] < 0) then
					count = count * -1
				end
			end
			local colorval = 1
			if isblack then
				colorval = 2
			end
			if valid then
				table.insert(result, {x, y, "C", colorval})
			else
				table.insert(result, {x, y, "-", colorval})
			end
		elseif unitid ~= nil and (#comboreq[sync] == 0) then
			local unit = mmf.newObject(unitid)
			local x, y = unit.values[XPOS], unit.values[YPOS]
            x = Xoffset + (x + .5) * tilesize * spritedata.values[TILEMULT]
            y = Yoffset + (y + .5) * tilesize * spritedata.values[TILEMULT]
			local isblack = (j[1] == "black")
			if glitchlocks[id] ~= nil then
				isblack = (isblack or (glitchlocks[id][2] == "black"))
			end
			local valid = false
			if imode then
				valid = (combodata[sync][4] ~= 0)
				if (combodata[sync][4] < 0) then
					count = count * -1
				end
			else
				valid = (combodata[sync][3] ~= 0)
				if (combodata[sync][3] < 0) then
					count = count * -1
				end
			end
			local colorval = 1
			if isblack then
				colorval = 2
			end
			if valid then
				table.insert(result, {x, y, "L", colorval})
			else
				table.insert(result, {x, y, "-", colorval})
			end
		end
	end
	return result
end

function getalldoorlocks()
	local result = {}
	if not addlocks then
		return result
	end	
	for id, j in pairs(doordata) do
		local unitid = MF_getfixed(id)
		if unitid ~= nil then
			local unit = mmf.newObject(unitid)
			local x, y = unit.values[XPOS], unit.values[YPOS]
            x = Xoffset + (x + .5) * tilesize * spritedata.values[TILEMULT]
            y = Yoffset + (y + .5) * tilesize * spritedata.values[TILEMULT]
			local spend = j[4]
			local norm = j[1]
			if spend ~= norm then
				if (norm == "glitch") then
					norm = glitchlocks[id][2]
				end
				local color = lookup2[norm]
				if color == nil then
					color = {0,3}
				end
				table.insert(result, {unitid, color})
			end
		end
	end
	for id, j in pairs(combolocks) do
		local unitid = MF_getfixed(id)
		if unitid ~= nil then
			local unit = mmf.newObject(unitid)
			local x, y = unit.values[XPOS], unit.values[YPOS]
            x = Xoffset + (x + .5) * tilesize * spritedata.values[TILEMULT]
            y = Yoffset + (y + .5) * tilesize * spritedata.values[TILEMULT]
			local spend = j[2]
			local norm = j[1][1]
			if spend ~= norm then
				if (norm == "glitch") then
					if glitchlocks[id][2] ~= nil then
						norm = glitchlocks[id][2]
					else
						norm = glitchcolor
					end
				end
				local color = lookup2[norm]
				if color == nil then
					color = {0,3}
				end
				table.insert(result, {unitid, color})
			end
		end
	end
	return result
end

function getallkeyslevel()
	for id, j in pairs(keydata) do
		local unitid = MF_getfixed(id)
		if unitid ~= nil then
			local unit = mmf.newObject(unitid)
			local x, y = unit.values[XPOS], unit.values[YPOS]
            x = Xoffset + (x + 1) * tilesize * spritedata.values[TILEMULT]
            y = Yoffset + (y + 1) * tilesize * spritedata.values[TILEMULT]
			local inf = j[5]
			if (not inf) and floating_level(unitid) then
				local color = j[1]
				local count = j[2]
				local kind = j[3]
				local counti = j[4]
				addundo({"updatekey", color, pickkeys[color], pickkeysi[color]})
				if (kind == "exact") then
					if starval[color] ~= true then
						pickkeys[color] = count
						pickkeysi[color] = counti
					end
				elseif (kind == "signflip") then
					if starval[color] ~= true then
						pickkeys[color] = pickkeys[color] * -1
						pickkeysi[color] = pickkeysi[color] * -1
					end
				elseif (kind == "star") then
					if starval[color] ~= true then
						addundo({"updatestar",color,"ignore"})
						starval[color] = true
					end
				elseif (kind == "unstar") then
					if starval[color] == true then
						addundo({"updatestar",color,"ignore"})
						starval[color] = false
					end
				elseif (kind == "rotor") then
					if starval[color] ~= true then
						local temp = pickkeys[color]
						pickkeys[color] = -1 * pickkeysi[color]
						pickkeysi[color] = temp
					end
				elseif (kind == "unrotor") then
					if starval[color] ~= true then
						local temp = pickkeys[color]
						pickkeys[color] = pickkeysi[color]
						pickkeysi[color] = -temp
					end
				else
					if starval[color] ~= true then
						pickkeys[color] = pickkeys[color] + count
						pickkeysi[color] = pickkeysi[color] + counti
					end
				end
				updateundo = true		
				local pmult,sound = checkeffecthistory("bonus")
				MF_particles("bonus",unit.values[XPOS],unit.values[YPOS],10 * pmult,4,1,1,1)
				generaldata.values[SHAKE] = 2
				delete(unitid)
			end
		end
	end
end

function doauras(x, y,num)
    local things = {findallhere(x, y + 1), findallhere(x, y - 1), findallhere(x + 1, y), findallhere(x - 1, y)}
    for i, j0 in pairs(things) do
        for i2, j in pairs(j0) do
            local unit = mmf.newObject(j)
            if unit ~= nil then
                local id = unit.values[ID]
                if (auras[id] ~= nil) and (auras[id] ~= 0) then
                    if ((auras[id] // num) % 2) == 1 then
                        addundo({"updateaura", id, auras[id]})
                        auras[id] = auras[id] - num
                        updateundo = true
                    end
                elseif (combosync[id] ~= nil) and (combodata[combosync[id]][2] ~= nil) and (combodata[combosync[id]][2] ~= 0) then
                    if ((combodata[combosync[id]][2] // num) % 2) == 1 then
                        addundo({"updatecomboaura", combosync[id], combodata[combosync[id]][2]})
                        combodata[combosync[id]][2] = combodata[combosync[id]][2] - num
                        updateundo = true
                    end
                end
            end
        end
    end
end

function doauralevel(num)
	for id, j in pairs(auras) do
		if (j ~= nil) and (j ~= 0) then
			if ((auras[id] // num) % 2) == 1 then
				addundo({"updateaura", id, j})
				auras[id] = auras[id] - num
				updateundo = true
			end
		end
	end
	for id, j in pairs(combosync) do
		if (j ~= nil) and (combodata[j][2] ~= nil) and (combodata[j][2] ~= 0) then
			if ((combodata[j][2] // num) % 2) == 1 then
				addundo({"updatecomboaura", j, combodata[j][2]})
				combodata[j][2] = combodata[j][2] - num
				updateundo = true
			end
		end
	end
end

function applybrownkeys(x,y,num)
    local things = {findallhere(x, y + 1), findallhere(x, y - 1), findallhere(x + 1, y), findallhere(x - 1, y)}
    for i, j0 in pairs(things) do
        for i2, j in pairs(j0) do
            local unit = mmf.newObject(j)
            if unit ~= nil then
                local id = unit.values[ID]
                if (doordata[id] ~= nil) and (doordata[id][1] ~= "pure") and (doordata[id][4] ~= "pure") then
                    if (num == 1) and (iscursed[id] ~= true) then
                        addundo({"updatecolor", id, doordata[id][1]})
                        addundo({"updatecolorspend", id, doordata[id][4]})
                        addundo({"flipbrownkey", id})
                        doordata[id][1] = "brown"
                        doordata[id][4] = "brown"
                        iscursed[id] = true
                        updateundo = true
                    elseif (num == -1) and (iscursed[id] == true) then
                        addundo({"updatecolor", id, doordata[id][1]})
                        addundo({"updatecolorspend", id, doordata[id][4]})
                        addundo({"flipbrownkey", id})
                        doordata[id][1] = cursed[id][1]
                        doordata[id][4] = cursed[id][2]
                        iscursed[id] = false
                        updateundo = true
                    end
                    resetdoordisplay(id)
                elseif (combosync[id] ~= nil) then
                    local sync = combosync[id]
                    local valid = ((combodata[sync][1] ~= "pure") and ((combodata[sync][1] ~= "glitch") or (glitchlocks[id][1] ~= "pure")))
                    if valid then
                        for i3,j3 in pairs(comboreq[sync]) do
                            if (j3[1] == "pure") or ((glitchlocks[id][i3 + 1] == "pure") and (j3[1] == "glitch")) then
                                valid = false
                            end
                        end
                    end
                    if valid then
                        if (num == 1) and (comboiscursed[sync] ~= true) then
                            addundo({"updatecombocolorspend", sync, combodata[sync][1]})
                            addundo({"flipcombobrownkey", sync})
                            combodata[sync][1] = "brown"
                            comboiscursed[sync] = true
                            for i3, j3 in pairs(comboreq[sync]) do
                                addundo({"updatecombocolor", sync, i3, comboreq[sync][i3][1]})
                                comboreq[sync][i3][1] = "brown"
                            end
                            updateundo = true
                        elseif (num == -1) and (comboiscursed[sync] == true) then
                            addundo({"updatecombocolorspend", sync, combodata[sync][1]})
                            addundo({"flipcombobrownkey", sync})
                            combodata[sync][1] = combocursed[sync][1]
                            comboiscursed[sync] = false
                            for i3, j3 in pairs(comboreq[sync]) do
                                addundo({"updatecombocolor", sync, i3, comboreq[sync][i3][1]})
                                comboreq[sync][i3][1] = combocursed[sync][i3 + 1]
                            end
                            updateundo = true
                        end
                        resetcombodisplay(sync)
                    end
                end
            end
        end
    end
end

function applygraykeys(x,y,num)
    local things = {findallhere(x, y + 1), findallhere(x, y - 1), findallhere(x + 1, y), findallhere(x - 1, y)}
    for i, j0 in pairs(things) do
        for i2, j in pairs(j0) do
            local unit = mmf.newObject(j)
            if unit ~= nil then
                local id = unit.values[ID]
                if (doordata[id] ~= nil) and (doordata[id][1] ~= "pure") and (doordata[id][4] ~= "pure") then
                    if (num == 1) and (grayed[id] ~= true) then
                        addundo({"graydoornegate", id})
                        grayed[id] = true
                        updateundo = true
                    elseif (num == -1) and (grayed[id] == true) then
                        addundo({"graydoornegate", id})
                        grayed[id] = false
                        updateundo = true
                    end
                    resetdoordisplay(id)
                elseif (combosync[id] ~= nil) then
                    local sync = combosync[id]
                    local valid = ((combodata[sync][1] ~= "pure") and ((combodata[sync][1] ~= "glitch") or (glitchlocks[id][1] ~= "pure")))
                    if valid then
                        for i3,j3 in pairs(comboreq[sync]) do
                            if (j3[1] == "pure") or ((glitchlocks[id][i3 + 1] == "pure") and (j3[1] == "glitch")) then
                                valid = false
                            end
                        end
                    end
                    if valid then
                        if (num == 1) and (comboisgray[sync] ~= true) then
							addundo({"graycombonegate", sync})
							comboisgray[sync] = true
							updateundo = true
                        elseif (num == -1) and (comboisgray[sync] == true) then
							addundo({"graycombonegate", sync})
							comboisgray[sync] = false
							updateundo = true
                        end
                        resetcombodisplay(sync)
                    end
                end
            end
        end
    end
end

function applybrownkeyslevel(num)
	for id, j in pairs(doordata) do
		if (j ~= nil) and (j[1] ~= "pure") and (j[4] ~= "pure") then
			if (num == 1) and (iscursed[id] ~= true) then
				addundo({"updatecolor", id, j[1]})
				addundo({"updatecolorspend", id, j[4]})
				addundo({"flipbrownkey", id})
				j[1] = "brown"
				j[4] = "brown"
				iscursed[id] = true
				updateundo = true
			elseif (num == -1) and (iscursed[id] == true) then
				addundo({"updatecolor", id, j[1]})
				addundo({"updatecolorspend", id, j[4]})
				addundo({"flipbrownkey", id})
				j[1] = cursed[id][1]
				j[4] = cursed[id][2]
				iscursed[id] = false
				updateundo = true
			end
			resetdoordisplay(id)
		end
	end
	for id, sync in pairs(combosync) do
		local valid = ((combodata[sync][1] ~= "pure") and ((combodata[sync][1] ~= "glitch") or (glitchlocks[id][1] ~= "pure")))
		if valid then
			for i3,j3 in pairs(comboreq[sync]) do
				if (j3[1] == "pure") or ((glitchlocks[id][i3 + 1] == "pure") and (j3[1] == "glitch")) then
					valid = false
				end
			end
		end
		if valid then
			if (num == 1) and (comboiscursed[sync] ~= true) then
				addundo({"updatecombocolorspend", sync, combodata[sync][1]})
				addundo({"flipcombobrownkey", sync})
				combodata[sync][1] = "brown"
				comboiscursed[sync] = true
				for i3, j3 in pairs(comboreq[sync]) do
					addundo({"updatecombocolor", sync, i3, comboreq[sync][i3][1]})
					comboreq[sync][i3][1] = "brown"
				end
				updateundo = true
			elseif (num == -1) and (comboiscursed[sync] == true) then
				addundo({"updatecombocolorspend", sync, combodata[sync][1]})
				addundo({"flipcombobrownkey", sync})
				combodata[sync][1] = combocursed[sync][1]
				comboiscursed[sync] = false
				for i3, j3 in pairs(comboreq[sync]) do
					addundo({"updatecombocolor", sync, i3, comboreq[sync][i3][1]})
					comboreq[sync][i3][1] = combocursed[sync][i3 + 1]
				end
				updateundo = true
			end
			resetcombodisplay(sync)
		end
	end
end

function applygraykeyslevel(num)
	for id, j in pairs(doordata) do
		if (j ~= nil) and (j[1] ~= "pure") and (j[4] ~= "pure") then
			if (num == 1) and (grayed[id] ~= true) then
				addundo({"graydoornegate", id})
				grayed[id] = true
				updateundo = true
			elseif (num == -1) and (grayed[id] == true) then
				addundo({"graydoornegate", id})
				grayed[id] = false
				updateundo = true
			end
			resetdoordisplay(id)
		end
	end
	for id, sync in pairs(combosync) do
		local valid = ((combodata[sync][1] ~= "pure") and ((combodata[sync][1] ~= "glitch") or (glitchlocks[id][1] ~= "pure")))
		if valid then
			for i3,j3 in pairs(comboreq[sync]) do
				if (j3[1] == "pure") or ((glitchlocks[id][i3 + 1] == "pure") and (j3[1] == "glitch")) then
					valid = false
				end
			end
		end
		if valid then
			if (num == 1) and (comboisgray[sync] ~= true) then
				addundo({"graycombonegate", sync})
				comboisgray[sync] = true
				updateundo = true
			elseif (num == -1) and (comboisgray[sync] == true) then
				addundo({"graycombonegate", sync})
				comboisgray[sync] = false
				updateundo = true
			end
			resetcombodisplay(sync)
		end
	end
end

function getdisplays(x, y)
    local things = findallhere(x, y)
    local result = {}
    local isdoor = {}
    if inbounds(x,y,1) then
        for i, j in pairs(things) do
            local unit = mmf.newObject(j)
            if unit ~= nil then
                local id = unit.values[ID]
                if keydata[id] ~= nil then
                    table.insert(result, datanames[id])
                    table.insert(isdoor, false)
                end
                if doordata[id] ~= nil then
                    table.insert(result, datanames[id])
                    table.insert(isdoor, true)
                    ---- AURAS ----
                    -- 1 - frozen
                    -- 2 - erroded
                    -- 4 - painted
                    ---------------
                    if (auras[id] ~= 0) and (auras[id] ~= nil) then
                        local str = " (" .. lookup1[auras[id]] .. ")"
                        result[#result] = result[#result] .. str
                    end
                end
            end
        end
    end
    return result, isdoor
end

function getcombodisplays(x, y)
    local things = findallhere(x, y)
    local result = {}
    if inbounds(x,y,1) then
        for i, j in pairs(things) do
            local unit = mmf.newObject(j)
            if unit ~= nil then
                local id = unit.values[ID]
                local sync = combosync[id]
                if (sync ~= nil) and (combodisplay[sync] ~= nil) then
                    table.insert(result, combodisplay[sync])
                end
				local sync2 = gatesync[id]
                if (sync2 ~= nil) and (gatedisplay[sync2] ~= nil) then
                    table.insert(result, gatedisplay[sync2])
                end
            end
        end
    end
    return result
end

function resetcombodisplay(sync)
    if showlayer[sync] ~= nil then
        local result = {}
        local combos = (#comboreq[sync]) + 1
		if combos == 1 then
			combos = 2
		end
        local i = 1
        while i <= combos do
            table.insert(result, getcomboname(showlayer[sync], sync,i))
            i = i + 1
        end
        combodisplay[sync] = result
    end
end

function resetgatedisplay(sync)
	local result = {}
	local combos = (#gatereq[sync]) + 1
	local i = 1
	while i <= combos do
		table.insert(result, getgatename(sync,i))
		i = i + 1
	end
	gatedisplay[sync] = result
end

function resetdoordisplay(id)
    local showcolor = doordata[id][1]
    local visual1 = showcolor
    local visual2 = doordata[id][4]
    if (glitchlocks[id][2] ~= nil) and (glitchlocks[id][2] ~= "glitch") then
        if showcolor == "glitch" then
            visual1 = glitchlocks[id][2] .. "(G)"
        end
	end
	if (glitchlocks[id][1] ~= nil) and (glitchlocks[id][1] ~= "glitch")then
        if doordata[id][4] == "glitch" then
            visual2 = glitchlocks[id][1] .. "(G)"
        end
    end
    if (showcolor ~= doordata[id][4]) then
        if shorthand[visual1] ~= nil then
            visual1 = shorthand[visual1]
        end
        if shorthand[visual2] ~= nil then
            visual2 = shorthand[visual2]
        end
        if (showcolor == "glitch") and (glitchlocks[id][1] ~= nil) and (glitchlocks[id][2] ~= "glitch") and (shorthand[glitchlocks[id][2]] ~= nil) then
            visual1 = shorthand[glitchlocks[id][2]] .. "(G)"
        end
        if (doordata[id][4] == "glitch") and (glitchlocks[id][1] ~= nil) and (glitchlocks[id][1] ~= "glitch") and ( shorthand[glitchlocks[id][1]] ~= nil) then
            visual2 = shorthand[glitchlocks[id][1]] .. "(G)"
        end
        showcolor = visual2 .. "/" .. visual1
    else
        showcolor = visual1
    end
    if (doordata[id][3] == "blast") and (doordata[id][2] >= 0) then
		if not grayed[id] then
        	datanames[id] =  showcolor .. " X"
		else
        	datanames[id] =  showcolor .. " -X(-)"
		end
    elseif (doordata[id][3] == "blast") then
		if not grayed[id] then
        	datanames[id] =  showcolor .. " -X"
		else
        	datanames[id] =  showcolor .. " X(-)"
		end
    elseif (doordata[id][3] == "blank") then
        datanames[id] = showcolor .. " B"
    elseif (doordata[id][3] == "i") then
		if not grayed[id] then
        	datanames[id] =  showcolor .. " " .. tostring(doordata[id][2]) .. "i"
		else
        	datanames[id] =  showcolor .. " " .. tostring(-1 * doordata[id][2]) .. "i(-)"
		end
    elseif (doordata[id][3] == "blasti") and (doordata[id][2] >= 0) then
		if not grayed[id] then
        	datanames[id] =  showcolor .. " Xi"
		else
        	datanames[id] =  showcolor .. " -Xi(-)"
		end
    elseif (doordata[id][3] == "blasti") then
		if not grayed[id] then
        	datanames[id] =  showcolor .. " -Xi"
		else
        	datanames[id] =  showcolor .. " Xi(-)"
		end
    elseif (doordata[id][3] == "all") then
        datanames[id] =  showcolor .. " A"
    elseif (doordata[id][3] == "infinity") then
        datanames[id] =  showcolor .. " Inf"
    else
		if not grayed[id] then
        	datanames[id] =  showcolor .. " " .. tostring(doordata[id][2])
		else
        	datanames[id] =  showcolor .. " " .. tostring(-1 * doordata[id][2]) .. "(-)"
		end
    end
end

function resetkeydisplay(id)
    local color = keydata[id][1]
    if color == "glitch" and (glitchcolor ~= "glitch") and (keydata[id][3] ~= "omega") then
        color = glitchcolor .. "(G)"
    end
    local count = keydata[id][2]
    local counti = keydata[id][4]
    local inf = keydata[id][5]
	if inf then
		color = "(Inf) " .. color
	end
    local showcount = ""
    if counti == 0 then
        show = tostring(count)
    elseif count == 0 then
        show = tostring(counti) .. "i"
    elseif counti > 0 then
        show = tostring(count) .. "+" .. tostring(counti) .. "i"
    else
        show = tostring(count) .. "-" .. tostring(-counti) .. "i"
    end
    local keytype = keydata[id][3]
    if (keytype == "exact") then
        datanames[id] =  color .. " E" .. show
    elseif (keytype == "signflip") then
        datanames[id] =  color .. " x-1"
    elseif (keytype == "star") then
        datanames[id] =  color .. " *"
    elseif (keytype == "unstar") then
        datanames[id] =  color .. " -*"
    elseif (keytype == "rotor") then
        datanames[id] =  color .. " xi"
    elseif (keytype == "unrotor") then
        datanames[id] =  color .. " x-i"
    elseif (keytype == "omega") then
        datanames[id] =  color .. " omega"
    else
        datanames[id] = color .. " " .. show
    end
end

function getlayerdisplays()
    local result = {}
    for id, j in pairs(layers) do
        local unitid = MF_getfixed(id)
        local unit = mmf.newObject(unitid)
        if unit ~= nil then
            local x, y = unit.values[XPOS], unit.values[YPOS]
            x = Xoffset + (x + .5) * tilesize * spritedata.values[TILEMULT]
            y = Yoffset + (y) * tilesize * spritedata.values[TILEMULT]
            if (layers[id] ~= nil) and ((layers[id] ~= 1) or (layersi[id] ~= 0)) then
                local show = ""
                if layersi[id] == 0 then
                    show = tostring(layers[id])
                elseif layers[id] == 0 then
                    show = tostring(layersi[id]) .. "i"
                elseif layersi[id] > 0 then
                    show = tostring(layers[id]) .. "+" .. tostring(layersi[id]) .. "i"
                else
                    show = tostring(layers[id]) .. "-" .. tostring(-layersi[id]) .. "i"
                end
                table.insert(result, {x, y, "x" .. show})
            end
        end
    end
    for sync, id in pairs(showlayer) do
        local unitid = MF_getfixed(id)
        local unit = mmf.newObject(unitid)
        if unit ~= nil then
            local x, y = unit.values[XPOS], unit.values[YPOS]
            x = Xoffset + (x + .5) * tilesize * spritedata.values[TILEMULT]
            y = Yoffset + (y) * tilesize * spritedata.values[TILEMULT]
            if (combodata[sync][3] ~= nil) and ((combodata[sync][3] ~= 1) or (combodata[sync][4] ~= 0)) then
                local show = ""
                if combodata[sync][4] == 0 then
                    show = tostring(combodata[sync][3])
                elseif combodata[sync][3] == 0 then
                    show = tostring(combodata[sync][4]) .. "i"
                elseif combodata[sync][4] > 0 then
                    show = tostring(combodata[sync][3]) .. "+" .. tostring(combodata[sync][4]) .. "i"
                else
                    show = tostring(combodata[sync][3]) .. "-" .. tostring(-combodata[sync][4]) .. "i"
                end
                table.insert(result, {x, y, "x" .. show})
            end
        end
    end
    return result
end

function getcomboname(id, sync, line)
    if (line == 1) then
        local curr = combodata[sync][1]
        if curr == "glitch" and (glitchlocks[id][1] ~= "glitch") then
            curr = glitchlocks[id][1] .. "(G)"
        end
        if (combodata[sync][2] ~= 0) and (combodata[sync][2] ~= nil) then
            local str = " (" .. lookup1[combodata[sync][2]] .. ")"
            curr = curr .. str
        end
        return curr
    else
		if #comboreq[sync] == 0 then
			return "lockless"
		end
        local color = comboreq[sync][line-1][1]
        if color == "glitch" and (glitchlocks[id][line] ~= 'glitch') then
            color = glitchlocks[id][line] .. "(G)"
        end
        local count = comboreq[sync][line-1][2]
        local result = ""
        if (comboreq[sync][line-1][3] == "blast") and (count >= 0) then
			if not comboisgray[sync] then
				result =  color .. " X"
			else
				result =  color .. " -X(-)"
			end
        elseif (comboreq[sync][line-1][3] == "blast")then
			if not comboisgray[sync] then
				result =  color .. " -X"
			else
				result =  color .. " X(-)"
			end
        elseif (comboreq[sync][line-1][3] == "blank") then
            result = color .. " B"
        elseif (comboreq[sync][line-1][3] == "blasti") and (count >= 0) then
			if not comboisgray[sync] then
				result =  color .. " Xi"
			else
				result =  color .. " -Xi(-)"
			end
        elseif (comboreq[sync][line-1][3] == "blasti")then
			if not comboisgray[sync] then
				result =  color .. " -Xi"
			else
				result =  color .. " Xi(-)"
			end
        elseif (comboreq[sync][line-1][3] == "i") then
			if not comboisgray[sync] then
				result =  color .. " " .. tostring(count) .. "i"
			else
				result =  color .. " " .. tostring(-1 * count) .. "i(-)"
			end
        elseif (comboreq[sync][line-1][3] == "all") then
            result = color .. " A"
        elseif (comboreq[sync][line-1][3] == "infinity") then
            result = color .. " Inf"
        else
			if not comboisgray[sync] then
				result = color .. " " .. tostring(count)
			else
				result = color .. " " .. tostring(-1 * count) .. "(-)"
			end
        end
        return result
    end
end

function getgatename(sync, line)
	if line == 1 then
		return "(gate)"
	end
	local color = gatereq[sync][line-1][1]
	if color == "glitch" and (glitchcolor ~= 'glitch') then
		color = glitchcolor .. "(G)"
	end
	local count = gatereq[sync][line-1][2]
	local result = ""
	if (gatereq[sync][line-1][3] == "blast") and (count >= 0) then
		result =  color .. " X"
	elseif (gatereq[sync][line-1][3] == "blast")then
		result =  color .. " -X"
	elseif (gatereq[sync][line-1][3] == "blank") then
		result = color .. " B"
	elseif (gatereq[sync][line-1][3] == "blasti") and (count >= 0) then
		result =  color .. " Xi"
	elseif (gatereq[sync][line-1][3] == "blasti")then
		result =  color .. " -Xi"
	elseif (gatereq[sync][line-1][3] == "i")then
		result =  color .. " " .. tostring(count) .. "i"
	elseif (gatereq[sync][line-1][3] == "all") then
		result = color .. " A"
	elseif (gatereq[sync][line-1][3] == "infinity") then
		result = color .. " A"
	else
		result = color .. " " .. tostring(count)
	end
	return result
end

function handlemyspeicals(x,y,type,data, fullspecial,sync_)
	local dosync = false
	if sync_ ~= nil then
		dosync = sync_
	end
    if (type == "door") and not dosync then
        local color = data[1]
        local count = tonumber(data[2])
		local things = findallhere(x,y)
        local doortype = data[3]
        local aura = tonumber(data[4])
        local spend = data[5]
        local layer = tonumber(data[6])
        local layeri = tonumber(data[7])
        if (layer == nil) then
            layer = 1
        end
        if (layeri == nil) then
            layeri = 0
        end
        if (spend == nil) then
            spend = color
        end
        if (doortype ~= "blast") and (doortype ~= "blank") and (doortype ~= "i") and (doortype ~= "blasti") and (doortype ~= "all") and (doortype ~= "infinity") then
            doortype = "normal"
        end
        for i,v in ipairs(things) do
			local vunit = mmf.newObject(v)
            local id = vunit.values[ID]
			glitchlocks[id] = {}
            origspecial[id] = fullspecial
            doordata[id] = {color, count, doortype, spend}
            if (aura ~= nil) then
                auras[id] = aura
            end
            layers[id] = layer
            layersi[id] = layeri
            cursed[id] = {color,spend}
			if (color == "glitch") or (spend == "glitch") then
                table.insert(glitches, id)
			end
            if (color == "glitch") then
				glitchlocks[id][2] = "glitch"
            end
			if (spend == "glitch") then
				glitchlocks[id][1] = "glitch"
			end
            resetdoordisplay(id)
        end
        if pickkeys[color] == nil then
            pickkeys[color] = 0
        end
        if pickkeys[spend] == nil then
            pickkeys[spend] = 0
        end
        if pickkeysi[color] == nil then
            pickkeysi[color] = 0
        end
        if pickkeysi[spend] == nil then
            pickkeysi[spend] = 0
        end
    elseif (type == "key") and not dosync then
        local color = data[1]
        local count = tonumber(data[2])
		local things = findallhere(x,y)
        local keytype = data[3]
        local counti = tonumber(data[4])
        local isinfinite = data[5]
        local aura = data[6]
		if (isinfinite == "0") or (isinfinite == nil) then
			isinfinite = false
		else
			isinfinite = true
		end
        if (keytype ~= "exact") and (keytype ~= "signflip") and (keytype ~= "star") and (keytype ~= "unstar") and (keytype ~= "rotor") and (keytype ~= "unrotor") and (keytype ~= "omega") then
            keytype = "normal"
        end
        if counti == nil then
            counti = 0
        end
        for i,v in ipairs(things) do
			local vunit = mmf.newObject(v)
            local id = vunit.values[ID]
			if (aura ~= nil) then
				auras[id] = aura
			end
            keydata[id] = {color, count, keytype, counti, isinfinite}
            resetkeydisplay(id)
            if color == "glitch" then
                table.insert(glitches, id)
            end
        end
        if pickkeys[color] == nil then
            pickkeys[color] = 0
        end
    elseif (type == "display") and not dosync then
        local color = data[1]
        local c1 = tonumber(data[2])
        local c2 = tonumber(data[3])
        if pickkeys[color] == nil then
            pickkeys[color] = 0
        end
        if pickkeysi[color] == nil then
            pickkeysi[color] = 0
        end
        table.insert(display0, {(x + .5) * tilesize * spritedata.values[TILEMULT],(y + .5) * tilesize * spritedata.values[TILEMULT], color, c1, c2})
    elseif (type == "combo") and not dosync then
        local things = findallhere(x,y)
        for i,v in ipairs(things) do
            local vunit = mmf.newObject(v)
            local id = vunit.values[ID]
            origspecial[id] = fullspecial
			glitchlocks[id] = {}
            local color = data[1]
            local aura = tonumber(data[2])
            local sync = tonumber(data[5])
            local layer = tonumber(data[3])
            local layeri = tonumber(data[4])
			if (color == "glitch") then
				glitchlocks[id][1] = "glitch"
			end
            if layer == nil then
                layer = 1
            end
            if layeri == nil then
                layeri = 0
            end
            local speicalreqs = {}
            local i = 6
            combocursed[sync] = {color}
            local glitchfound = (color == "glitch")

            if pickkeys[color] == nil then
                pickkeys[color] = 0
            end
            while data[i] ~= nil do
                local curr = data[i]
                local specialreq = {""}
                local j = 1
                while j <= string.len(curr) do
                    local char = string.sub(curr,j,j)
                    if char == ":" then
                        table.insert(specialreq, "")
                    else
                        specialreq[#specialreq] = specialreq[#specialreq] .. char
                    end
                    j = j + 1
                end
                local spend = specialreq[1]
                local req = tonumber(specialreq[2])
                local doortype = specialreq[3]
				if (spend == "glitch") then
					glitchlocks[id][i - 4] = "glitch"
				end
                if (doortype ~= "blast") and (doortype ~= "blank") and (doortype ~= "i") and (doortype ~= "blasti") and (doortype ~= "all") and (doortype ~= "infinity") then
                    doortype = "normal"
                end
                table.insert(speicalreqs, {spend, req, doortype})
                table.insert(combocursed[sync], spend)
                if spend == "glitch" then
                    glitchfound = true
                end
                i = i + 1

                if pickkeys[spend] == nil then
                    pickkeys[spend] = 0
                end
            end
            comboreq[sync] = speicalreqs
            combosync[id] = sync
            combodata[sync] = {color, aura, layer, layeri}
            showlayer[sync] = id
            resetcombodisplay(sync)
            if glitchfound then
                table.insert(glitches, id)
            end
        end
	elseif (type == "gate") and not dosync then
		local things = findallhere(x,y)
        for i,v in ipairs(things) do
            local vunit = mmf.newObject(v)
            local id = vunit.values[ID]
            origspecial[id] = fullspecial
            local sync = tonumber(data[1])
            local speicalreqs = {}
            local i = 2
            local glitchfound = false
            while data[i] ~= nil do
                local curr = data[i]
                local specialreq = {""}
                local j = 1
                while j <= string.len(curr) do
                    local char = string.sub(curr,j,j)
                    if char == ":" then
                        table.insert(specialreq, "")
                    else
                        specialreq[#specialreq] = specialreq[#specialreq] .. char
                    end
                    j = j + 1
                end
                local spend = specialreq[1]
                local req = tonumber(specialreq[2])
                local doortype = specialreq[3]
				if glitchlocks[id] == nil then
					glitchlocks[id] = {}
				end
				if (spend == "glitch") then
					glitchlocks[id][i - 4] = "glitch"
				end
                if (doortype ~= "blast") and (doortype ~= "blank") and (doortype ~= "i") and (doortype ~= "blasti") and (doortype ~= "all") and (doortype ~= "infinity") then
                    doortype = "normal"
                end
                table.insert(speicalreqs, {spend, req, doortype})
                if spend == "glitch" then
                    glitchfound = true
                end
                i = i + 1

                if pickkeys[spend] == nil then
                    pickkeys[spend] = 0
                end
				if pickkeysi[spend] == nil then
                    pickkeysi[spend] = 0
                end
            end
            gatereq[sync] = speicalreqs
            gatesync[id] = sync
            resetgatedisplay(sync)
            if glitchfound then
                table.insert(glitches, id)
            end
        end
    elseif (type == "sid") and not dosync then
        local things = findallhere(x,y)
        for i,v in ipairs(things) do
            local vunit = mmf.newObject(v)
            local id = vunit.values[ID]
			origspecial[id] = fullspecial
            salvageid[id] = tonumber(data[1])
        end
	elseif (type == "sync") and dosync then
        local things = findallhere(x,y)
        for i,v in ipairs(things) do
            local vunit = mmf.newObject(v)
            local id = vunit.values[ID]
			local synctype = data[1]
			local sync = tonumber(data[2])
			if synctype == "door" then
				combosync[id] = sync
				local origid = showlayer[sync]
				origspecial[id] = origspecial[origid]
				glitchlocks[id] = {}
				local glitchfound = false
				if glitchlocks[origid] ~= nil then
					for i2, j2 in pairs(glitchlocks[origid]) do
						glitchlocks[id][i2] = j2
						glitchfound = true
					end
				end
				if glitchfound then
					table.insert(glitches, id)
				end
			elseif synctype == "gate" then
				local origid = -1
				for i2, j2 in pairs(gatesync) do
					if j2 == sync then
						origid = i2
						break
					end
				end
				gatesync[id] = sync
				glitchlocks[id] = {}
				local glitchfound = false
				if glitchlocks[origid] ~= nil then
					for i2, j2 in pairs(glitchlocks[origid]) do
						glitchlocks[id][i2] = j2
						glitchfound = true
					end
				end
				if glitchfound then
					table.insert(glitches, id)
				end

			end
        end
	elseif (type == "terminal") and not dosync then
		local things = findallhere(x,y)
		for i,v in ipairs(things) do
			local vunit = mmf.newObject(v)
            local id = vunit.values[ID]
			local kind = data[1]
			-- salvage1
			-- salvage-1
			-- salvage10
			-- salvage-10
			-- lock1
			-- lock-1
			-- color,(color)
			-- doordisplay
			-- displaycolor
			-- confirm
			terminaldata[id] = kind
			if kind == "color" then
				terminaldata[id] = "color_" .. data[2]
			end
		end
	elseif (type == "sigil") and not dosync then
		local things = findallhere(x,y)
		for i,v in ipairs(things) do
			local vunit = mmf.newObject(v)
            local id = vunit.values[ID]
			local kind = data[1]
			sigils[id] = kind
		end
	end
end

function applydoordatasalvage(id, type, data, fullspecial)
	glitchlocks[id] = {}
    if (type == "door") then
        local color = data[1]
        local count = tonumber(data[2])
        local doortype = data[3]
        local aura = 0
        local spend = data[5]
        local layer = 1
        local layeri = 0
        if (spend == nil) then
            spend = color
        end
        if (doortype ~= "blast") and (doortype ~= "blank") and (doortype ~= "i") and (doortype ~= "blasti") and (doortype ~= "infinity") and (doortype ~= "all") then
            doortype = "normal"
        end
        origspecial[id] = fullspecial
        doordata[id] = {color, count, doortype, spend}
        auras[id] = aura
        layers[id] = layer
        layersi[id] = layeri
        cursed[id] = {color,spend}
        if (color == "glitch") or (spend == "glitch") then
            table.insert(glitches, id)
        end
		if (color == "glitch") then
			glitchlocks[id][2] = "glitch"
		end
		if (spend == "glitch") then
			glitchlocks[id][1] = "glitch"
		end
        if pickkeys[color] == nil then
            pickkeys[color] = 0
        end
        if pickkeys[spend] == nil then
            pickkeys[spend] = 0
        end
        if pickkeysi[color] == nil then
            pickkeysi[color] = 0
        end
        if pickkeysi[spend] == nil then
            pickkeysi[spend] = 0
        end
        resetdoordisplay(id)
    elseif (type == "combo") then
        origspecial[id] = fullspecial
        local color = data[1]
        local aura = 0
        local sync = 1
        while showlayer[sync] ~= nil do
            sync = sync + 1
        end
        local layer = 1
        local layeri = 0
        local speicalreqs = {}
        local i = 6
		if (color == "glitch") then
			glitchlocks[id][1] = "glitch"
		end
        combocursed[sync] = {color}
        local glitchfound = (color == "glitch")
        if pickkeys[color] == nil then
            pickkeys[color] = 0
        end
        while data[i] ~= nil do
            local curr = data[i]
            local specialreq = {""}
            local j = 1
            while j <= string.len(curr) do
                local char = string.sub(curr,j,j)
                if char == ":" then
                    table.insert(specialreq, "")
                else
                    specialreq[#specialreq] = specialreq[#specialreq] .. char
                end
                j = j + 1
            end
            local spend = specialreq[1]
            local req = tonumber(specialreq[2])
            local doortype = specialreq[3]
			if (spend == "glitch") then
				glitchlocks[id][i - 4] = "glitch"
			end
            if (doortype ~= "blast") and (doortype ~= "blank") and (doortype ~= "i") and (doortype ~= "blasti") and (doortype ~= "all") and (doortype ~= "infinity") then
                doortype = "normal"
            end
            table.insert(speicalreqs, {spend, req, doortype})
            table.insert(combocursed[sync], spend)
            if spend == "glitch" then
                glitchfound = true
            end
            i = i + 1
            if pickkeys[spend] == nil then
                pickkeys[spend] = 0
            end
        end
        comboreq[sync] = speicalreqs
        combosync[id] = sync
        combodata[sync] = {color, aura, layer, layeri}
        showlayer[sync] = id
        resetcombodisplay(sync)
        if glitchfound then
            table.insert(glitches, id)
        end
    elseif (type == "sid") then
		origspecial[id] = fullspecial
		salvageid[id] = tonumber(data[1])
	end
end

function handleoutputpoints()
    local removethese = {}
    if unitlists["outputpoint"] ~= nil then
		local max = #unitlists["outputpoint"]
		local i = 1
        while (i <= max) do
			j = unitlists["outputpoint"][i]
            local unit = mmf.newObject(j)
            local id = unit.values[ID]
            local x, y, dir = unit.values[XPOS], unit.values[YPOS], unit.values[DIR]
            if salvageid[id] ~= nil then
                local data = getsalvage(salvageid[id])
                if data ~= nil then
                    local unitid, id2 = create(data[2], x, y, dir, nil, nil, nil, true)
                    local result = {""}
                    local j0 = 1
                    while j0 <= string.len(data[1]) do
                        local char = string.sub(data[1],j0,j0)
                        if char == "," then
                            table.insert(result, "")
                        else
                            result[#result] = result[#result] .. char
                        end
                        j0 = j0 + 1
                    end
                    local kind = result[1]
                    table.remove(result,1)
                    applydoordatasalvage(id2, kind, result, data[1])
                    table.insert(removethese, j)
                end
            end
			i = i + 1
        end
    end
    for i, j in pairs(removethese) do
        delete(j,nil,nil,nil,true)
    end
end

function resetglitchdisplays()
    for i,j in pairs(glitches) do
        if doordata[j] ~= nil then
            resetdoordisplay(j)
        end
        if keydata[j] ~= nil then
            resetkeydisplay(j)
        end
        if combosync[j] ~= nil then
            resetcombodisplay(combosync[j])
        end 
        if gatesync[j] ~= nil then
            resetgatedisplay(gatesync[j])
        end 
    end
end

table.insert(mod_hook_functions["effect_always"], function()
	MF_letterclear("keyshow")
	if generaldata2.values[INPAUSEMENU] ~= 1 then
		local docommand = false
		if MF_keydown("x") then
			if pressedm == false then
				if not imode and (pickkeys["master"] ~= 0) then
					mastermode = not mastermode
					pressedm = true
					docommand = true
				elseif imode and (pickkeysi["master"] ~= 0) then
					mastermode = not mastermode
					pressedm = true
					docommand = true
				end
			end
		else
			pressedm = false
		end
		if MF_keydown("i") then
			if pressedi == false then
				imode = not imode
				pressedi = true
				docommand = true
				if mastermode and imode and (pickkeysi["master"] == 0) then
					mastermode = false
				elseif mastermode and not imode and (pickkeys["master"] == 0) then
					mastermode = false
				end
			end
		else
			pressedi = false
		end
		for _, i in pairs(display0) do
            local show = ""
            if pickkeysi[i[3]] == 0 then
                show = tostring(pickkeys[i[3]])
            elseif pickkeys[i[3]] == 0 then
                show = tostring(pickkeysi[i[3]]) .. "i"
            elseif pickkeysi[i[3]] > 0 then
                show = tostring(pickkeys[i[3]]) .. "+" .. tostring(pickkeysi[i[3]]) .. "i"
            else
                show = tostring(pickkeys[i[3]]) .. "-" .. tostring(-pickkeysi[i[3]]) .. "i"
            end
            if starval[i[3]] ~= true then
                writetext(i[3] .. ": " .. show,0,Xoffset + i[1],Yoffset + i[2],"keyshow",true,2,nil,{i[4], i[5]})
            else
                writetext(i[3] .. ": *" .. show,0,Xoffset + i[1],Yoffset + i[2],"keyshow",true,2,nil,{i[4], i[5]})
            end
		end
        local x, y = MF_mouse()
        x = (x - Xoffset) // (tilesize * spritedata.values[TILEMULT])
        y = (y - Yoffset) // (tilesize * spritedata.values[TILEMULT])
        local display1, isdoor = getdisplays(x,y)
        local display3 = getcombodisplays(x,y)
        x = Xoffset + (x + .5) * tilesize * spritedata.values[TILEMULT]
        y = Yoffset + (y + .5) * tilesize * spritedata.values[TILEMULT]
        for id, i in pairs(salvageid) do
            local j = MF_getfixed(id)
            if j ~= nil then
                local unit = mmf.newObject(j)
                if unit ~= nil then
                    local x0, y0 = unit.values[XPOS], unit.values[YPOS]
                    x0 = Xoffset + (x0 + .5) * tilesize * spritedata.values[TILEMULT]
                    y0 = Yoffset + (y0 + .5) * tilesize * spritedata.values[TILEMULT]
                    writetext(i,0,x0,y0,"keyshow",true,2,nil,{5, 4})
                end
            end
        end
		local display4 = getallkeys()
        for _, i in pairs(display4) do
			if i[4] then
            	writetext(i[3],0,i[1],i[2],"keyshow",true,2,nil,{0, 3})
			else
            	writetext(i[3],0,i[1],i[2],"keyshow",true,2,nil,{4, 3})
			end
		end
		local display5 = getterminaldisplays()
        for _, i in pairs(display5) do
            writetext(i[1],0,i[2],i[3],"keyshow",true,2,nil,{i[4], i[5]})
		end
		local display6 = getalldoors()
        for _, i in pairs(display6) do
			if i[4] == 1 then
            	writetext(i[3],0,i[1] - 1,i[2] - 1,"keyshow",true,2,nil,{0, 4})
			elseif i[4] == 2 then
				writetext(i[3],0,i[1] - 1,i[2] - 1,"keyshow",true,2,nil,{0, 3})
			elseif i[4] == 3 then
				writetext(i[3],0,i[1] - 1,i[2] - 1,"keyshow",true,2,nil,{0, 1})
			else
            	writetext(i[3],0,i[1] - 1,i[2] - 1,"keyshow",true,2,nil,{0, 2})
			end
		end
        local display2 = getlayerdisplays()
        for _, i in pairs(display2) do
            writetext(i[3],0,i[1],i[2],"keyshow",true,2,nil,{0, 3})
		end
        for i0, i in pairs(display1) do
            if isdoor[i0] then
                writetext(i,0,x,y,"keyshow",true,2,nil,{2, 3})
            else
                writetext(i,0,x,y,"keyshow",true,2,nil,{1, 3})

            end
		end
        for _, i0 in pairs(display3) do
            for i, j in pairs(i0) do
                writetext(j,0,x,y + (-(#i0) + (i * 2) - 1) * 10,"keyshow",true,2,nil,{2, 3})
            end
		end
        local fcount = 1
        local pcount = 1
        local ecount = 1
        local lcount = 1
        for i, j in pairs(auras) do
            local unitid = MF_getfixed(i)
            local unit = mmf.newObject(unitid)
            if unit ~= nil then
                if ((j // 1) % 2) == 1 then
                    local displayunit = freezes[fcount]
                    if displayunit == nil then
                        local k = MF_specialcreate("customsprite")
                        displayunit = mmf.newObject(k)
                        table.insert(freezes, displayunit)
                        displayunit.values[ONLINE] = 1
                        displayunit.layer = 2
                        displayunit.direction = 26
                        displayunit.values[ZLAYER] = 23
                        MF_loadsprite(k,"ice_0",26,false)
                        MF_setcolour(k,3,3)
                        displayunit.values[XPOS] = unit.x
                        displayunit.values[YPOS] = unit.y
                        displayunit.visible = unit.visible
                        displayunit.scaleX = generaldata2.values[ZOOM] * spritedata.values[TILEMULT]
                        displayunit.scaleY = generaldata2.values[ZOOM] * spritedata.values[TILEMULT]
                        fcount = fcount + 1
                    else
                        displayunit.values[XPOS] = unit.x
                        displayunit.values[YPOS] = unit.y
                        displayunit.visible = unit.visible
                        fcount = fcount + 1
                    end
                end
                if ((j // 2) % 2) == 1 then
                    local displayunit = erodes[ecount]
                    if displayunit == nil then
                        local k = MF_specialcreate("customsprite")
                        displayunit = mmf.newObject(k)
                        table.insert(erodes, displayunit)
                        displayunit.values[ONLINE] = 1
                        displayunit.layer = 2
                        displayunit.direction = 27
                        displayunit.values[ZLAYER] = 23
                        MF_loadsprite(k,"erosion_0",27,true)
                        MF_setcolour(k,2,1)
                        displayunit.values[XPOS] = unit.x
                        displayunit.values[YPOS] = unit.y
                        displayunit.visible = unit.visible
                        displayunit.scaleX = generaldata2.values[ZOOM] * spritedata.values[TILEMULT]
                        displayunit.scaleY = generaldata2.values[ZOOM] * spritedata.values[TILEMULT]
                        ecount = ecount + 1
                    else
                        displayunit.values[XPOS] = unit.x
                        displayunit.values[YPOS] = unit.y
                        displayunit.visible = unit.visible
                        ecount = ecount + 1
                    end
                end
                if ((j // 4) % 2) == 1 then
                    local displayunit = paints[pcount]
                    if displayunit == nil then
                        local k = MF_specialcreate("customsprite")
                        displayunit = mmf.newObject(k)
                        table.insert(paints, displayunit)
                        displayunit.values[ONLINE] = 1
                        displayunit.layer = 2
                        displayunit.direction = 28
                        displayunit.values[ZLAYER] = 23
                        MF_loadsprite(k,"painted_0",28,true)
                        MF_setcolour(k,4,3)
                        displayunit.values[XPOS] = unit.x
                        displayunit.values[YPOS] = unit.y
                        displayunit.visible = unit.visible
                        displayunit.scaleX = generaldata2.values[ZOOM] * spritedata.values[TILEMULT]
                        displayunit.scaleY = generaldata2.values[ZOOM] * spritedata.values[TILEMULT]
                        pcount = pcount + 1
                    else
                        displayunit.values[XPOS] = unit.x
                        displayunit.values[YPOS] = unit.y
                        displayunit.visible = unit.visible
                        pcount = pcount + 1
                    end
                end
            end
        end
        for i, j0 in pairs(combosync) do
            local unitid = MF_getfixed(i)
            local unit = mmf.newObject(unitid)
            local j = combodata[j0][2]
            if (unit ~= nil) and (j ~= nil) then
                if ((j // 1) % 2) == 1 then
                    local displayunit = freezes[fcount]
                    if displayunit == nil then
                        local k = MF_specialcreate("customsprite")
                        displayunit = mmf.newObject(k)
                        table.insert(freezes, displayunit)
                        displayunit.values[ONLINE] = 1
                        displayunit.layer = 2
                        displayunit.direction = 26
                        displayunit.values[ZLAYER] = 23
                        MF_loadsprite(k,"ice_0",26,false)
                        MF_setcolour(k,3,3)
                        displayunit.values[XPOS] = unit.x
                        displayunit.values[YPOS] = unit.y
                        displayunit.visible = unit.visible
                        displayunit.scaleX = generaldata2.values[ZOOM] * spritedata.values[TILEMULT]
                        displayunit.scaleY = generaldata2.values[ZOOM] * spritedata.values[TILEMULT]
                        fcount = fcount + 1
                    else
                        displayunit.values[XPOS] = unit.x
                        displayunit.values[YPOS] = unit.y
                        displayunit.visible = unit.visible
                        fcount = fcount + 1
                    end
                end
                if ((j // 2) % 2) == 1 then
                    local displayunit = erodes[ecount]
                    if displayunit == nil then
                        local k = MF_specialcreate("customsprite")
                        displayunit = mmf.newObject(k)
                        table.insert(erodes, displayunit)
                        displayunit.values[ONLINE] = 1
                        displayunit.layer = 2
                        displayunit.direction = 27
                        displayunit.values[ZLAYER] = 23
                        MF_loadsprite(k,"erosion_0",27,true)
                        MF_setcolour(k,2,1)
                        displayunit.values[XPOS] = unit.x
                        displayunit.values[YPOS] = unit.y
                        displayunit.visible = unit.visible
                        displayunit.scaleX = generaldata2.values[ZOOM] * spritedata.values[TILEMULT]
                        displayunit.scaleY = generaldata2.values[ZOOM] * spritedata.values[TILEMULT]
                        ecount = ecount + 1
                    else
                        displayunit.values[XPOS] = unit.x
                        displayunit.values[YPOS] = unit.y
                        displayunit.visible = unit.visible
                        ecount = ecount + 1
                    end
                end
                if ((j // 4) % 2) == 1 then
                    local displayunit = paints[pcount]
                    if displayunit == nil then
                        local k = MF_specialcreate("customsprite")
                        displayunit = mmf.newObject(k)
                        table.insert(paints, displayunit)
                        displayunit.values[ONLINE] = 1
                        displayunit.layer = 2
                        displayunit.direction = 28
                        displayunit.values[ZLAYER] = 23
                        MF_loadsprite(k,"painted_0",28,true)
                        MF_setcolour(k,4,3)
                        displayunit.values[XPOS] = unit.x
                        displayunit.values[YPOS] = unit.y
                        displayunit.visible = unit.visible
                        displayunit.scaleX = generaldata2.values[ZOOM] * spritedata.values[TILEMULT]
                        displayunit.scaleY = generaldata2.values[ZOOM] * spritedata.values[TILEMULT]
                        pcount = pcount + 1
                    else
                        displayunit.values[XPOS] = unit.x
                        displayunit.values[YPOS] = unit.y
                        displayunit.visible = unit.visible
                        pcount = pcount + 1
                    end
                end
            end
        end
		local locks0 = getalldoorlocks()
		for i, j0 in pairs(locks0) do
            local unit = mmf.newObject(j0[1])
            if unit ~= nil then
				local displayunit = locks[lcount]
				if displayunit == nil then
					local k = MF_specialcreate("customsprite")
					displayunit = mmf.newObject(k)
					table.insert(locks, displayunit)
					displayunit.values[ONLINE] = 1
					displayunit.layer = 1
					displayunit.direction = 29
					displayunit.values[ZLAYER] = unit.values[ZLAYER] + 1
					MF_loadsprite(k,"iwllock_0",29,true)
					MF_setcolour(k,j0[2][1],j0[2][2])
					displayunit.values[XPOS] = unit.x
					displayunit.values[YPOS] = unit.y
					displayunit.visible = unit.visible
					displayunit.scaleX = generaldata2.values[ZOOM] * spritedata.values[TILEMULT]
					displayunit.scaleY = generaldata2.values[ZOOM] * spritedata.values[TILEMULT]
					lcount = lcount + 1
				else
					displayunit.values[XPOS] = unit.x
					displayunit.values[YPOS] = unit.y
					displayunit.visible = unit.visible
					displayunit.values[ZLAYER] = unit.values[ZLAYER] + 1
					MF_setcolour(displayunit.fixed,j0[2][1],j0[2][2])
					lcount = lcount + 1
				end
			end
		end
        while fcount <= #freezes do
            MF_cleanremove(freezes[fcount].fixed)
            table.remove(freezes,fcount)
        end
        while pcount <= #paints do
            MF_cleanremove(paints[pcount].fixed)
            table.remove(paints,pcount)
        end
        while ecount <= #erodes do
            MF_cleanremove(erodes[ecount].fixed)
            table.remove(erodes,ecount)
        end
        while lcount <= #locks do
            MF_cleanremove(locks[lcount].fixed)
            table.remove(locks,lcount)
        end
		if docommand then
			command("idle", nil, nil,nil,true)
		end
	end
end
)

function getsalvage(sid)
    if (editor.values[INEDITOR] == 0) then
        MF_setfile("world","Data/Worlds/" .. generaldata.strings[WORLD] .. "/" .. "world_data.txt")
        local value = MF_read("world","salvages",tostring(generaldata2.values[SAVESLOT]) .. "_val" .. tostring(sid))
        local name = MF_read("world","salvages",tostring(generaldata2.values[SAVESLOT]) .. "_name" .. tostring(sid))
        if (value == nil) or (value == "") or (value == "empty") or (name == nil) or (name == "") or (name == "empty") then
            return nil
        end
        return {value, name}
    end
	return nil
end

function getomegas()
	terminaldata2 = {}
	if (editor.values[INEDITOR] == 0) then
        MF_setfile("world","Data/Worlds/" .. generaldata.strings[WORLD] .. "/" .. "world_data.txt")
        local index = 0
        local valid = true
        while valid do
            index = index + 1
            local curr = MF_read("world","omegas",tostring(generaldata2.values[SAVESLOT]) .. "_omega" .. tostring(index))
            if (curr == nil) or (curr == "") or (curr == "empty") then
                valid = false
				break
            end
			terminaldata2[curr] = 1
        end
    end
end

function getsalvages()
	terminaldata3 = {}
	if (editor.values[INEDITOR] == 0) then
        MF_setfile("world","Data/Worlds/" .. generaldata.strings[WORLD] .. "/" .. "world_data.txt")
        local index = 0
        local valid = true
        while valid do
            index = index + 1
            local sid = MF_read("world","salvages",tostring(generaldata2.values[SAVESLOT]) .. "_sid" .. tostring(index))
            if (sid == nil) or (sid == "") or (sid == "empty") then
                valid = false
				break
            end
			local curr = getsalvage(tonumber(sid))
            if ((curr ~= nil) and (curr[2] ~= nil) and (curr[2] ~= "") and (curr[2] ~= "empty") and ((string.sub(curr[2],1,4) == "door") or (string.sub(curr[2],1,4) == "combo"))) then
				local display = specialtodoor(curr[1])
				terminaldata3[tonumber(sid)] =  {curr[2], display, doortodisplay(display)}
            end
        end
    end
end

function setsalvage(sid, val, name)
    if (editor.values[INEDITOR] == 0) then
		if (val == nil) then
			val = "invalid"
		end
        MF_setfile("world","Data/Worlds/" .. generaldata.strings[WORLD] .. "/" .. "world_data.txt")
        MF_store("world","salvages",tostring(generaldata2.values[SAVESLOT]) .. "_val" .. tostring(sid), val)
        MF_store("world","salvages",tostring(generaldata2.values[SAVESLOT]) .. "_name" .. tostring(sid), name)
        local index = 0
        local valid = true
        while valid do
            index = index + 1
            local curr = MF_read("world","salvages",tostring(generaldata2.values[SAVESLOT]) .. "_sid" .. tostring(index))
            if (curr == nil) or (curr == "") or (curr == "empty") then
                valid = false
            end
            if (curr == tostring(sid)) then
                return
            end
        end
        MF_store("world","salvages",tostring(generaldata2.values[SAVESLOT]) .. "_sid" .. tostring(index), tostring(sid))
    end
end

function addomega(color)
	if (editor.values[INEDITOR] == 0) then
        MF_setfile("world","Data/Worlds/" .. generaldata.strings[WORLD] .. "/" .. "world_data.txt")
        local index = 0
        local valid = true
        while valid do
            index = index + 1
            local curr = MF_read("world","omegas",tostring(generaldata2.values[SAVESLOT]) .. "_omega" .. tostring(index))
            if (curr == nil) or (curr == "") or (curr == "empty") then
                valid = false
            end
			if (curr == color) then
				return
			end
        end
        MF_store("world","omegas",tostring(generaldata2.values[SAVESLOT]) .. "_omega" .. tostring(index), color)
    end
end

function clearsalvages()
    if (editor.values[INEDITOR] == 0) then
        MF_setfile("world","Data/Worlds/" .. generaldata.strings[WORLD] .. "/" .. "world_data.txt")
        local index = 0
        local valid = true
        while valid do
            index = index + 1
            local sid = MF_read("world","salvages",tostring(generaldata2.values[SAVESLOT]) .. "_sid" .. tostring(index))
            if (sid == nil) or (sid == "") or (sid == "empty") then
                valid = false
                break
            end
            MF_store("world","salvages",tostring(generaldata2.values[SAVESLOT]) .. "_sid" .. tostring(index), "empty")
            MF_store("world","salvages",tostring(generaldata2.values[SAVESLOT]) .. "_val" .. sid, "empty")
            MF_store("world","salvages",tostring(generaldata2.values[SAVESLOT]) .. "_name" .. sid, "empty")
        end
    end
end

function clearomegas()
    if (editor.values[INEDITOR] == 0) then
        MF_setfile("world","Data/Worlds/" .. generaldata.strings[WORLD] .. "/" .. "world_data.txt")
        local index = 0
        local valid = true
        while valid do
            index = index + 1
            local o = MF_read("world","omegas",tostring(generaldata2.values[SAVESLOT]) .. "_omega" .. tostring(index))
            if (o == nil) or (o == "") or (o == "empty") then
                valid = false
                break
            end
            MF_store("world","omegas",tostring(generaldata2.values[SAVESLOT]) .. "_omega" .. tostring(index), "empty")
        end
    end
end

function eraseomegakeys()
	for id, j in pairs(keydata) do
		local unitid = MF_getfixed(id)
		if unitid ~= nil then
			local unit = mmf.newObject(unitid)
			local x, y = unit.values[XPOS], unit.values[YPOS]
			local keytype = j[3]
			local keycolor = j[1]
			if keytype == "omega" and (terminaldata2[keycolor] ~= nil) then
				deletenoundo(unitid, x, y)
			end
		end
	end
end

function applyglitchcolor(color)
	if not jammed then
		for id, j0 in pairs(glitchlocks) do
			if #j0 ~= 0 then
				if combosync[id] ~= nil then
					local sync = combosync[id]
					local c = comboiscursed[sync]
					if not c then
						for i, j in pairs(j0) do
							addundo({"updateglitchlock", id, i, glitchlocks[id][i]})
							glitchlocks[id][i] = color
						end
					end
				elseif doordata[id] ~= nil then
					local c = iscursed[id]
					if not c then
						for i, j in pairs(j0) do
							addundo({"updateglitchlock", id, i, glitchlocks[id][i]})
							glitchlocks[id][i] = color
						end
					end
				end
			end
		end
	end
end

function getterminaldisplays()
	local result = {}
	for id, j in pairs(terminaldata) do
		local unitid = MF_getfixed(id)
		if unitid ~= nil then
			local unit = mmf.newObject(unitid)
			local x0, y0 = unit.values[XPOS], unit.values[YPOS]
			local x = Xoffset + (x0 + 1) * tilesize * spritedata.values[TILEMULT]
			local y = Yoffset + (y0 + 1) * tilesize * spritedata.values[TILEMULT]
			if (j == "salvage1") or (j == "lock1") then
				table.insert(result, {"1", x, y, 0, 3})
			elseif (j == "salvage10") then
				table.insert(result, {"10", x, y, 0, 3})
			elseif (j == "salvage-10") then
				table.insert(result, {"-10", x, y, 0, 3})
			elseif (j == "salvage-1") or (j == "lock-1") then
				table.insert(result, {"-1", x, y, 0, 3})
			elseif (j == "doordisplay") and terminaldata3[terminalsid] ~= nil then
				x = Xoffset + (x0 + .5) * tilesize * spritedata.values[TILEMULT]
				y = Yoffset + (y0 + .5) * tilesize * spritedata.values[TILEMULT]
				y = y + (-(#terminaldata3[terminalsid][3]) + (1 * 2) - 1) * 10
				for i2, j2 in pairs(terminaldata3[terminalsid][3]) do
					if i2 == terminallock then
						table.insert(result, {j2, x, y, 6, 1})
					else
						table.insert(result, {j2, x, y, 2, 4})
					end
					y = y + 20
				end
			elseif (j == "doordisplay") and terminaldata3[terminalsid] == nil then
				x = Xoffset + (x0 + .5) * tilesize * spritedata.values[TILEMULT]
				y = Yoffset + (y0 + .5) * tilesize * spritedata.values[TILEMULT]
				table.insert(result, {tostring(terminalsid), x, y, 6, 1})
			elseif (j == "displaycolor") and terminalcolor ~= nil then
				x = Xoffset + (x0 + .5) * tilesize * spritedata.values[TILEMULT]
				y = Yoffset + (y0 + .5) * tilesize * spritedata.values[TILEMULT]
				local lookups = lookup2[terminalcolor]
				if lookups == nil then
					table.insert(result, {"Color: " .. terminalcolor, x, y, 0, 3})
				else
					table.insert(result, {"Color: " .. terminalcolor, x, y, lookups[1], lookups[2]})
				end
			elseif (j == "displaycolor") and terminalcolor == nil then
				x = Xoffset + (x0 + .5) * tilesize * spritedata.values[TILEMULT]
				y = Yoffset + (y0 + .5) * tilesize * spritedata.values[TILEMULT]
				table.insert(result, {"Color: None", x, y, 0, 3})
			end
		end
	end
	return result
end

function specialtodoor(special)
	local data = {""}
	local j = 1
	while j <= string.len(special) do
		local char = string.sub(special,j,j)
		if char == "," then
			table.insert(data, "")
		else
			data[#data] = data[#data] .. char
		end
		j = j + 1
	end
	local kind = data[1]
	table.remove(data,1)
	if kind == "door" then
		if data[5] == nil then
			data[5] = data[1]
		end
		if data[3] == nil then
			data[3] = "normal"
		end
		return {"door", data[5], {data[1], tonumber(data[2]), data[3]}}
	elseif kind == "combo" then
		local i = 6
		local speicalreqs = {"combo", data[1]}
        while data[i] ~= nil do
            local curr = data[i]
            local specialreq = {""}
            local j = 1
            while j <= string.len(curr) do
                local char = string.sub(curr,j,j)
                if char == ":" then
                    table.insert(specialreq, "")
                else
                    specialreq[#specialreq] = specialreq[#specialreq] .. char
                end
                j = j + 1
            end
            local spend = specialreq[1]
            local req = tonumber(specialreq[2])
            local doortype = specialreq[3]
            if (doortype ~= "blast") and (doortype ~= "blank") and (doortype ~= "i") and (doortype ~= "blasti") and (doortype ~= "all") and (doortype ~= "infinity") then
                doortype = "normal"
            end
            table.insert(speicalreqs, {spend, req, doortype})
            i = i + 1
        end
		return speicalreqs
	end
end

function doortodisplay(door)
	local result = {door[2]}
	local i = 3
	while i <= #door do
		local j = door[i]
		local color = door[i][1]
		local count = door[i][2]
		local subresult = ""
		if (door[i][3] == "blast") and (count >= 0) then
			subresult = color .. " X"
		elseif (door[i][3] == "blast")then
			subresult =  color .. " -X"
		elseif (door[i][3] == "blank") then
			subresult = color .. " B"
		elseif (door[i][3] == "blasti") and (count >= 0) then
			subresult =  color .. " Xi"
		elseif (door[i][3] == "blasti")then
			subresult =  color .. " -Xi"
		elseif (door[i][3] == "i")then
			subresult =  color .. " " .. tostring(count) .. "i"
		elseif (door[i][3] == "blank") then
			subresult = color .. " A"
		elseif (door[i][3] == "infinity") then
			subresult = color .. " Inf"
		else
			subresult = color .. " " .. tostring(count)
		end
		table.insert(result, subresult)
		i = i + 1
	end
	return result
end

function doortospecial(door)
	if door[1] == "door" then
		return "door," .. door[3][1] .. "," .. tostring(door[3][2]) .. "," .. door[3][3] .. ",0," .. door[2]
	else
		local result = "combo," .. door[2] .. ",0,1,0,0"
		local i = 3
		while i <= #door do
			local j = door[i]
			local color = door[i][1]
			local count = tostring(door[i][2])
			local kind = door[i][3]
			result = result .. "," .. color .. ":" .. count .. ":" .. kind
			i = i + 1
		end
		return result
	end
end

function doomegachange()
	if terminallock == 1 then
		terminaldata3[terminalsid][2][2] = terminalcolor
	else
		terminaldata3[terminalsid][2][terminallock + 1][1] = terminalcolor
	end
	terminaldata3[terminalsid][3] = doortodisplay(terminaldata3[terminalsid][2])
	setsalvage(terminalsid, doortospecial(terminaldata3[terminalsid][2]), terminaldata3[terminalsid][1])
end

function processterminal(unitid, x, y)
	local things = findallhere(x, y)
	for i, j in pairs(things) do
		if unitid ~= j then
			local unit = mmf.newObject(j)
			local id = unit.values[ID]
			local data = terminaldata[id]
			if data ~= nil then
				addundo({"updateterminal", terminalsid, terminallock, tostring(terminalcolor)})
				if (data == "salvage1") then
					terminalsid = terminalsid + 1
				elseif (data == "salvage10") then
					terminalsid = terminalsid + 10
				elseif (data == "salvage-10") then
					terminalsid = terminalsid - 10
				elseif (data == "salvage-1") then
					terminalsid = terminalsid - 1
				elseif (data == "lock-1") and (terminallock > 1) then
					terminallock = terminallock - 1
				elseif (data == "lock1") and (terminaldata3[terminalsid] ~= nil) and (terminallock < #terminaldata3[terminalsid][3]) then
					terminallock = terminallock + 1
				elseif (string.sub(data,1,6) == "color_") then
					if (terminaldata2[string.sub(data,7)] ~= nil) then
						terminalcolor = string.sub(data,7)
					end
				elseif (data == "confirm") and (terminaldata3[terminalsid] ~= nil) and (terminalcolor ~= nil) then
					doomegachange()
				end
			end
			updateundo = true
		end
	end
end

function deletenoundo(unitid, x_, y_)

    local check = unitid

    if (unitid == 2) then
        check = 200 + x_ + y_ * roomsizex
    end

    if (deleted[check] == nil) then
        local unit = {}
        local x,y,dir = 0,0,4
        local unitname = ""
        local insidename = ""

        if (unitid ~= 2) then
            unit = mmf.newObject(unitid)
            x,y,dir = unit.values[XPOS],unit.values[YPOS],unit.values[DIR]
            unitname = unit.strings[UNITNAME]
            insidename = getname(unit)
        else
            x,y = x_,y_
            unitname = "empty"
            insidename = "empty"
        end

        x = math.floor(x)
        y = math.floor(y)

        if (unitid ~= 2) then
            if (spritedata.values[CAMTARGET] == unit.values[ID]) then
                changevisiontarget(unit.fixed)
            end

            -- addundo({"remove",unitname,x,y,dir,unit.values[ID],unit.values[ID],unit.strings[U_LEVELFILE],unit.strings[U_LEVELNAME],unit.values[VISUALLEVEL],unit.values[COMPLETED],unit.values[VISUALSTYLE],unit.flags[MAPLEVEL],unit.strings[COLOUR],unit.strings[CLEARCOLOUR],unit.followed,unit.back_init,unit.originalname,unit.strings[UNITSIGNTEXT]},unitid)
            unit = {}
            delunit(unitid)
            MF_remove(unitid)

            --MF_alert("Removed " .. tostring(unitid))

            if inbounds(x,y,1) then
                dynamicat(x,y)
            end
        end

        deleted[check] = 1
    else
        MF_alert("already deleted")
    end
end

--Returns if an object is considered alive in IWL
function isUnitIWLAlive(name,unitid,x,y)
    if (hasfeature(name,"is","you",unitid,x,y) ~= nil) then return true end
    --if (hasfeature(name,"is","you2",unitid,x,y) ~= nil) then return true end --Mathguy says no, so no
    --if (hasfeature(name,"is","3d",unitid,x,y) ~= nil) then return true end --Mathguy says no, so no
    if (hasfeature(name,"is","alive",unitid,x,y) ~= nil) then return true end
    if (hasfeature(name,"is","youplus",unitid,x,y) ~= nil) then return true end
    if (hasfeature(name,"is","puppet",unitid,x,y) ~= nil) then return true end
    return nil
end

function firstlevel()
    local world = generaldata.strings[WORLD]
    local level = generaldata.strings[CURRLEVEL]

    generaldata.strings[CURRLEVEL] = ""

    if (string.len(level) == 0) then
        local flevel = MF_read("world","general","firstlevel")
        local slevel = MF_read("world","general","start")

        local fstatus = tonumber(MF_read("save",world,flevel)) or 0
        local intro = tonumber(MF_read("save",world,"intro")) or 0
        local hassalvage = tonumber(MF_read("save",world,"salv")) or 0

        if (string.len(flevel) > 0) then
            if (fstatus ~= 3) or (string.len(slevel) == 0) then
                if (hassalvage == 0) then
                    clearsalvages()
                    clearomegas()
                    MF_store("save",world,"salv","1")
                end
                sublevel(slevel,0,0)
                sublevel(flevel,0,0)

                generaldata.strings[CURRLEVEL] = flevel
                generaldata.strings[PARENT] = slevel

                if (world == generaldata.strings[BASEWORLD]) and (intro == 0) then
                    MF_intro()
                end
            else
                generaldata.strings[CURRLEVEL] = slevel
            end
        elseif (string.len(slevel) > 0) then
            generaldata.strings[CURRLEVEL] = slevel
            sublevel(slevel,0,0)
        end
    end
end

function isKeyPickerProp(property)
    return property == "you" or property == "alive" or property == "puppet" or property == "youplus" --@mods (extrem x word salad)
end

function victory()
    MF_win()
    doorsalvaged = false
end

condlist["idle"] = function(params,checkedconds)
    return ((last_key == 4) and not noidle),checkedconds
end
------------------------
--[[ @Merge: a lot of functions were merged ]]
