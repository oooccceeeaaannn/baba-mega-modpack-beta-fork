--Global table to store all levels that could potentially be visited to
--Each entry in the table is a 2D array of levels for that layer of the leveltree
--Each entry in that array is a table of at least one level (multiple if multiple levels on the same tile)
--Each level is stored as a table containing num, style, file, and surrounds
visit_visitlevels = {}

--Second global table to store where the player is in the array of levels, for each layer of the leveltree
--Each entry in this table is a table containing x and y coordinates
visit_mappositions = {}

--Third global table to store the position the player entered a level on the world map
--Used to carry data from getlevelsurrounds (which has access to this) to sublevel (which doesn't)
visit_tempmappos = {
	x = 0,
	y = 0
}

--Global boolean to disable input for a bit after visiting to multiple levels at once.
--This prevents players from accidentally selecting a level with the same input they used to idle in another level.
visit_inputdisabled = false

--Add the Visit text (and directional variants) to the editor
table.insert(editor_objlist_order, "text_visit")
editor_objlist["text_visit"] = {
	name = "text_visit",
	sprite_in_root = false,
	unittype = "text",
	tags = {"text"},
	tiling = -1,
	type = 2,
	layer = 20,
	colour = {0, 1},
	colour_active = {0, 3}
}

table.insert(editor_objlist_order, "text_visitdown")
editor_objlist["text_visitdown"] = {
	name = "text_visitdown",
	sprite_in_root = false,
	unittype = "text",
	tags = {"text"},
	tiling = -1,
	type = 2,
	layer = 20,
	colour = {0, 1},
	colour_active = {0, 3}
}

table.insert(editor_objlist_order, "text_visitright")
editor_objlist["text_visitright"] = {
	name = "text_visitright",
	sprite_in_root = false,
	unittype = "text",
	tags = {"text"},
	tiling = -1,
	type = 2,
	layer = 20,
	colour = {0, 1},
	colour_active = {0, 3}
}

table.insert(editor_objlist_order, "text_visitup")
editor_objlist["text_visitup"] = {
	name = "text_visitup",
	sprite_in_root = false,
	unittype = "text",
	tags = {"text"},
	tiling = -1,
	type = 2,
	layer = 20,
	colour = {0, 1},
	colour_active = {0, 3}
}

table.insert(editor_objlist_order, "text_visitleft")
editor_objlist["text_visitleft"] = {
	name = "text_visitleft",
	sprite_in_root = false,
	unittype = "text",
	tags = {"text"},
	tiling = -1,
	type = 2,
	layer = 20,
	colour = {0, 1},
	colour_active = {0, 3}
}
formatobjlist()

-- @Merge: Word Glossary Mod support
if keys.IS_WORD_GLOSSARY_PRESENT then
	keys.WORD_GLOSSARY_FUNCS.register_author("Btd456creeper", {0,3} )
	keys.WORD_GLOSSARY_FUNCS.add_entries_to_word_glossary({
		{
			name = "visit",
			author = "Btd456creeper",
			description =
			[[Changes the current level to the level directly adjacent to it in the parent level of the current level.

- This effect applies when a you object moves onto a visit object.

- The direction of the visit object determines which direction to look for an adjacent level. If there isn't an adjacent level, the current level gets destroyed instead.

- When multiple visits are triggered simultaneously, the player will be sent to the level on the vector sum of all visits.]],
		}
	})
end

--Make the directional Visit variants display properly in the rules menu
word_names["visitdown"] = "visit (down)"
word_names["visitright"] = "visit (right)"
word_names["visitup"] = "visit (up)"
word_names["visitleft"] = "visit (left)"

--Patch getlevelsurrounds to also store the position of the entered level on the world map
--The sublevel function alone doesn't work for this because it doesn't have access to the level tile's unitid
--[[ @Merge: Now in {{mod_injections}}.lua]]

--Patch sublevel to store the positions of all levels on the map so they can be visited to
--[[ @Merge: Now in {{mod_injections}}.lua]]

--Function to check for repeat entries in the leveltree
--If the last entry is a repeat of a previous entry then remove everything after the first copy of the entry
--This prevents issues with infinite level depth when entering levels recursively:
--In Baba Is You, if you start in level A and enter level A again then you can't return to map from A back to A
--This is because something similar to this function happens in sublevel() when entering A the second time
--However, with the Visit mod, if you start in A, enter B, then visit from B to A (specifically using Visit), you CAN return to map from A back to A
--This is okay, but to prevent certain issues, entering another level from that situation must be coded to remove the duplicate A entries in the leveltree
function resolveleveltree()
	local lastentry = leveltree[#leveltree]
	local dodeletes = false
	local delstart
	for i,v in ipairs(leveltree) do
		if (i < #leveltree) and (v == lastentry) then
			dodeletes = true
			delstart = i + 1
		end
	end

	if dodeletes then
		for i = #leveltree, delstart, -1 do
			table.remove(leveltree, i)
			table.remove(leveltree_id, i)
			table.remove(visit_visitlevels)
			table.remove(visit_mappositions)
		end
	end
end

--Function to map out the levels on the world map, and record the position where the first visit should start from
function createlevelarray()
	local levelarray = {}
	local levelsfound = false

	--Note: roomsizex and roomsizey are global variables storing the size of the current levels, in tiles
	for x = 0, roomsizex - 1 do
		for y = 0, roomsizey - 1 do
			for i,potentiallevelunitid in ipairs(findallhere(x, y)) do
				local potentiallevelunit = mmf.newObject(potentiallevelunitid)
				if (potentiallevelunit.strings[U_LEVELFILE] and potentiallevelunit.values[COMPLETED] > 1) then
					levelarray = addlevelarraylevel(levelarray, potentiallevelunitid, x, y)
					levelsfound = true
				end
			end
		end
	end

	return levelarray, levelsfound
end

--Function to add a given level to the array at a given position, creating any tables necessary to do so
function addlevelarraylevel(levelarray, levelunitid, x, y)
	local levelunit = mmf.newObject(levelunitid)

	if (levelarray[x] == nil) then
		levelarray[x] = {}
	end

	if (levelarray[x][y] == nil) then
		levelarray[x][y] = {}
	end

	table.insert(levelarray[x][y], {
		num = levelunit.values[VISUALLEVEL],
		style = levelunit.values[VISUALSTYLE],
		file = levelunit.strings[U_LEVELFILE],
		surrounds = altgetlevelsurrounds(levelunitid)
	})

	return levelarray
end

--Copy of the original getlevelsurrounds function found in base game
--Returns the value instead of storing it in generaldata, and does not store levels to visit to
function altgetlevelsurrounds(levelid)
	local level = mmf.newObject(levelid)

	local dirids = {"r","u","l","d","dr","ur","ul","dl","o"}
	local x,y,dir = level.values[XPOS],level.values[YPOS],level.values[DIR]

	local result = tostring(dir) .. ","

	for i,v in ipairs(dirs_diagonals) do
		result = result .. dirids[i] .. ","

		local ox,oy = v[1],v[2]

		local tileid = (x + ox) + (y + oy) * roomsizex

		if (unitmap[tileid] ~= nil) then
			if (#unitmap[tileid] > 0) then
				for a,b in ipairs(unitmap[tileid]) do
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

	return result
end

--At the end of each turn, check for any Visit interactions
--Done at the end of block instead of the turn_end modhook, because doing things after turn end requires messing with undos and sound effects
local oldblock = block
function block(small_)
	oldblock(small_)

	checkvisit()
end

--Function to check for You objects touching Visit objects, and perform a visit if so
function checkvisit()
	if (generaldata.values[WINTIMER] == 0) then --Don't visit if the player just won the level
		--Get every object that is You/You2/3D
		local isyou = ws_findPlayerUnits()

		--Each object should only trigger Visit once, so remove duplicate Yous
		--(This handles cases where Baba Is You And You, as well as when two You objects touch the same Visit object)
		local isyounodupes = {}
		local storedyous = {}
		for i,v in ipairs(isyou) do
			if (storedyous[v] == nil) then
				table.insert(isyounodupes, v)
				storedyous[v] = true
			end
		end

		local visiting = false
		local visitdirs = {
			right = 0,
			up = 0,
			left = 0,
			down = 0
		}
		--For each You object, check if it's on a Visit object
		for i,youunit in ipairs(isyounodupes) do
			local youunitid = youunit.fixed
			local youtargets = findallhere(youunit.values[XPOS], youunit.values[YPOS])
			for j,visitunitid in ipairs(youtargets) do
				if floating(youunitid, visitunitid) then
					local unitvisitdirs, isvisit = getunitvisitdirs(visitunitid)
					if isvisit then
						visiting = true
						visitdirs = addvisitdirs(visitdirs, unitvisitdirs)
					end
				end

				--Check for Level Is Visit here
				local levelvisitdirs, islevelvisit = getunitvisitdirs(1)
				if islevelvisit and (floating_level(youunitid)) then
					visiting = true
					visitdirs = addvisitdirs(visitdirs, levelvisitdirs)
				end
			end
		end

		--Do the same thing, but for empty tiles
		--Empties can't overlap any normal objects, but can still be You And Visit, or You while the outerlevel is Visit
		--Both of these cases should trigger Visit
		local isyouempty = {}
		for i,emptytile in ipairs(getemptytiles()) do
			local x, y = emptytile[1], emptytile[2]
			if (hasfeature("empty", "is", "you", 2, x, y)
					or hasfeature("empty", "is", "you2", 2, x, y)
					or hasfeature("empty", "is", "3d", 2, x, y)
					or hasfeature("empty", "is", "alive", 2, x, y)
					or hasfeature("empty", "is", "you+", 2, x, y)
					or hasfeature("empty", "is", "puppet", 2, x, y)) then
				table.insert(isyouempty, {x, y})
			end
		end

		for i,emptytile in ipairs(isyouempty) do
			local x, y = emptytile[1], emptytile[2]
			local emptyvisitdirs, isemptyvisit = getunitvisitdirs(2, x, y)
			if (isemptyvisit) then
				visiting = true
				visitdirs = addvisitdirs(visitdirs, emptyvisitdirs)
			end

			local levelvisitdirs, islevelvisit = getunitvisitdirs(1)
			if islevelvisit and (floating_level(2, x, y)) then
				visiting = true
				visitdirs = addvisitdirs(visitdirs, levelvisitdirs)
			end
		end

		--If Level Is You, trigger a visit from every object and empty that is Visit
		if ws_isLevelPlayer() then
			for i,visitunit in ipairs(units) do
				local visitunitid = visitunit.fixed
				if floating_level(visitunitid) then
					local unitvisitdirs, isvisit = getunitvisitdirs(visitunitid)
					if isvisit then
						visiting = true
						visitdirs = addvisitdirs(visitdirs, unitvisitdirs)
					end
				end
			end

			for i,emptytile in ipairs(getemptytiles()) do
				local x, y = emptytile[1], emptytile[2]
				local emptyvisitdirs, isemptyvisit = getunitvisitdirs(2, x, y)
				if isemptyvisit and floating_level(2, x, y) then
					visiting = true
					visitdirs = addvisitdirs(visitdirs, emptyvisitdirs)
				end
			end
		end

		--With all the visits collected, decide where the destination level is
		if visiting then
			local mappos = visit_mappositions[#visit_mappositions]
			local visitoffx = visitdirs.right - visitdirs.left
			local visitoffy = visitdirs.down - visitdirs.up

			local destination = {}
			local visitleveldepth = #visit_visitlevels
            local visitdestx = mappos.x + visitoffx
            local visitdesty = mappos.y + visitoffy

			if mappos ~= nil then
				if (visit_visitlevels[visitleveldepth][visitdestx] ~= nil and visit_visitlevels[visitleveldepth][visitdestx][visitdesty] ~= nil) then
					destination = visit_visitlevels[visitleveldepth][visitdestx][visitdesty]
				end
			end

			if (#destination == 1) then
				visit_mappositions[visitleveldepth] = {
					x = visitdestx,
					y = visitdesty
				}
				dovisit(destination[1])
			elseif (#destination == 0) then
				destroylevel()
			else
				visit_mappositions[visitleveldepth] = {
					x = visitdestx,
					y = visitdesty
				}
				visit_inputdisabled = true
				generaldata.values[IGNORE] = 1
				submenu("visit_multilevelmenu",destination)
			end
		end
	end
end

--Re-enable input after disabling it for a frame to prevent inputs falling through to the level selection menu
mod_hook_functions["always"]["visitmod"] = function()
	if visit_inputdisabled then
		visit_inputdisabled = false
		generaldata.values[IGNORE] = 0
	end
end

--Set up the "visiting to stacked levels" menu
--Derived from the enterlevel_multiple menu, found in editor_menudata.lua in the base game Editor folder
menufuncs.visit_multilevelmenu = {
	button = "VisitMultiLevel",
	enter = function(parent,name,buttonid,extra)
		MF_menubackground(true)

		local x = screenw * 0.5
		local y = f_tilesize * 6.5

		writetext(langtext("enterlevel_multiple"),0,x,y,name,true,2)

		y = y + f_tilesize * 1

		editor2.values[MENU_YDIM] = #extra

		local dynamic_structure = {}

		for i,v in ipairs(extra) do
			y = y + f_tilesize * 1

			local levelfile = v.file

			MF_setfile("level","Data/Worlds/" .. generaldata.strings[WORLD] .. "/" .. levelfile .. ".ld")
			local levelname = MF_read("level", "general", "name")

			local blen,toobig = getdynamicbuttonwidth(levelname,16)

			local buttonname = tostring(i) .. ",visit_multilevelmenu"
			createbutton(buttonname,x,y,2,blen,1,levelname,name,3,2,buttonid,false,first)
			table.insert(dynamic_structure, {{buttonname}})
			buttonclick_list[buttonname] = function(buttonid)
				dovisit(v)
				closemenu()
				MF_menubackground(false)
				MF_cursorvisible(0)
				for j,entry in pairs(buttonclick_list) do
					if (string.sub(j, -21) == ",visit_multilevelmenu") then
						buttonclick_list[j] = nil
					end
				end
			end
		end

		--Dynamic structure is necessary to make the menu keyboard friendly
		--Without it, the selection icon baba won't appear in the menu
		buildmenustructure(dynamic_structure)
	end
}

--Given a unitid, return a table containing how many times it is Visit in each direction.
--Also returns true if it had any Visit property, or false if not.
--x and y parameters are for empties and can be left out if the unit isn't Empty.
function getunitvisitdirs(visitunitid, x_, y_)
	local visitunitname
	local dir
	local x, y = x_, y_
	if (visitunitid == 1) then
		dir = mapdir --Note: mapdir is a base game global variable that stores the outerlevel's direction
		visitunitname = "level"
	elseif (visitunitid == 2) then
		dir = emptydir(x, y)
		if dir == 4 then
			dir = math.random(0, 3)
		end
		visitunitname = "empty"
	else
		local visitunit = mmf.newObject(visitunitid)
		dir = visitunit.values[DIR]
		visitunitname = getname(visitunit)
	end

	local visitdirs = {
		right = hasfeature_count(visitunitname, "is", "visitright", visitunitid, x, y),
		up = hasfeature_count(visitunitname, "is", "visitup", visitunitid, x, y),
		left =  hasfeature_count(visitunitname, "is", "visitleft", visitunitid, x, y),
		down =  hasfeature_count(visitunitname, "is", "visitdown", visitunitid, x, y)
	}

	local visitdirlesscount = hasfeature_count(visitunitname, "is", "visit", visitunitid, x, y)
	if (visitdirlesscount > 0) then
		if (dir == 0) then
			visitdirs.right = visitdirs.right + visitdirlesscount
		elseif (dir == 1) then
			visitdirs.up = visitdirs.up + visitdirlesscount
		elseif (dir == 2) then
			visitdirs.left = visitdirs.left + visitdirlesscount
		elseif (dir == 3) then
			visitdirs.down = visitdirs.down + visitdirlesscount
		else
			timedmessage("Visit: Warning, a Visit object's direction was " .. dir .. ". Report this to Btd456Creeper!")
		end
	end

	if (visitdirs.right == 0) and (visitdirs.up == 0) and (visitdirs.left == 0) and (visitdirs.down == 0) then
		return visitdirs, false
	else
		return visitdirs, true
	end
end

--Function to add two visitdir tables (summing the values for each direction) and return the result
function addvisitdirs(visitdirs1, visitdirs2)
	local visitdirsout = {
		right = 0,
		up = 0,
		left = 0,
		down = 0
	}

	visitdirsout.right = visitdirs1.right + visitdirs2.right
	visitdirsout.up = visitdirs1.up + visitdirs2.up
	visitdirsout.left = visitdirs1.left + visitdirs2.left
	visitdirsout.down = visitdirs1.down + visitdirs2.down

	return visitdirsout
end

--Function to perform a visit, given a table containing level information
function dovisit(target)
	levelconversions = {} --Note: levelconversions is a global table storing what the level is going to turn into
    findpersists("levelentry")

	changelevel(target.file, target.num, target.style)
	generaldata.strings[LEVELNUMBER_NAME] = getlevelnumber()
	generaldata2.strings[LEVELSURROUNDS] = target.surrounds

	--Code provided by Hempuli - not sure what each of these lines do, but together they start a new level
	generaldata.values[TRANSITIONREASON] = 9
	generaldata.values[IGNORE] = 1
	generaldata3.values[STOPTRANSITION] = 1
	generaldata2.values[UNLOCK] = 0
	generaldata2.values[UNLOCKTIMER] = 0
	MF_loop("transition",1)
end

--Whenever a level is won, transformed, or otherwise exited, remove the Visit entries for one layer of the leveltree
local olduplevel = uplevel
function uplevel()
	local out = olduplevel()

	if (#visit_visitlevels > 0) then
		table.remove(visit_visitlevels)
	end
	if (#visit_mappositions > 0) then
		table.remove(visit_mappositions)
	end

	return out
end

--Add the Visit particle effect
mod_hook_functions["effect_always"]["visitmod"] = function()
	for i, visitunit in ipairs(units) do
		if (math.random(5) == 1) then
			local visitdirs, isvisit = getunitvisitdirs(visitunit.fixed)
			if isvisit then
				visitparticle(visitunit.values[XPOS], visitunit.values[YPOS], visitdirs)
			end
		end
	end

	local levelvisitdirs, islevelvisit = getunitvisitdirs(1)

	for i, emptytile in ipairs(getemptytiles()) do
        local x, y = emptytile[1], emptytile[2]
		
        if (math.random(20) == 1) then
			local emptyvisitdirs, isemptyvisit = getunitvisitdirs(2, x, y)
			if isemptyvisit then
				visitparticle(x, y, emptyvisitdirs)
			end
		end

		if islevelvisit and (math.random(20) == 1) then
            visitparticle(x, y, levelvisitdirs)
        end
	end
end

--Function to spawn a single Visit particle with the given directions.
function visitparticle(x, y, visitdirs)
	local vx = visitdirs.right - visitdirs.left
	local vy = visitdirs.down - visitdirs.up

	local particleid = MF_particle("unlock", x, y, 0, 3, 1)
	local particle = mmf.newObject(particleid)
	if particle == nil then
		return
	end
	local px, py = particle.x, particle.y

	particle.values[ONLINE] = 2

	--These four lines look somewhat unnecessary, but seems to be required after changing the particle's ONLINE value to 2.
	particle.x = px
	particle.values[XPOS] = px
	particle.y = py
	particle.values[YPOS] = py

	particle.values[XVEL] = (math.random() * 4 - 2) + 7 * vx
	particle.values[YVEL] = (math.random() * 4 - 2) + 7 * vy
end

--When exiting a levelpack, re-initialise the game to prevent Visit data from persisting outside of the levelpack
local oldchangemenu = changemenu
function changemenu(menuitem, extra)
	oldchangemenu(menuitem, extra)

	if menuitem == "main" then
		visit_visitlevels = nil
		visit_mappositions = nil
		visit_tempmappos = nil
		visit_inputdisabled = nil
		mod_hook_functions["always"]["visitmod"] = nil
		mod_hook_functions["effect_always"]["visitmod"] = nil
		getlevelsurrounds = oldgetlevelsurrounds
		sublevel = oldsublevel
		block = oldblock
		uplevel = olduplevel
		changemenu = oldchangemenu
		menufuncs.visit_multilevelmenu = nil
	end
end