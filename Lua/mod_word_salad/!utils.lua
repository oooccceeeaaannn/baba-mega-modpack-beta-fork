--[[ ========== OVERRIDDEN FUNCTIONS ==========

tools.lua
-- isgone(): add check for ALIVE
-- delete(): keep karma after undoing
-- delunit(): update ECHO
-- create(): update ECHO
-- update(): update ECHO
-- getlevelsurrounds(): keep track of any text at the level's position (including the level itself if it was converted) + keep track of level sinful status

undo.lua
-- undo(): add "levelkarma" and "unitkarma" events, keep karma when undoing destruction/conversion. Add code checks when something related to ECHO is undone
-- newundo(): keep track of ECHO stuff

syntax.lua
-- command(): add check for VESSEL2
-- setunitmap(): keep karma after undoing
-- createall(): keep karma after undoing (?)

map.lua
-- displaysigntext(): add check for ALIVE
-- unlockeffect(): also get ENTER units
-- mapunlock(): also get ENTER units
-- gateindicatorcheck(): also get ENTER units

convert.lua
-- conversion(): also check for ECHO
-- convert(): also check for ENTER
-- doconvert(): keep karma after a conversion or when undoing, add checks for ECHO

effects.lua
-- effects(): add particles for ECHO
-- doeffects(): add a "reducedlvl" option, to spawn less particles when LEVEL IS ECHO is formed

load.lua
-- init(): start with empty ECHO lists

mapcursor.lua
-- mapcursor_load(): check for ENTER
-- mapcursor_move(): ENTER
-- mapcursor_move(): update ECHO stuff when moving a cursor, also check for VEHICLE
-- mapcursor_enter(): ENTER
-- mapcursor_hardset(): ENTER
-- mapcursor_levelstart(): ENTER
-- mapcursor_displayname(): ENTER
-- idleblockcheck(): ENTER
-- cursorcheck(): ENTER
-- mapcursor_tofront(): ENTER
-- hidecursor(): ENTER
-- mapcursor_setonlevel(): ENTER

movement.lua
-- movecommand(): add checks for VESSEL and VESSEL2, set karma when a weak object moves into an obstacle unless the obstacle is REPENT, implement HOP/HOPS for direct movements
-- move(): add karma for OPEN/SHUT and EAT unless the sinner is REPENT
-- trypush(): add HOP/HOPS for pushable objects
-- dopush(): add karma for when a WEAK object is pushed into an obstacle unless it's REPENT, add HOP/HOPS for pushable objects

blocks.lua
-- moveblock(): keep karma after undoing, ECHO/BACK interaction
-- block(): add check for ALIVE, set karma for destructions by overlap or BOOM, implement REPENT, add special interaction for LEVEL IS ENTER
-- levelblock(): add check for ALIVE, set level karma for destructions unless level is REPENT
-- findplayer(): add check for ALIVE and VESSEL

update.lua
-- doupdate(): keep track of ECHO units

rules.lua
-- code(): look for ECHO units?
-- codecheck(): add rules from ECHO objects (?)

clears.lua
-- clearunits(): clear ECHO stuff
-- clear(): also clear ECHO stuff

letterunits.lua
-- formlettermap(): check for ECHO objects that are echoing letters

-- ========== OVERRIDDEN FUNCTIONS ==========]]

-- Set the initial karma value of the outer level
mod_hook_functions["level_start"]["word_salad"] = function()
	if (editor.values[E_INEDITOR] == 0 and WS_KEEP_LEVEL_KARMA) then -- We probably don't want to keep the karma status when entering a level from the editor
		levelKarma = ws_wasLevelSinful
	else
		levelKarma = false
	end
	ws_levelBungeeOffset = nil
	ws_deathCounter = {}
	ws_pendingDomino,ws_pendingDominoE = {},{}
	if (ws_ambientObject == nil) or (ws_ambientObject == "") then
		timedmessage("Couldn't find ambient value, fallback to level (this message shouldn't appear!)",0,0)
		ws_ambientObject = "level"
		MF_store("save",generaldata.strings[CURRLEVEL],"ws_ambient","level")
	end
end

-- Clear the "Was level sinful" value when ending a level (we can't do that in the level start hook, because it's also called when restarting!)
mod_hook_functions["level_end"]["word_salad"] = function()
	ws_wasLevelSinful = false
	ws_levelAlignedRow = false
	ws_levelAlignedColumn = false
	ws_ambientObject = "level"
end

mod_hook_functions["rule_baserules"]["word_salad"] = function()
	ws_ambientObject = MF_read("save",generaldata.strings[CURRLEVEL],"ws_ambient")
	if (ws_ambientObject == nil) or (ws_ambientObject == "") then
		ws_ambientObject = "level"
		MF_store("save",generaldata.strings[CURRLEVEL],"ws_ambient","level")
	end
end

mod_hook_functions["always"]["word_salad"] = function()
	if generaldata.values[MODE] == 0 and generaldata2.values[INPAUSEMENU] ~= 1 and ws_showDebugParticles() then
		local mouse_x, mouse_y = MF_mouse()
		MF_letterclear("ws_text")

		local level_mouse_x = mouse_x - Xoffset
		local level_mouse_y = mouse_y - Yoffset
		local tile_scale = (f_tilesize * generaldata2.values[ZOOM] * spritedata.values[TILEMULT])
		local grid_x = math.floor(level_mouse_x / tile_scale)
		local grid_y = math.floor(level_mouse_y / tile_scale)
		local mouse_tileid = grid_x + grid_y * roomsizex

		if(unitmap[mouse_tileid] ~= nil) then
			for _,id in ipairs(unitmap[mouse_tileid]) do
				local targetUnit = mmf.newObject(id)

				-- Karma debug particles
				if WS_DISPLAY_KARMA_DEBUG then
					local karma,x,y = targetUnit.karma,targetUnit.values[XPOS],targetUnit.values[YPOS]
					if (karma == nil) then
						MF_particles("glow",x,y,1,4,4,1,1) -- Blue particles if karma status is nil
					elseif (karma == false) then
						MF_particles("glow",x,y,1,5,4,1,1) -- Green particles if karma status is false
					else
						MF_particles("glow",x,y,1,2,2,1,1) -- Red particles if karma status is true
					end
				end

				-- Trapped debug particles
				if WS_DISPLAY_TRAPPED_DEBUG then
					local trapped,x,y = targetUnit.ws_trapped,targetUnit.values[XPOS],targetUnit.values[YPOS]
					if (trapped == nil) then
						MF_particles("wonder",x,y,1,4,4,1,1) -- Blue particles if trapped status is nil
					elseif (trapped == false) then
						MF_particles("wonder",x,y,1,5,4,1,1) -- Green particles if trapped status is false
					else
						MF_particles("wonder",x,y,1,2,2,1,1) -- Red particles if trapped status is true
					end
				end

				-- Bungee position marker particles
				if WS_DISPLAY_BUNGEE_POSITION and targetUnit.visible then
					local bungeePosition = targetUnit.ws_bungee_pos
					if (bungeePosition ~= nil) then
						local tx,ty = math.floor(bungeePosition % roomsizex), math.floor(bungeePosition / roomsizex)
						local c1,c2 = getcolour(id)
						ws_spawnStaticParticle("unlock",tx,ty,c1,c2,1)
					end
				end

				-- Code to display AMBIENT and MISSING info (courtesy of PlasmaFlare!)
				if not (generaldata2.values[INPAUSEMENU] == 1) then
					if WS_DISPLAY_AMBIENT_VALUE and targetUnit.strings[UNITNAME] == "text_ambient" and targetUnit.visible then
						local x,y = targetUnit.x,targetUnit.y
						local y_offset = 0

						for outline_x = -2, 2, 2 do
							for outline_y = -2, 2, 2 do
								writetext(ws_ambientObject,-1, x + outline_x, y + outline_y - tile_scale, "ws_text", true, 2, true, {4,0})
							end
						end
						writetext(ws_ambientObject,-1, x, y - tile_scale,"ws_text",true,2,true,{4,2})
					end
					if WS_DISPLAY_MISSING_TABLE and targetUnit.strings[UNITNAME] == "text_missing" and targetUnit.visible then
						local x,y = targetUnit.x,targetUnit.y
						local nothingWasDestroyed = true
						local line = 0
						for name,amount in pairs(ws_deathCounter) do
							nothingWasDestroyed = false
							for outline_x = -2, 2, 2 do
								for outline_y = -2, 2, 2 do
									writetext(name..": "..tostring(amount),-1, x + outline_x, y + outline_y - tile_scale + line, "ws_text", true, 2, true, {2,0})
								end
							end
							writetext(name..": "..tostring(amount),-1, x, y - tile_scale + line,"ws_text",true,2,true,{2,2})

							line = line + 20
						end
						if nothingWasDestroyed then
							for outline_x = -2, 2, 2 do
								for outline_y = -2, 2, 2 do
									writetext("Nothing has been destroyed",-1, x + outline_x, y + outline_y - tile_scale, "ws_text", true, 2, true, {2,0})
								end
							end
							writetext("Nothing has been destroyed",-1, x, y - tile_scale,"ws_text",true,2,true,{2,2})
						end
					end
				end
			end
		end
	end
end

-------- HELPER FUNCTIONS --------
-- Helper functions to convert x,y <--> tileid
function ws_toTileId(x, y)
	return x + y * roomsizex
end

function ws_fromTileId(tileid)
	return tileid % roomsizex, math.floor(tileid / roomsizex)
end


-- Stores extra data of a unit (karma, trapped status and bungee position) in a map, to pass to the "remove" undo. For some reasons directly passing karma when it's nil causes problems when undoing
function ws_extraData(unit)
	local result = {}
	result.karma = unit.karma
	result.trapped = unit.ws_trapped
	result.bungee_pos = unit.ws_bungee_pos
	return result
end

-- Whether hovering with the mouse on a unit should show particles for karma/trapped/bungee values
function ws_showDebugParticles()
	return WS_DISPLAY_KARMA or WS_DISPLAY_TRAPPED or WS_DISPLAY_BUNGEE_POSITION
end

function ws_markAsTeled(unitid)
	if (objectdata[unitid] == nil) then
		objectdata[unitid] = {}
	end

	local odata = objectdata[unitid]
	odata.tele = 1
end

-- Helper function to find all empties with a given property (for example rescue), because i have no idea how to extract the empties from findallfeature3
function ws_findEmptiesWithProperty(property)
	local group = findfeature("empty","is",property)
	local empty = {}
	local foundEmpties = {}

	if (group ~= nil) then
		for i,v in ipairs(group) do
			if (v[1] == "empty") then
				local conds = v[2]
				local needstest = false
				local testbroken = false
				local valid = true

				if (#conds > 0) and ((conds[1] ~= nil) and (conds[1][1] ~= "never")) then
					needstest = true
				elseif (#conds > 0) and ((conds[1] ~= nil) and (conds[1][1] == "never")) then
					valid = false
				end

				if (featureindex["broken"] ~= nil) then
					testbroken = true
				end

				if valid then
					for a=1,roomsizex-2 do
						for b=1,roomsizey-2 do
							local tileid = a + b * roomsizex

							if ((unitmap[tileid] == nil) or (#unitmap[tileid] == 0)) then
								valid = true
								if testbroken then
									local brok = isitbroken("empty",2,a,b)

									if (brok == 1) then
										valid = false
									end
								end

								if valid then
									if (needstest == false) then
										foundEmpties[tileid] = true
									else
										if testcond(conds,2,a,b,nil,nil,checkedconds) then
											foundEmpties[tileid] = true
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	for id,_ in pairs(foundEmpties) do
		table.insert(empty,id)
	end

	return empty
end

-- Helper function to spawn a still particle in a tile, used to debug bungee
function ws_spawnStaticParticle(particle,x,y,c1,c2,layer)
	local zoom = generaldata2.values[ZOOM]
	local partid = MF_particle(particle,x,y,c1,c2,layer)
	if (partid ~= nil) and (partid ~= 0) then
		local part = mmf.newObject(partid)

		part.values[ONLINE] = 2
		local midx = math.floor(roomsizex * 0.5)
		local midy = math.floor(roomsizey * 0.5)
		local mx = x + 0.5 - midx
		local my = y + 0.5 - midy

		local dir = 0 - math.atan2(my, mx)
		local dist = math.sqrt(my ^ 2 + mx ^ 2)
		local roomrad = math.rad(generaldata2.values[ROOMROTATION])

		mx = Xoffset + (midx + math.cos(dir + roomrad) * dist * zoom) * tilesize * spritedata.values[TILEMULT]
		my = Yoffset + (midy - math.sin(dir + roomrad) * dist * zoom) * tilesize * spritedata.values[TILEMULT]

		part.x = mx + math.random() * zoom * tilesize * 0.8 - 0.4 * zoom * tilesize
		part.y = my + math.random() * zoom * tilesize * 0.8 - 0.4 * zoom * tilesize
		part.values[XPOS] = part.x
		part.values[YPOS] = part.y
	end
end

-- Helper function to spawn a still particle on the side of a tile, used by BANG
function ws_spawnSideParticle(particle,x,y,c1,c2,layer,ox,oy,velocity,count_,spread_)
	local zoom = generaldata2.values[ZOOM]
	local count = count_ or 1
	local spread = spread_ or 1
	for i = 1,count do
		local partid = MF_particle(particle,x,y,c1,c2,layer)
		if (partid ~= nil) and (partid ~= 0) then
			local part = mmf.newObject(partid)

			part.values[ONLINE] = 2
			local midx = math.floor(roomsizex * 0.5)
			local midy = math.floor(roomsizey * 0.5)
			local mx = x + 0.5 + (0.5 * ox) - midx
			local my = y + 0.5 + (0.5 * oy) - midy

			local sx,sy = 1 - math.abs(ox), 1 - math.abs(oy) -- x and y spreads

			local dir = - math.atan2(my, mx)
			local dist = math.sqrt(my ^ 2 + mx ^ 2)
			local roomrad = math.rad(generaldata2.values[ROOMROTATION])

			mx = Xoffset + (midx + math.cos(dir + roomrad) * dist * zoom) * tilesize * spritedata.values[TILEMULT]
			my = Yoffset + (midy - math.sin(dir + roomrad) * dist * zoom) * tilesize * spritedata.values[TILEMULT]

			part.x = mx + math.random() * zoom * tilesize * spread * sx - 0.5 * zoom * tilesize * sx * spread
			part.y = my + math.random() * zoom * tilesize * spread * sy - 0.5 * zoom * tilesize * sy * spread
			part.values[XPOS] = part.x
			part.values[YPOS] = part.y

			part.values[XVEL] = ox * 8 * velocity * math.random()
			part.values[YVEL] = oy * 8 * velocity * math.random()
		end
	end
end

function ws_bangDestructionParticles(x,y,c1_,c2_,ox,oy,count)
	local zoom = generaldata2.values[ZOOM]
	for i = 1,count do
		local particle = "eat"
		local c1,c2 = c1_,c2_
		if (i == 1) then
			c1 = 0
			c2 = math.random(1,3)
		end
		if (i <= 2) then
			particle = "hot"
		end

		local partid = MF_particle(particle,x,y,c1,c2,1)
		if (partid ~= nil) and (partid ~= 0) then
			local part = mmf.newObject(partid)

			part.values[ONLINE] = 2
			local midx = math.floor(roomsizex * 0.5)
			local midy = math.floor(roomsizey * 0.5)
			local mx = x + 0.5 - midx - ((0.35 + math.random()*0.1) * ox)
			local my = y + 0.5 - midy - ((0.35 + math.random()*0.1) * oy)

			local sx,sy = 1 - math.abs(ox), 1 - math.abs(oy) -- x and y spreads

			local dir = - math.atan2(my, mx)
			local dist = math.sqrt(my ^ 2 + mx ^ 2)
			local roomrad = math.rad(generaldata2.values[ROOMROTATION])

			mx = Xoffset + (midx + math.cos(dir + roomrad) * dist * zoom) * tilesize * spritedata.values[TILEMULT]
			my = Yoffset + (midy - math.sin(dir + roomrad) * dist * zoom) * tilesize * spritedata.values[TILEMULT]

			part.x = mx + math.random() * zoom * tilesize * 0.6 * sx - 0.3 * zoom * tilesize * sx
			part.y = my + math.random() * zoom * tilesize * 0.6 * sy - 0.3 * zoom * tilesize * sy
			part.values[XPOS] = part.x
			part.values[YPOS] = part.y

			part.values[XVEL] = ox * 10 * math.random() + oy * 3.5 * (math.random() - 0.5)
			part.values[YVEL] = oy * 10 * math.random() + ox * 3.5 * (math.random() - 0.5)
		end
	end

end


-------- VESSEL/ALIVE FUNCTIONS --------

-- Checks if the given property is a "player" property
function ws_isPlayerProp(property)
	return property == "you" or property == "you2" or property == "3d" or property == "alive"
			or property == "puppet" or property == "you+" --@mods (extrem x word salad)
end


-- Checks if the level is a "player"
function ws_isLevelPlayer(i,j)
	if (i == nil) or (j == nil) then
		return (hasfeature("level","is","you",1) ~= nil) or (hasfeature("level","is","you2",1) ~= nil) or (hasfeature("level","is","3d",1) ~= nil) or (hasfeature("level","is","alive",1) ~= nil) or (hasfeature("level","is","you+",1) ~= nil) or (hasfeature("level","is","puppet",1) ~= nil)
	else
		return (hasfeature("level","is","you",1,i,j) ~= nil) or (hasfeature("level","is","you2",1,i,j) ~= nil) or (hasfeature("level","is","3d",1,i,j) ~= nil) or (hasfeature("level","is","alive",1,i,j) ~= nil) or (hasfeature("level","is","puppet",1,i,j) ~= nil) or (hasfeature("level","is","you+",1,i,j) ~= nil)
	end
end


-- Returns all the features that match a "player" property
function ws_findPlayers()
	local yous = findfeature(nil,"is","you") or {}
	local yous2 = findfeature(nil,"is","you2")
	local yous3 = findfeature(nil,"is","3d")
	local yous42 = findfeature(nil,"is","alive") -- Added check for ALIVE
	local yous4 = findfeature(nil, "is", "puppet")
	local yous5 = findfeature(nil, "is", "you+")

	if (yous2 ~= nil) then
		for _,v in ipairs(yous2) do
			table.insert(yous, v)
		end
	end

	if (yous3 ~= nil) then
		for _,v in ipairs(yous3) do
			table.insert(yous, v)
		end
	end

	if (yous42 ~= nil) then -- Add ALIVE entities to "yous"
		for _,v in ipairs(yous42) do
			table.insert(yous, v)
		end
	end


	if (yous4 ~= nil) then
		for i, v in ipairs(yous4) do
			table.insert(yous, v)
		end
	end

	if (yous5 ~= nil) then
		for i, v in ipairs(yous5) do
			table.insert(yous, v)
		end
	end

	return yous
end


-- Returns all units with any player property.
function ws_findPlayerUnits()
	local isyou = getunitswitheffect("you",false,delthese)
	local isyou2 = getunitswitheffect("you2",false,delthese)
	local isyou3 = getunitswitheffect("3d",false,delthese)
	local isyou42 = getunitswitheffect("alive",false,delthese) -- EDIT: add ALIVE units
	local isyou4 = getunitswitheffect("puppet", false, delthese)
	local isyou5 = getunitswitheffect("you+", false, delthese)

	for i,v in ipairs(isyou2) do
		table.insert(isyou, v)
	end

	for i,v in ipairs(isyou3) do
		table.insert(isyou, v)
	end

	for i,v in ipairs(isyou42) do
		table.insert(isyou, v)
	end

	for i, v in ipairs(isyou4) do
		table.insert(isyou, v)
	end

	for i, v in ipairs(isyou5) do
		table.insert(isyou, v)
	end

	return isyou
end


-- Checks if empty should be considered a player
function ws_areTherePlayerEmpties()
	return ((#findallfeature("empty","is","you") > 0) or (#findallfeature("empty","is","you2") > 0) or (#findallfeature("empty","is","you+") > 0) or (#findallfeature("empty","is","3d") > 0) or (#findallfeature("empty","is","alive") > 0)or (#findallfeature("empty", "is", "puppet") > 0))
end


-- Returns all the features of the type "level is you-id" or "level is vessel-id"
function ws_findLevelVessel(id_)
	local levelmove
	local id = id_ or ""
	
	levelmove = findfeature("level","is","you"..id) or {}
	local levelvessel = findfeature("level","is","vessel"..id)
	if (levelvessel ~= nil) then
		for i,v in ipairs(levelvessel) do
			table.insert(levelmove, v)
		end
	end
	
	return levelmove
end


-- Returns all the features of the type "x/empty is you-id" or "x/empty is vessel-id"
function ws_findVessels(id_)
	local players = {}
	local empty = {}
	local id = id_ or ""
	
	players,empty = findallfeature(nil,"is","you"..id)
	local vessels,emptyvessels = findallfeature(nil,"is","vessel"..id)
	if (vessels ~= nil) then
		for i,v in ipairs(vessels) do
			table.insert(players, v)
		end
		for i,v in ipairs(emptyvessels) do
			table.insert(empty, v)
		end
	end
	
	return players,empty
end


-- Returns all the features at a certain position that are "players"
function ws_findplayerfeatureat(x,y)
	local result = findfeatureat(nil,"is","you",x,y) or {}
	local you2 = findfeatureat(nil,"is","you2",x,y) or {}
	local you3 = findfeatureat(nil,"is","3d",x,y) or {}
	local you42 = findfeatureat(nil,"is","alive",x,y) or {}
	local you4 = findfeatureat(nil,"is","you+",x,y) or {}
	local you5 = findfeatureat(nil,"is","puppet",x,y) or {}
	for _,v in ipairs(you2) do
		table.insert(result, v)
	end

	for _,v in ipairs(you3) do
		table.insert(result, v)
	end

	for _,v in ipairs(you42) do
		table.insert(result, v)
	end

	for _,v in ipairs(you4) do
		table.insert(result, v)
	end

	for _,v in ipairs(you5) do
		table.insert(result, v)
	end

	return result
end


-------- KARMA/SINFUL/REPENT FUNCTIONS --------

-- Sets the level karma to a new value (true by default) and adds it to the undo queue if it was changed
function ws_setLevelKarma(_newKarma)
	local newKarma = true
	if (_newKarma ~= nil) then 
		newKarma = _newKarma 
	end
	if (levelKarma ~= newKarma) then
		addundo({"levelkarma", levelKarma})
		levelKarma = newKarma
	end
end


-- Sets the karma of an object to a new value (true by default) and adds it to the undo queue if it was changed
function ws_setKarma(unitid, _newKarma)
	local unit = mmf.newObject(unitid)
	local newKarma = true
	if (_newKarma ~= nil) then 
		newKarma = _newKarma 
	end
	if (unit.karma ~= newKarma) then
		addundo({"unitkarma",unit.values[ID], unit.karma})
		unit.karma = newKarma
	end
end


--[[ Apply karma to destroyer tiles: 
PARAMS
	x, y: position of the victim
	reason: why the destroyer killed something (eg "melt", "weak", "bonus" etc)
	victimid: the unitid of the object that got destroyed
]]
-- Do we even need to pass/return delthese, removalshort and removalsound? Seems to work ¯\_(ツ)_/¯
function ws_karma(x, y, reason, victimid, delthese, removalshort, removalsound)
	if reason == "melt" then
		local hotfeatures = findfeatureat(nil,"is","hot",x,y)
		for _,hotid in ipairs(hotfeatures) do
			if floating(hotid,victimid,x,y) then -- Only the lavas on the same float level of the melted object are evil
				delthese,removalshort,removalsound = ws_setKarmaOrDestroy(x,y,hotid,delthese,removalshort,removalsound)
			end
		end
	elseif reason == "weak" then
		local others = findallhere(x,y) -- Get all the other overlapping items
		for _,otherid in ipairs(others) do
			if floating(otherid,victimid,x,y) and (otherid ~= victimid) then -- Cornercase, but don't karma self
				delthese,removalshort,removalsound = ws_setKarmaOrDestroy(x,y,otherid,delthese,removalshort,removalsound)
			end
		end
	elseif reason == "defeat" then
		local defeatfeatures = findfeatureat(nil,"is","defeat",x,y)
		for _,defeatid in ipairs(defeatfeatures) do
			if floating(defeatid,victimid,x,y) then -- Only the skulls on the same float level of the defeated object are evil
				delthese,removalshort,removalsound = ws_setKarmaOrDestroy(x,y,defeatid,delthese,removalshort,removalsound)
			end
		end
	elseif reason == "bonus" then
		local playerfeatures = ws_findplayerfeatureat(x,y) --(find all the features that are you, you2, 3d, alive)
		for _,playerid in ipairs(playerfeatures) do
			if floating(playerid,victimid,x,y) then
				delthese,removalshort,removalsound = ws_setKarmaOrDestroy(x,y,playerid,delthese,removalshort,removalsound)
			end
		end
	elseif reason == "sink" then -- Object got sinked by something that is SINK
		local sinkfeatures = findfeatureat(nil,"is","sink",x,y)
		for _,sinkid in ipairs(sinkfeatures) do
			if floating(sinkid,victimid,x,y) then -- Only the sinkers on the same float level of the defeated object are evil
				delthese,removalshort,removalsound = ws_setKarmaOrDestroy(x,y,sinkid,delthese,removalshort,removalsound)
			end
		end
	elseif reason == "sink2" then -- Object that is SINK got sinked by something else
		-- @mods(word salad x plasma) - rewrote this entire section since guard allows units to still survive while not being "safe".
		local others = findallhere(x,y) -- Get all the other overlapping items
		for _,otherid in ipairs(others) do
			if otherid ~= victimid and floating(otherid,victimid,x,y) and not ws_isrepent(otherid,x,y) then -- Only scan objects that aren't the victim with the same float level
				if is_unit_guarded(otherid) or issafe(otherid) then -- Objects that survive (either through SAFE or GUARD) after the sink action are evil
					ws_setKarma(otherid)
				end
			end
		end
		-- local sinkerfeatures = findfeatureat(nil,"is","safe",x,y) -- Only the survived items are to blame
		-- for _,sinkerid in ipairs(sinkerfeatures) do
		-- 	if floating(sinkerid,victimid,x,y) then -- Only the skulls on the same float level of the defeated object are evil
		-- 		ws_setKarma(sinkerid) -- The sinker is safe, we can directly set its karma
		-- 	end
		-- end
	elseif reason == "toxic" then
		-- @mods(extrem x word salad) Implement karma for toxic.
		local toxicfeatures = findfeatureat(nil,"is","toxic",x,y)
		for _,toxicid in ipairs(toxicfeatures) do
			if floating(toxicid,victimid,x,y) then -- Only the acids on the same float level of the poisoned object are evil
				delthese,removalshort,removalsound = ws_setKarmaOrDestroy(x,y,toxicid,delthese,removalshort,removalsound)
			end
		end
	end
	return delthese, removalshort, removalsound
end


--[[ Destroy tiles by karma, or sets the karma flag, unless the object is REPENT
-- x, y: pos of the tile
-- karmaid: id of the unit to destroy
-- delthese: list of unitids to destroy (passed by reference? do we need to return it?)
]]
function ws_setKarmaOrDestroy(x_, y_, karmaid, delthese, removalshort, removalsound)
	local karmaunit = mmf.newObject(karmaid)
	local x = x_ or karmaunit.values[XPOS]
	local y = y_ or karmaunit.values[YPOS]
	if not ws_isrepent(karmaid,x,y) then
		if hasfeature(getname(karmaunit), "is", "karma", karmaid) and not issafe(karmaid) then
		local pmult,sound = checkeffecthistory("karma")
		MF_particles("unlock",x,y,5 * pmult,2,2,1,1)
		removalshort = sound
		removalsound = 1
		generaldata.values[SHAKE] = 4
		table.insert(delthese, karmaid)

		--[[ 
			@mods(word_salad x plasma) - The below line wasn't added in the original word salad since at this point in the
			code, the karma unit is set to be destroyed. Why bother updating the karma status when the unit will be destroyed?
			Guard however can "rescue" the karma unit from actually being destroyed, meaning the karma unit is in
			delthese but the unit survives. So we still need to update the unit's karma status.
		]]
		if is_unit_guarded(karmaid) then
			ws_setKarma(karmaid)
		end
	else
		ws_setKarma(karmaid)
	end
	end
	return delthese, removalshort, removalsound
end

-- Function to destroy empty by karma in rare instances (EMPTY IS BANG, solid empty destroys a weak object etc.)
function ws_emptyKarma(x,y)
	if not ws_isrepent(2,x,y) and not issafe(2,x,y) then
		if hasfeature("empty","is","karma",2,x,y) then
			delete(2,x,y)
			local pmult,sound = checkeffecthistory("karma")
			setsoundname("removal",1,sound)
			MF_particles("unlock",x,y,5 * pmult,2,2,1,1)
			generaldata.values[SHAKE] = 4
		end
	end
end


-- Immediately destroys an object by karma (without adding it to the "delthese" list), or sets it sinful status
-- Used by movement destructions such as EAT or WEAK into solid object
function ws_doImmediateKarma(unitid,x,y)
	local unit = mmf.newObject(unitid)
	local name = getname(unit)
	if not issafe(unitid,x,y) and hasfeature(name,"is","karma",unitid,x,y) then -- First try to destroy the unit by KARMA
		delete(unitid,x,y)
		deleted[unitid] = 1
		local pmult,sound = checkeffecthistory("karma")
		setsoundname("removal",1,sound)
		MF_particles("unlock",x,y,5 * pmult,2,2,1,1)
		generaldata.values[SHAKE] = 4
	elseif (unit.karma ~= true) then -- The unit can't be destroyed (it's safe or it's not karma), so try to update the sinful status
		addundo({"unitkarma",unit.values[ID], unit.karma})
		unit.karma = true
	end
end

-- Function to check if something is repent (basically the same as issafe)
function ws_isrepent(unitid,x,y)
	local name = ""
	
	if (unitid ~= 1) and (unitid ~= 2) then
		local unit = mmf.newObject(unitid)
		name = unit.strings[UNITNAME]
	elseif (unitid == 1) then
		name = "level"
	else
		name = "empty"
	end
	
	local repent = hasfeature(name,"is","repent",unitid,x,y)
	
	if (repent ~= nil) then
		return true
	end
	
	return false
end


-------- HOP/HOPS FUNCTIONS --------

-- Function to check if a unit *could* hop if it bumped into an obstacle: that is, if the unit is HOP, or if it HOPS any unit in the next tile
-- NOTE: empty has to be handled differently?
function ws_couldHop(unitid,x,y,ox,oy)
	local name = ""
	if (unitid ~= 2) then
		name = getname(mmf.newObject(unitid))
	else
		name = "empty"
	end
	-- First, check if the unit is HOP
	if hasfeature(name,"is","hop",unitid,x,y) then return true end
	-- Then, we check if it HOPS anything in the next tile
	if (featureindex["hops"] ~= nil) then
		local obs = findobstacle(x+ox,y+oy)
		if (#obs > 0) then -- The next tile isn't empty
			for i,obsid in ipairs(obs) do
				if (obsid == -1) then -- Bumping into the level edge, check if "x HOPS LEVEL"
					if hasfeature(name,"hops","level",unitid,x,y) then return true end
				else -- Bumping into something, check if the unit hops anything
					local obsunit = mmf.newObject(obsid)
					local obsname = getname(obsunit)
					-- timedmessage("Checking if "..name.." hops "..obsname,0,i)
					if hasfeature(name,"hops",obsname,unitid,x,y) then return true end
				end
			end
		else -- The next tile is empty, check if "x HOPS EMPTY"
			if hasfeature(name,"hops","empty",unitid,x,y) then return true end
		end
	end

	return false
end


-------- ECHO FUNCTIONS --------

-- Function to query the text data from the echo map, given the name of a echo unit
function ws_getTextDataFromEchoMap(unitname)
	local matching_texts = echomap[unitname] or {}
	-- If the object being echo is the outer level, we also add all the texts from the outer level. hooray for meta stuff
	if (unitname == "level") then
		local outer_text = echomap["_outerlevel"] or {}
		for _,outer_data in ipairs(outer_text) do
			table.insert(matching_texts, outer_data)
		end
	end

	return matching_texts
end

-- Function to check for changes to echo units (similar to checkwordchanges in utils.lua)
function ws_checkechochanges(unitid)
	if (#echounits > 0) then
		for i,v in ipairs(echounits) do
			if (v[1] == unitid) then
				updatecode = 1
				return
			end
		end
	end
	
	if (#echorelatedunits > 0) then
		for i,v in ipairs(echorelatedunits) do
			if (v[1] == unitid) then
				updatecode = 1
				return
			end
		end
	end
end
-- Find echo units
-- How to implement the echo map(?):
-- ICE -> [text_baba, text_keke]
-- BABA -> []
-- KEKE -> [text_keke] etc.
-- When checking for echo units, remove overlapping texts from list
-- 
function ws_findechounits()
	local result = {}
	local alreadydone = {}
	local checkrecursion = {}
	local related = {}
	
	local identifier = ""
	local fullid = {}
	
	if (featureindex["echo"] ~= nil) then -- Something is ECHO
		for i,v in ipairs(featureindex["echo"]) do -- For all rules that contain ECHO
									-- Example for KEKE ON BABA AND NOT NEAR ME IS ECHO
			local rule = v[1]		-- The basic rule: {"keke", "is", "echo"}
			local conds = v[2]		-- The conditions: {"on", {"baba"}}, {"not near", {"me"}}-- The conditions: {"on", {"baba"}}, {"not near", {"me"}}
			local ids = v[3]		-- Unit ids of the text pieces: {{unitid of "keke"}, {unitid of "is"}, {unitid of "echo"}...}
			
			local name = rule[1]	-- The object in the rule being ECHO ("keke", "not baba" etc.)
			local subid = ""

			if (rule[2] == "is") then	-- Only rules of the type "x IS echo" are valid
				if (objectlist[name] ~= nil) and (name ~= "text") and (alreadydone[name] == nil) then -- TEXT can't be ECHO
					local these = findall({name,{}}) -- Find all unit ids with the given name and no conditions
					--alreadydone[name] = 1 -- This specific name is already checked (prevents checking for ECHO KEKEs twice for example). This breaks if there are 2 echo rules w/ different conds.
					
					if (#these > 0) then -- If there are objects
						for _,b in ipairs(these) do
							local bunit = mmf.newObject(b)
							local valid = true
							
							if (featureindex["broken"] ~= nil) then -- Skip BROKEN objects
								if (hasfeature(getname(bunit),"is","broken",b,bunit.values[XPOS],bunit.values[YPOS]) ~= nil) then
									valid = false
								end
							end
							
							if valid then
								table.insert(result, {b, conds}) -- Apped the unit ids + conditions to the result table
								subid = subid .. name -- From "" to "name" (e.g. "" -> "keke")
								-- LISÄÄ TÄHÄN LISÄÄ DATAA (translated: Add more data here)
							end
						end
					end
				end
				
				if (#subid > 0) then -- If subid has lenght > 0 (there was at least one valid unit)
					for _,b in ipairs(conds) do		-- conds is {"on", {"baba"}}, {"not near", {"me"}}
						local condtype = b[1]		-- The operator (ON, NEAR, LONELY...)
						local params = b[2] or {}	-- The parameters (on BABA, near NOT WALL), empty for prefixes
						
						subid = subid .. condtype	-- from "namenamename" to "namenamenamecondtype"? Seems so
						
						if (#params > 0) then		-- If the condition has parameters
							for _,d in ipairs(params) do -- For all condition parameters
								subid = subid .. tostring(d) -- append them to subid
								
								related = findunits(d,related,conds) -- Related is initially empty
							end
						end
					end
				end
				
				table.insert(fullid, subid) -- Insert the subids inside the fullid table ("kekekekeonwall", "baba" etc.)
				
				--MF_alert("Going through " .. name)
				
				if (#ids > 0) then -- Unitids of the texts that make the "x is echo" rules
					if (#ids[1] == 1) then -- subject of rule has exactly one entry
						local firstunit = mmf.newObject(ids[1][1])

						local notname = name
						if (string.sub(name, 1, 4) == "not ") then
							notname = string.sub(name, 5)
						end
						
						-- If the subject of rule isn't "text_name" or "text_name" (not removed), check for recursion
						if (firstunit.strings[UNITNAME] ~= "text_" .. name) and (firstunit.strings[UNITNAME] ~= "text_" .. notname) then 
							--MF_alert("Checking recursion for " .. name)
							-- timedmessage("Found echo rule starting with non text object", 0, 1) -- DEBUG
							table.insert(checkrecursion, {name, i}) -- Add the object name to the list of stuff to check recursion for (pairs of {name, index of rule with echo})
						end
					end
				else
					MF_alert("No ids listed in Echo-related rule! mod_word_salad/!utils.lua line 540") -- um, this was clearly copied from the WORD code
				end
			end
		end
		
		table.sort(fullid) -- After checking all the rules with echo, sort the table of fullid
		for _,v in ipairs(fullid) do
			-- MF_alert("Adding " .. v .. " to id")
			identifier = identifier .. v -- Concatenate all the fullids "kekekekeonwallbabafrogfrog" etc.
		end
		
		--MF_alert("Identifier: " .. identifier)
		
		-- ISSUE IS PROBABLY HERE!!
		for _,checkname_ in ipairs(checkrecursion) do -- For all objects in the "check recursion table"
			local found = false
			
			local checkname = checkname_[1] -- The name of the object to check recursion for
			
			local b = checkname -- Actual name without the "not " at the beginning
			if (string.sub(b, 1, 4) == "not ") then
				b = string.sub(checkname, 5)
			end
			
			for _,v in ipairs(featureindex["echo"]) do -- Check all rules with "echo" again
				local rule = v[1]	-- The basic rule: {"keke", "is", "echo"}
				local ids = v[3]	-- Unit ids of the text pieces: {{unitid of "keke"}, {unitid of "is"}, {unitid of "echo"}...}
				local tags = v[4]	-- Rule tags such as "base" or "mimic"
				
				-- If the rule subject is the object, ALL, or not the object and the subject starts with not
				if (rule[1] == b) or (rule[1] == "all") or ((rule[1] ~= b) and (string.sub(rule[1], 1, 3) == "not")) then 
					for _,g in ipairs(ids) do
						for _,d in ipairs(g) do
							local idunit = mmf.newObject(d)	-- Single text piece making up part of a word of the rule
							
							-- Tässä pitäisi testata myös Group! (Translated: group should be tested here too)
							if (idunit.strings[UNITNAME] == "text_" .. rule[1]) or (rule[1] == "all") then
								--MF_alert("Matching objects - found")
								found = true
							elseif (string.sub(rule[1], 1, 5) == "group") then
								--MF_alert("Group - found")
								found = true
							elseif (rule[1] ~= checkname) and (string.sub(rule[1], 1, 3) == "not") then
								--MF_alert("Not Object - found")
								found = true
							-- TEST!!!!
							elseif (idunit.strings[UNITNAME] ~= b) then
								-- The unit in the rule isn't the unit that risks being recursive
								found = true
							end
							-- timedmessage("d name is "..idunit.strings[UNITNAME],0,13+www) -- DEBUG
						end
					end
					
					for _,g in ipairs(tags) do -- Check for mimiced rules
						if (g == "mimic") then
							found = true
						end
					end
				end
			end
			
			if (found == false) then -- If the rule wasn't caused by any text (?)
			
				-- timedmessage("Possible recursion for "..b, 0, 12) -- DEBUG
				--MF_alert("Wordunit status for " .. b .. " is unstable!")
				identifier = "null"
				echounits = {} -- Clear all word units???
				
				for _,v in pairs(featureindex["echo"]) do -- Check all the rules with echo once more (???)
					local rule = v[1]
					local ids = v[3]
					
					--MF_alert("Checking to disable: " .. rule[1] .. " " .. ", not " .. b)
					
					if (rule[1] == b) or (rule[1] == "not " .. b) then
						v[2] = {{"never",{}}} -- Disable rules 
					end
				end
				
				if (string.sub(checkname, 1, 4) == "not ") then
					local notrules_word = notfeatures["echo"]
					local notrules_id = checkname_[2]
					local disablethese = notrules_word[notrules_id]
					
					for _,v in ipairs(disablethese) do
						v[2] = {{"never",{}}}
					end
				end
			end
		end
	end
	
	--MF_alert("Current id (end): " .. identifier)
	
	--[[
	for i,name in ipairs(result) do
		timedmessage(name[1], 2, 2 + i) -- Print the id of all the objects that could be echo (ignoring conditions)
	end
	--]]
	
	-- Populate echomap:

	echomap = {} -- Clear the echomap
	-- local all_echo_unitids = findallfeature(nil, "is", "echo", true)
	local all_echo_units = getunitswitheffect("echo")
	-- For each echo object
	for ind,unit in ipairs(all_echo_units) do
		local unit_name = getname(unit)
		-- timedmessage("Found echo unit: " .. unit_name, 0, 2 + ind) -- DEBUG
		-- Skip text objects
		if (unit_name ~= "text") then
			 -- We use the unit name as the key, but it might be the first time it has to be added to the echo map
			if (not echomap[unit_name]) then
				echomap[unit_name] = {}
			end
			-- We then get all the text objects at the same position
			local this_x = unit.values[XPOS]
			local this_y = unit.values[YPOS]

			-- @Merge: set flag for explicit querying of all texts (see findtype() function def for why)
			if (gettilenegated(this_x, this_y) == false) then
				local text_ids = findtype({"text"}, this_x, this_y, nil, false, true) -- We don't need to specify the id of this unit because it can't be text

				-- EXPERIMENT: support echoing word units
				if (WS_CAN_ECHO_WORD_UNITS) then
					for _,words in ipairs(wordunits) do -- The echomap is always filled after the word map, so this should work??
						if (words[1] ~= unit.fixed) then -- If a unit is both ECHO and WORD at the same time, it can't add itself to the echo map
							local word_unit = mmf.newObject(words[1])
							if (word_unit.values[XPOS] == this_x) and (word_unit.values[YPOS] == this_y) then
								table.insert(echomap[unit_name], {word_unit.strings[NAME], 0, this_x + this_y*roomsizex}) -- WORD objects are always nouns
							end
						end
					end
				end

				for _,textid in ipairs(text_ids) do
					local text_unit = mmf.newObject(textid)
					-- Pair of {name, type, position}, for example {"baba", 0, 6}, {"win", 2, 11} etc.
					-- The position is used to skip overlapping texts
					local text_data = {text_unit.strings[NAME], text_unit.values[TYPE], this_x + this_y*roomsizex} 
					text_data.echotext_unitid = textid --@Merge(Word Salad x Plasma) Store the text id of the text unit overlapping the ECHO unit. This is used in codecheck() to allow support for turning text and pointer nouns
					table.insert(echomap[unit_name], text_data)
				end
				-- Special case for LEVEL: aside from normal ECHO, we also repeat any text at the level's position on the map (including the level itself if it was converted)
				-- We need to check this only the first time we have LEVEL IS ECHO, since this can't be changed from within the level
				if (unit_name == "level") then
					if (not echomap["_outerlevel"]) then
						echomap["_outerlevel"] = {}
						if hasfeature("level","is","echo",1) then
							local overlapping = ws_overlapping_texts or {} -- Should  never be nil, but let's be safe
							for i,ovtextdata in ipairs(overlapping) do
								if (unitreference["text_"..ovtextdata[1]] ~= nil) then -- Make sure that the text being echoed is in the level palette
									table.insert(echomap["_outerlevel"], ovtextdata)
								else
									timedmessage("unitreference for " .. ovtextdata[1] .. " was nil!", 0, 2)
								end
							end
						end
					end
				end
			end
		end
	end
	--[[
		(hopefully) We should end up with something like
		echomap = {baba: {{"win", 2, 7}, {"make", 1, 3}}, keke: {{"green", 2, 7}}, ice: {}, flag: {{"baba", 0, 11}}}
	--]]
	
	return result,identifier,related
end


-------- VEHICLE/ENTER FUNCTIONS --------

-- Gets cursors that can enter levels (SELECT or ENTER)
function ws_getSelectOrEnterUnits(nolevels_,ignorethese_,checkedconds,ignorebroken_)
	local result = getunitswitheffect("select",nolevels_,ignorethese_,checkedconds,ignorebroken_)
	local enterCursors = getunitswitheffect("enter",nolevels_,ignorethese_,checkedconds,ignorebroken_)
	
	for _,v in ipairs(enterCursors) do
		table.insert(result, v)
	end
	
	return result
end

-- Gets cursors that can move on paths or opened levels (SELECT or VEHICLE)
function ws_getSelectOrVehicleUnits(nolevels_,ignorethese_,checkedconds,ignorebroken_)
	local result = getunitswitheffect("select",nolevels_,ignorethese_,checkedconds,ignorebroken_)
	local vehicleCursors = getunitswitheffect("vehicle",false,ignorethese_,checkedconds,ignorebroken_)
	
	for _,v in ipairs(vehicleCursors) do
		table.insert(result, v)
	end
	
	return result
end


-------- MORPH FUNCTIONS --------
function ws_updateMorphUnits()
	local morphUnits = getunitswitheffect("morph",false)

	for _,unit in ipairs(morphUnits) do
		local x,y = unit.values[XPOS],unit.values[YPOS]
		local stuff = findallhere(x,y)
		local shouldAddUndo = false -- If the previous overlap map changed, add undo for this unit

		local previousOverlap = unit.ws_previousOverlap or {}
		local currentOverlap = {}

		if (#stuff > 0) then
			for _,v in ipairs(stuff) do
				if floating(v,unit.fixed,x,y) then
					local otherUnit = mmf.newObject(v)
					local otherName = otherUnit.strings[UNITNAME]
					if (v ~= unit.fixed) then
						currentOverlap[otherName] = true
						if not previousOverlap[otherName] then  -- Something that wasn't overlapping is now overlapping
							shouldAddUndo = true
						end
					end
				end
			end
		end

		morphTargets = {}
		ws_addMorphOdata(unit.fixed, {})

		for previousUnit,_ in pairs(previousOverlap) do
			if not currentOverlap[previousUnit] then -- The unit overlapped previously, but no longer overlaps
				morphTargets[previousUnit] = true
				shouldAddUndo = true
			end
		end

		ws_addMorphOdata(unit.fixed, morphTargets)
		if shouldAddUndo then
			addundo({"ws_morph", unit.values[ID], previousOverlap})
		end
		unit.ws_previousOverlap = currentOverlap
	end
end

function ws_addMorphOdata(unitid, morphTargets)
	if (objectdata[unitid] == nil) then
		objectdata[unitid] = {}
	end

	local odata = objectdata[unitid]
	odata.ws_morphTargets = morphTargets
end

function ws_getMorphOdata(unitid)
	if (objectdata[unitid] == nil) then
		objectdata[unitid] = {}
	end

	local odata = objectdata[unitid]
	return odata.ws_morphTargets or {}
end

function ws_clearMorphData()
	for _,unit in ipairs(units) do
		if (unit.ws_previousOverlap ~= nil) then
			local x,y,name,unitid = unit.values[XPOS],unit.values[YPOS],unit.strings[UNITNAME],unit.fixed
			local ismorph = hasfeature(name,"is","morph",unitid,x,y)
			if (ismorph == nil) then -- If the unit ISN'T morph, clear the "previously overlapping" map
				unit.ws_previousOverlap = nil
			end
		end
	end
end


-------- MISSING FUNCTIONS --------
-- This function increases the death counter for the given unit type ("baba", "empty", "text" etc.)
function ws_updateDeathCounter(name)
	-- timedmessage("Adding "..unitname.." to the kill counter",10,1)
	if (ws_deathCounter[name] == nil) then
		ws_deathCounter[name] = 1
	else
		ws_deathCounter[name] = ws_deathCounter[name] + 1
	end

	addundo({"ws_deathCounter", name})
end


-------- DOMINO FUNCTIONS --------
-- Essentially a flood fill function, removes all adjacent domino tiles from the given position (AAAAAAAAAAAA)
function ws_doDomino(dominoedTiles,dontDominoThese,unitid,x_,y_,dontDominoTheseE_)
	local dontDominoTheseE = dontDominoTheseE_ or {}
	local x,y = 0,0
	if (unitid ~= 2) then
		local unit = mmf.newObject(unitid)
		x,y = unit.values[XPOS],unit.values[YPOS]
	end

	local toDomino = WS_Queue.new()

	local tileid = x + y * roomsizex
	WS_Queue.pushleft(toDomino, tileid)

	while not WS_Queue.isempty(toDomino) do
		local toCheck = WS_Queue.popright(toDomino)
		local cx,cy = ws_fromTileId(toCheck)

		if (ws_doDominoFill(dominoedTiles,dontDominoThese,unitid,cx,cy,dontDominoTheseE)) then -- If we properly "dominoed" this tile, try to domino the 4 adjacent ones too
			if (inbounds(cx-1,cy)) then WS_Queue.pushleft(toDomino, ws_toTileId(cx-1,cy)) end
			if (inbounds(cx+1,cy)) then WS_Queue.pushleft(toDomino, ws_toTileId(cx+1,cy)) end
			if (inbounds(cx,cy-1)) then WS_Queue.pushleft(toDomino, ws_toTileId(cx,cy-1)) end
			if (inbounds(cx,cy+1)) then WS_Queue.pushleft(toDomino, ws_toTileId(cx,cy+1)) end
		end
	end
end

-- Deletes all pending domino units/empties, then clears the pending sets
function ws_deleteDominos()

	local pmult,sound = checkeffecthistory("domino")

	for b,_ in pairs(ws_pendingDomino) do
		if (deleted[b] == nil) then -- Due to order of operations, some units might already be deleted at this point!
			local bunit = mmf.newObject(b)
			local bx,by = bunit.values[XPOS],bunit.values[YPOS]

			local c1,c2 = getcolour(b)
			ws_spawnSideParticle("error", bx,by, c1,c2, 1, 0,1, 0)
			ws_spawnSideParticle("error", bx,by, c1,c2, 1, 0,-1, 0)
			ws_spawnSideParticle("error", bx,by, c1,c2, 1, 1,0, 0)
			ws_spawnSideParticle("error", bx,by, c1,c2, 1, -1,0, 0)

			delete(b,bx,by)
			deleted[b] = 1
		end
	end

	for b,_ in pairs(ws_pendingDominoE) do
		local bx,by = ws_fromTileId(b)
		ws_spawnSideParticle("error", bx,by, 0,3, 1, 0,1, 0)
		ws_spawnSideParticle("error", bx,by, 0,3, 1, 0,-1, 0)
		ws_spawnSideParticle("error", bx,by, 0,3, 1, 1,0, 0)
		ws_spawnSideParticle("error", bx,by, 0,3, 1, -1,0, 0)
		delete(2,bx,by)
	end

	ws_pendingDomino,ws_pendingDominoE = {},{}
end

function ws_isdomino(unitid,x,y)
	name = ""

	if (unitid ~= 1) and (unitid ~= 2) then
		local unit = mmf.newObject(unitid)
		name = unit.strings[UNITNAME]
	elseif (unitid == 1) then
		name = "level"
	else
		name = "empty"
	end

	local domino = hasfeature(name,"is","domino",unitid,x,y)

	return (domino ~= nil)
end


-- Check if the tile at x y contains valid domino things that could be destroyed
function ws_doDominoFill(dominoedTiles,dontDominoThese,unitid,x,y,dontDominoTheseE)
	local tileid = ws_toTileId(x,y)
	if dominoedTiles[tileid] then return false end -- This tile was already checked, skip

	dominoedTiles[tileid] = true -- Mark this tile as being checked

	local result = false
	local obs = findobstacle(x,y)

	if (#findobstacle(x,y) == 0) then -- The tile is empty, check if EMPTY IS DOMINO, not safe and on the same float level
		if hasfeature("empty","is","domino",2,x,y) and floating(2,unitid,x,y) and not issafe(2,x,y) then
			if (dontDominoTheseE[tileid] == nil) then
				ws_pendingDominoE[tileid] = true
			end
			return true
		end
	else -- The tile has something, look for domino stuff to kill
		for _,b in ipairs(obs) do
			if (b == -1) then
				return false -- Level edge, fail
			elseif (b == unitid) then
				result = true -- We found the starting object! It *is* DOMINO, so just set result to true, but don't pend its destruction
			elseif (b ~= 0) and (b ~= -1) then
				local bunit = mmf.newObject(b)
				local obsname = getname(bunit)

				if not ws_immuneToDomino[b] and hasfeature(obsname,"is","domino",b,x,y) and floating(b,unitid,x,y) and not issafe(b) then
					result = true
					if (dontDominoThese[b] == nil) then
						ws_pendingDomino[b] = true
					end
				end
			end
		end
	end

	return result
end


function ws_clearDominoImmunes()
	ws_immuneToDomino = {}
end


-------- FILL FUNCTIONS --------
function ws_doFill(fillunits,dx,dy)
	for id,unit in ipairs(fillunits) do
		local x,y,name = unit.values[XPOS],unit.values[YPOS],getname(unit)
		local keepGoing = true
		local counter = 1

		while keepGoing do
			local ox,oy = counter*dx, counter*dy
			local valid = true
			local obs = findobstacle(x+ox,y+oy)

			if (#obs > 0) then
				for a,b in ipairs(obs) do
					if (b == -1) then
						valid = false
					elseif (b ~= 0) and (b ~= -1) then
						local bunit = mmf.newObject(b)
						local obsname = getname(bunit)

						local obsstop = hasfeature(obsname,"is","stop",b,x+ox,y+oy)
						local obspush = hasfeature(obsname,"is","push",b,x+ox,y+oy)
						local obspull = hasfeature(obsname,"is","pull",b,x+ox,y+oy)

						if (obsstop ~= nil) or (obspush ~= nil) or (obspull ~= nil) or (obsname == name) then
							valid = false
							break
						end
					end
				end
			else
				local obsstop = hasfeature("empty","is","stop",2,x+ox,y+oy)
				local obspush = hasfeature("empty","is","push",2,x+ox,y+oy)
				local obspull = hasfeature("empty","is","pull",2,x+ox,y+oy)

				if (obsstop ~= nil) or (obspush ~= nil) or (obspull ~= nil) then
					valid = false
				end
			end

			if valid then
				local newunit = copy(unit.fixed,x+ox,y+oy)
				counter = counter + 1
			else
				keepGoing = false
			end
		end
	end
end

local function ws_nondirFillHere(unit,x,y,filledTiles)
	if filledTiles[ws_toTileId(x,y)] then return false end -- This tile was already filled, skip

	local name = getname(unit)
	local obs = findobstacle(x,y)

	if (#obs > 0) then -- There's something at this position
		for _,b in ipairs(obs) do
			if (b == -1) then
				return false -- Level edge, fail
			elseif (b ~= 0) and (b ~= -1) then
				local bunit = mmf.newObject(b)
				local obsname = getname(bunit)

				local obsstop = hasfeature(obsname,"is","stop",b,x,y)
				local obspush = hasfeature(obsname,"is","push",b,x,y)
				local obspull = hasfeature(obsname,"is","pull",b,x,y)

				if (obsstop ~= nil) or (obspush ~= nil) or (obspull ~= nil) or (obsname == name) then
					return false -- Solid object or same of this object, fail
				end
			end
		end
	else
		local obsstop = hasfeature("empty","is","stop",2,x,y)
		local obspush = hasfeature("empty","is","push",2,x,y)
		local obspull = hasfeature("empty","is","pull",2,x,y)

		if (obsstop ~= nil) or (obspush ~= nil) or (obspull ~= nil) then
			return false -- Solid empty, fail
		end
	end

	local newunit = copy(unit.fixed,x,y)
	return true
end

function ws_nondirFill(fillunits,filledTiles)
	for id,unit in ipairs(fillunits) do
		local x,y,name = unit.values[XPOS],unit.values[YPOS],getname(unit)
		if (filledTiles[name] == nil) then
			filledTiles[name] = {}
		end
		local filledByThis = filledTiles[name]
		local toFill = WS_Queue.new()
		filledByThis[ws_toTileId(x,y)] = true

		-- Pend fill on adjacent tiles
		if (inbounds(x-1,y)) then WS_Queue.pushleft(toFill, ws_toTileId(x-1,y)) end
		if (inbounds(x+1,y)) then WS_Queue.pushleft(toFill, ws_toTileId(x+1,y)) end
		if (inbounds(x,y-1)) then WS_Queue.pushleft(toFill, ws_toTileId(x,y-1)) end
		if (inbounds(x,y+1)) then WS_Queue.pushleft(toFill, ws_toTileId(x,y+1)) end

		while not WS_Queue.isempty(toFill) do
			local toCheck = WS_Queue.popright(toFill)
			local cx,cy = ws_fromTileId(toCheck)
			if (ws_nondirFillHere(unit,cx,cy,filledByThis)) then -- Try to fill this tile. If it succeds, add the 4 adjacent tiles to the queue
				-- filledByThis[toCheck] = true
				if (inbounds(cx-1,cy)) and not filledByThis[ws_toTileId(cx-1,cy)] then WS_Queue.pushleft(toFill, ws_toTileId(cx-1,cy)) end
				if (inbounds(cx+1,cy)) and not filledByThis[ws_toTileId(cx+1,cy)] then WS_Queue.pushleft(toFill, ws_toTileId(cx+1,cy)) end
				if (inbounds(cx,cy-1)) and not filledByThis[ws_toTileId(cx,cy-1)] then WS_Queue.pushleft(toFill, ws_toTileId(cx,cy-1)) end
				if (inbounds(cx,cy+1)) and not filledByThis[ws_toTileId(cx,cy+1)] then WS_Queue.pushleft(toFill, ws_toTileId(cx,cy+1)) end
			end
		end
	end
end

-------- FOLD FUNCTIONS --------
function ws_doFold(foldunits,dx,dy,toFold,removalshort,removalsound,toKarma)
	for id,unit in ipairs(foldunits) do
		local x,y,name = unit.values[XPOS],unit.values[YPOS],unit.strings[UNITNAME] -- We check specific names so that "text_baba" can only fold with another "text_baba"

		local tileid = ws_toTileId(x+dx,y+dy)
		local sames = {}

		if (unitmap[tileid] ~= nil) then
			for _,b in ipairs(unitmap[tileid]) do
				local bunit = mmf.newObject(b)
				if (bunit.strings[UNITNAME] == name) and floating(unit.fixed,b) then
					table.insert(sames,b)
				end
			end
		end

		if (#sames > 0) and not issafe(unit.fixed) then
			generaldata.values[SHAKE] = 3
			local pmult,sound = checkeffecthistory("fold")
			removalshort = sound
			removalsound = 9
			local c1,c2 = getcolour(unit.fixed)
			ws_spawnSideParticle("smoke",x+dx,y+dy,c1,c2,1,-dx,-dy,0.7,2)
			toFold[unit.fixed] = true -- Mark as pending fold

			-- Add karma to the matching things
			for _,b in ipairs(sames) do
				toKarma[b] = true
			end
		end
	end

	return toFold,removalshort,removalsound,toKarma
end

function ws_doEmptyFold(emptyFolds,dx,dy,toFold,toKarma)
	for _,emptyId in ipairs(emptyFolds) do
		local x,y = ws_fromTileId(emptyId)

		local tileid = ws_toTileId(x+dx,y+dy)
		local isAlsoEmpty = false

		if inbounds(x+dx,y+dy,1) and ((unitmap[tileid] == nil) or (#unitmap[tileid] == 0)) then
			isAlsoEmpty = true
		end

		if isAlsoEmpty and not issafe(2,x,y) and floating(2,2,x,y,x+dx,y+dy) then
			toFold[emptyId] = {dx = dx, dy = dy} -- Mark as pending fold (store the direction for particles later)
			toKarma[tileid] = true -- Add karma to the empty in the next tile
		end
	end

	return toFold,toKarma
end

function ws_deleteEmptyFold(emptyId,dx,dy)
	local x,y = ws_fromTileId(emptyId)
	delete(2,x,y)
	local pmult,sound = checkeffecthistory("fold")
	ws_spawnSideParticle("hot",x+dx,y+dy,0,3,1,-dx,-dy,0.7,2)
	setsoundname("removal",9,sound)
	generaldata.values[SHAKE] = 3
end

function ws_doLevelFold(dir)
	local surrounds = parsesurrounds()
	if (surrounds[dir] ~= nil) then
		for _,d in ipairs(surrounds[dir]) do
			if (d == ws_ambientObject) then
				destroylevel()
				return true
			end
		end
	end
	return false
end

-------- ALIGN FUNCTIONS --------
function ws_findOuterCoords(name)
	local result = {} -- Is an array with 4 values: [minX, maxX, minY, maxY]

	for _,u in pairs(unitlists[name]) do
		local unit = mmf.newObject(u)
		local ux, uy = unit.values[XPOS], unit.values[YPOS]

		if (result[1] == nil) then -- No position stored yet
			result[1] = ux -- l most
			result[2] = ux -- r most
			result[3] = uy -- u most
			result[4] = uy -- d most
		else
			local minX, maxX = result[1],result[2]
			local minY, maxY = result[3],result[4]

			-- Update coords
			if (ux < minX) then result[1] = ux end
			if (ux > maxX) then result[2] = ux end
			if (uy < minY) then result[3] = uy end
			if (uy > maxY) then result[4] = uy end
		end
	end

	return result
end


-- TODO: simplify, also: add metatext support
function ws_doAlign(outerCoords,units,i)
	local vertical = (i > 2)
	local lessThan = (i % 2 == 0)
	local pOffset = 1
	if lessThan then
		pOffset = -1
	end

	for _,unitid in ipairs(units) do
		if (unitid ~= 2) and (unitid ~= 1) then
			local unit = mmf.newObject(unitid)
			local x,y,name = unit.values[XPOS],unit.values[YPOS],getname(unit)

			if (outerCoords[name] == nil) then
				outerCoords[name] = ws_findOuterCoords(name)
			end
			local nameCoords = outerCoords[name]

			if not ws_wasAlreadyAligned(unitid,vertical) then
				if vertical then
					if (y > nameCoords[i] and not lessThan) or (y < nameCoords[i] and lessThan) then -- Tele vert. if it isn't the top unit
						local isstill = hasfeature(name,"is","still",unitid,x,y)
						if (isstill == nil) and (unit.flags[DEAD] == false) then
							update(unitid,x,nameCoords[i])
							local pmult,sound = checkeffecthistory("align")
							local c1,c2 = getcolour(unitid)
							ws_spawnSideParticle("bling",x,y+pOffset,3,3,1,0,-pOffset,1.5,1 + 5 * pmult)
							MF_particles("bling",x,nameCoords[i],5 * pmult,c1,c2,1,1)
							setsoundname("turn",6,sound)

							ws_markAsAligned(unitid,vertical)
						end
					end
				else
					if (x > nameCoords[i] and not lessThan) or (x < nameCoords[i] and lessThan) then -- Tele horiz. if it isn't the top unit
						local isstill = hasfeature(name,"is","still",unitid,x,y)
						if (isstill == nil) and (unit.flags[DEAD] == false) then
							update(unitid,nameCoords[i],y)
							local pmult,sound = checkeffecthistory("align")
							local c1,c2 = getcolour(unitid)
							ws_spawnSideParticle("bling",x+pOffset,y,3,3,1,-pOffset,0,1.5,1 + 5 * pmult)
							MF_particles("bling",nameCoords[i],y,5 * pmult,c1,c2,1,1)
							setsoundname("turn",6,sound)

							ws_markAsAligned(unitid,vertical)
						end
					end
				end
			end
		end
	end
end

function ws_markAsAligned(unitid,vertical)
	if (objectdata[unitid] == nil) then
		objectdata[unitid] = {}
	end

	local odata = objectdata[unitid]
	if vertical then
		odata.ws_alignV = 1
	else
		odata.ws_alignH = 1
	end
end

function ws_wasAlreadyAligned(unitid,vertical)
	if (objectdata[unitid] == nil) then
		objectdata[unitid] = {}
	end

	local odata = objectdata[unitid]

	if (vertical) then
		return odata.ws_alignV == 1
	else
		return odata.ws_alignH == 1
	end
end