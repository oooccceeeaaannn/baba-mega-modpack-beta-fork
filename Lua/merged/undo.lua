function undo()
    -- @mods(stable) - Override reason: custom stable undo handling
	local result = 0
	HACK_INFINITY = 0
	logevents = false
	if ((not resetting) and (hasfeature("level","is","noundo",1) ~= nil)) then
		return result
	end
	
	if (#undobuffer > 1) then
		result = 1
		local currentundo = undobuffer[2]
		
		-- MF_alert("Undoing: " .. tostring(#undobuffer))
		
		do_mod_hook("undoed")
		
		last_key = currentundo.key or 0
		Fixedseed = currentundo.fixedseed or 100
		
		if (currentundo ~= nil) then
			for i,line in ipairs(currentundo) do
				local style = line[1]
				
				if (style == "update") then
					local uid = line[9]
					
					if (paradox[uid] == nil) then
						local unitid = getunitid(line[9])
						
						local unit = mmf.newObject(unitid) --paradox-proofing
						local unitname = nil
						if (unit ~= nil) then
							local unitname = getname(unit)
						end
						if unit ~= nil and not unit_ignores_undos(unitid) then
							local oldx,oldy = unit.values[XPOS],unit.values[YPOS]
							local x,y,dir = line[3],line[4],line[5]
							unit.values[XPOS] = x
							unit.values[YPOS] = y
							unit.values[DIR] = dir
							unit.values[POSITIONING] = 0
							
							updateunitmap(unitid,oldx,oldy,x,y,unit.strings[UNITNAME])
							dynamic(unitid)
							dynamicat(oldx,oldy)
							
							if (spritedata.values[CAMTARGET] == uid) then
								MF_updatevision(dir)
							end
							
							local ox = math.abs(oldx-x)
							local oy = math.abs(oldy-y)
							
							if (ox + oy == 1) and (unit.values[TILING] == 2) then
								unit.values[VISUALDIR] = ((unit.values[VISUALDIR] - 1)+4) % 4
								unit.direction = unit.values[DIR] * 8 + unit.values[VISUALDIR]
							end
							
							if (unit.strings[UNITTYPE] == "text" or unit.strings[UNITTYPE] == "node") or isglyph(unit) or (unit.strings[UNITTYPE] == "logic") then
								updatecode = 1
							end
							
							local undowordunits = currentundo.wordunits
							local undowordrelatedunits = currentundo.wordrelatedunits
							local undobreakunits = currentundo.breakunits
							local undobreakrelatedunits = currentundo.breakrelatedunits
							local undosymbolunits = currentundo.symbolunits
							local undosymbolrelatedunits = currentundo.symbolrelatedunits
							
							if (#undowordunits > 0) then
								for a,b in pairs(undowordunits) do
									if (b == line[9]) then
										updatecode = 1
									end
								end
							end

							if (#undobreakunits > 0) then
								for a,b in pairs(undobreakunits) do
									if (b == line[9]) then
										updatecode = 1
									end
								end
							end

							if (#undosymbolunits > 0) then
								for a,b in pairs(undosymbolunits) do
									if (b == line[9]) then
										updatecode = 1
									end
								end
							end
						
							if (#undowordrelatedunits > 0) then
								for a,b in pairs(undowordrelatedunits) do
									if (b == line[9]) then
										updatecode = 1
									end
								end
							end

							if (#undobreakrelatedunits > 0) then
								for a,b in pairs(undobreakrelatedunits) do
									if (b == line[9]) then
										updatecode = 1
									end
								end
							end

							local undoclassunits = currentundo.classunits
							local undoclassrelatedunits = currentundo.classrelatedunits

							if (#undoclassunits > 0) then
								for a,b in pairs(undoclassunits) do
									if (b == line[9]) then
										updatecode = 1
									end
								end
							end

							if (#undoclassrelatedunits > 0) then
								for a,b in pairs(undoclassrelatedunits) do
									if (b == line[9]) then
										updatecode = 1
									end
								end
							end

							-- EDIT: ECHO units again
							local undoechounits = currentundo.echounits
							local undoechorelatedunits = currentundo.echorelatedunits
							
							if (#undoechounits > 0) then
								for a,b in pairs(undoechounits) do
									if (b == line[9]) then
										updatecode = 1
									end
								end
							end
							
							if (#undoechorelatedunits > 0) then
								for a,b in pairs(undoechorelatedunits) do
									if (b == line[9]) then
										updatecode = 1
									end
								end
							end

							if (#undosymbolrelatedunits > 0) then
								for a,b in pairs(undosymbolrelatedunits) do
									if (b == line[9]) then
										updatecode = 1
									end
								end
							end
						end
					else
						particles("hot",line[3],line[4],1,{1, 1})
					end
				elseif (style == "remove") then -- EDIT: keep karma when undoing a destruction
					local uid = line[6]
					local baseuid = line[7] or -1
					
					if (paradox[uid] == nil) and (paradox[baseuid] == nil) then
						local x,y,dir,levelfile,levelname,vislevel,complete,visstyle,maplevel,colour,clearcolour,followed,back_init,ogname,signtext,convert,oldid,ws_extradata = line[3],line[4],line[5],line[8],line[9],line[10],line[11],line[12],line[13],line[14],line[15],line[16],line[17],line[18],line[19],line[20],line[21],line[22]
						local name = line[2]
						local karma = ws_extradata.karma
						local trapped = ws_extradata.trapped
						local bungee_pos = ws_extradata.bungee_pos
						
						local unitname = ""
						local unitid = 0

						--If the unit was converted into 'no undo' byproducts that still exist, don't bring it back.
						local proceed = true;
						if (convert and (featureindex["noundo"] ~= nil or featureindex["noreset"] ~= nil)) then
							proceed = not turnedIntoOnlyNoUndoUnits(i, oldid);
						end

						if (proceed) then
							--MF_alert("Trying to create " .. name .. ", " .. tostring(unitreference[name]))
							unitname = unitreference[name]
							if (name == "level") and (unitreference[name] ~= "level") then
								unitname = "level"
								unitreference["level"] = "level"
								MF_alert("ALERT! Unitreference for level was wrong!")
							end
						
							unitid = MF_emptycreate(unitname,x,y)
							
							local unit = mmf.newObject(unitid)
							unit.values[ONLINE] = 1
							unit.values[XPOS] = x
							unit.values[YPOS] = y
							unit.values[DIR] = dir
							unit.values[ID] = line[6]
							unit.flags[9] = true
							
							unit.strings[U_LEVELFILE] = levelfile
							unit.strings[U_LEVELNAME] = levelname
							unit.flags[MAPLEVEL] = maplevel
							unit.values[VISUALLEVEL] = vislevel
							unit.values[VISUALSTYLE] = visstyle
							unit.values[COMPLETED] = complete
							
							unit.strings[COLOUR] = colour
							unit.strings[CLEARCOLOUR] = clearcolour
							unit.strings[UNITSIGNTEXT] = signtext or ""
							
							if (unit.className == "level") then
								MF_setcolourfromstring(unitid,colour)
							end
							
							addunit(unitid,true)
							addunitmap(unitid,x,y,unit.strings[UNITNAME])
							dynamic(unitid)
							
							unit.followed = followed
							unit.back_init = back_init
							unit.originalname = ogname
							unit.karma = karma -- EDIT: keep karma, trapped, bungee position when undoing
							unit.ws_trapped = trapped
							unit.ws_bungee_pos = bungee_pos

							--First override for Offset starts here.
							unit.xoffset = line[XOFFSETUNDOLINE]
							unit.yoffset = line[YOFFSETUNDOLINE]
							--First override for Offset ends here.

							if (unit.strings[UNITTYPE] == "text" or unit.strings[UNITTYPE] == "node" or unit.strings[UNITTYPE] == "logic") or isglyph(unit) then
								updatecode = 1
							end
							
							if (spritedata.values[VISION] == 1) then
								unit.x = -24
								unit.y = -24
							end
							
							local undowordunits = currentundo.wordunits
							local undowordrelatedunits = currentundo.wordrelatedunits
							local undosymbolunits = currentundo.symbolunits
							local undosymbolrelatedunits = currentundo.symbolrelatedunits
							
							if (#undowordunits > 0) then
								for a,b in ipairs(undowordunits) do
									if (b == line[6]) then
										updatecode = 1
									end
								end
							end
							
						if (#undosymbolunits > 0) then
							for a,b in ipairs(undosymbolunits) do
								if (b == line[6]) then
									updatecode = 1
								end
							end
						end
						
							if (#undowordrelatedunits > 0) then
								for a,b in ipairs(undowordrelatedunits) do
									if (b == line[6]) then
										updatecode = 1
									end
								end
							end


							local undoclassunits = currentundo.classunits
							local undoclassrelatedunits = currentundo.classrelatedunits

							if (#undoclassunits > 0) then
								for a,b in pairs(undoclassunits) do
									if (b == line[6]) then
										updatecode = 1
									end
								end
							end

							if (#undoclassrelatedunits > 0) then
								for a,b in pairs(undoclassrelatedunits) do
									if (b == line[6]) then
										updatecode = 1
									end
								end
							end

							-- EDIT: echo again
							local undoechounits = currentundo.echounits
							local undoechorelatedunits = currentundo.echorelatedunits
							
							if (#undoechounits > 0) then
								for a,b in ipairs(undoechounits) do
									if (b == line[6]) then
										updatecode = 1
									end
								end
							end
							
							if (#undoechorelatedunits > 0) then
								for a,b in ipairs(undoechorelatedunits) do
									if (b == line[6]) then
										updatecode = 1
									end
								end
							end
							
							if (#undosymbolrelatedunits > 0) then
								for a,b in ipairs(undosymbolrelatedunits) do
									if (b == line[6]) then
										updatecode = 1
									end
								end
							end
							
							--If the unit was actually a destroyed 'NOUNDO', oops. Don't actually bring it back. It's dead, Jim.
							if (not convert and unit_ignores_undos(unitid)) then
								unit = {}
								delunit(unitid)
								MF_remove(unitid)
								dynamicat(x,y)
							end
						end
					else
						particles("hot",line[3],line[4],1,{1, 1})
					end
				elseif (style == "create") then
					local uid = line[3]
					local baseid = line[4]
					local source = line[5]
					
					if (paradox[uid] == nil) then
						local unitid = getunitid(line[3])
						
						local unit = mmf.newObject(unitid)
						--paradox-proofing
						local unitname = nil
						local x,y = nil,nil
						local unittype = nil
						if (unit ~= nil) then
							unitname = unit.strings[UNITNAME]
							x,y = unit.values[XPOS],unit.values[YPOS]
							unittype = unit.strings[UNITTYPE]
						end
						
						if (unit ~= nil) and (not unit_ignores_undos(unitid)) then
							unit = {}
							-- @mods(past x plasma) - need this to make IDs be deterministic when doing past + THIS
							local ispast = line[9]
							if not ispast then
								generaldata.values[CURRID] = generaldata.values[CURRID] - 1
							end
							
							delunit(unitid)
							MF_remove(unitid)
							dynamicat(x,y)
							
							if (unittype == "text" or unittype == "node") or isglyph(unit, unitname) or (unittype == "logic") then
								updatecode = 1
							end
							
							local undowordunits = currentundo.wordunits
							local undowordrelatedunits = currentundo.wordrelatedunits
							local undosymbolunits = currentundo.symbolunits
							local undosymbolrelatedunits = currentundo.symbolrelatedunits
							
							if (#undowordunits > 0) then
								for a,b in ipairs(undowordunits) do
									if (b == line[3]) then
										updatecode = 1
									end
								end
							end
							
						if (#undosymbolunits > 0) then
							for a,b in ipairs(undosymbolunits) do
								if (b == line[3]) then
									updatecode = 1
								end
							end
						end
						
							if (#undowordrelatedunits > 0) then
								for a,b in ipairs(undowordrelatedunits) do
									if (b == line[3]) then
										updatecode = 1
									end
								end
							end


							local undoclassunits = currentundo.classunits
							local undoclassrelatedunits = currentundo.classrelatedunits

							if (#undoclassunits > 0) then
								for a,b in pairs(undoclassunits) do
									if (b == line[3]) then
										updatecode = 1
									end
								end
							end

							if (#undoclassrelatedunits > 0) then
								for a,b in pairs(undoclassrelatedunits) do
									if (b == line[3]) then
										updatecode = 1
									end
								end
							end
						
							-- EDIT: echo again
							local undoechounits = currentundo.echounits
							local undoechorelatedunits = currentundo.echorelatedunits
							
							if (#undoechounits > 0) then
								for a,b in ipairs(undoechounits) do
									if (b == line[3]) then
										updatecode = 1
									end
								end
							end
							
							if (#undoechorelatedunits > 0) then
								for a,b in ipairs(undoechorelatedunits) do
									if (b == line[3]) then
										updatecode = 1
									end
								end
							end
							if (#undosymbolrelatedunits > 0) then
								for a,b in ipairs(undosymbolrelatedunits) do
									if (b == line[3]) then
										updatecode = 1
									end
								end
							end
						end
					end
				elseif (style == "backset") then
					local uid = line[3]
					
					if (paradox[uid] == nil) then
						local unitid = getunitid(line[3])
						local unit = mmf.newObject(unitid)
						
						unit.back_init = line[4]
					end
				elseif (style == "done") then
					local unitid = line[7]
					--print(unitid)
					local unit = mmf.newObject(unitid)
					
					unit.values[FLOAT] = line[8]
					unit.angle = 0
					unit.values[POSITIONING] = 0
					unit.values[A] = 0
					unit.values[VISUALLEVEL] = 0
					unit.flags[DEAD] = false
					
					--print(unit.className .. ", " .. tostring(unitid) .. ", " .. tostring(line[3]) .. ", " .. unit.strings[UNITNAME])
					
					addunit(unitid,true)
					unit.originalname = line[9]
					
					if (unit.values[TILING] == 1) then
						dynamic(unitid)
					end
				elseif (style == "float") then
					local uid = line[3]
					
					if (paradox[uid] == nil) then
						local unitid = getunitid(line[3])
						
						-- K�kk� ratkaisu!
						if (unitid ~= nil) and (unitid ~= 0) then
							local unit = mmf.newObject(unitid)
							if (unit ~= nil) then --paradox-proofing
								unit.values[FLOAT] = tonumber(line[4])
							end
						end
					end
				elseif (style == "levelupdate") then
					MF_setroomoffset(line[2],line[3])
					mapdir = line[6]
				elseif (style == "maprotation") then
					maprotation = line[2]
					MF_levelrotation(maprotation)
				elseif (style == "mapdir") then
					mapdir = line[2]
				elseif (style == "mapcursor") then
					mapcursor_set(line[3],line[4],line[5],line[10])
					
					local undowordunits = currentundo.wordunits
					local undowordrelatedunits = currentundo.wordrelatedunits
					-- EDIT: ECHO once more
					local undoechounits = currentundo.echounits
					local undoechorelatedunits = currentundo.echorelatedunits
					local undoclassunits = currentundo.classunits
					local undoclassrelatedunits = currentundo.classrelatedunits
					local undosymbolunits = currentundo.symbolunits
					local undosymbolrelatedunits = currentundo.symbolrelatedunits
					
					local unitid = getunitid(line[10])
					if (unitid ~= nil) and (unitid ~= 0) then
						local unit = mmf.newObject(unitid)
						
						if (unit.strings[UNITTYPE] == "text") or (unit.strings[UNITTYPE] == "logic") or isglyph(unit) then
							updatecode = 1
						end
					end
					
					if (#undowordunits > 0) then
						for a,b in pairs(undowordunits) do
							if (b == line[10]) then
								updatecode = 1
							end
						end
					end
					
					if (#undosymbolunits > 0) then
						for a,b in pairs(undosymbolunits) do
							if (b == line[10]) then
								updatecode = 1
							end
						end
					end
					
					if (#undowordrelatedunits > 0) then
						for a,b in pairs(undowordrelatedunits) do
							if (b == line[10]) then
								updatecode = 1
							end
						end
					end
					
					-- EDIT: ECHO!!
					if (#undoechounits > 0) then
						for a,b in pairs(undoechounits) do
							if (b == line[10]) then
								updatecode = 1
							end
						end
					end
					
					if (#undoechorelatedunits > 0) then
						for a,b in pairs(undoechorelatedunits) do
							if (b == line[10]) then
								updatecode = 1
							end
						end
					end

					if (#undoclassunits > 0) then
						for a,b in pairs(undoclassunits) do
							if (b == line[10]) then
								updatecode = 1
							end
						end
					end

					if (#undoclassrelatedunits > 0) then
						for a,b in pairs(undoclassrelatedunits) do
							if (b == line[10]) then
								updatecode = 1
							end
						end
					end

					if (#undosymbolrelatedunits > 0) then
						for a,b in pairs(undosymbolrelatedunits) do
							if (b == line[10]) then
								updatecode = 1
							end
						end
					end
				elseif (style == "colour") then
					local unitid = getunitid(line[2])
					MF_setcolour(unitid,line[3],line[4])
					local unit = mmf.newObject(unitid)
					if (unit ~= nil) then --paradox-proofing
						unit.values[A] = line[5]
					end
				elseif (style == "broken") then
					local unitid = getunitid(line[3])
					local unit = mmf.newObject(unitid)
					if (unit ~= nil) then --paradox-proofing
					--MF_alert(unit.strings[UNITNAME])
						unit.broken = 1 - line[2]
					end
				elseif (style == "bonus") then
					local style = 1 - line[2]
					MF_bonus(style)
				elseif (style == "followed") then
					local unitid = getunitid(line[2])
					local unit = mmf.newObject(unitid)
					if (unit ~= nil) then --paradox-proofing
						unit.followed = line[3]
					end
				elseif (style == "startvision") then
					local target = line[2]
					
					if (line[2] ~= 0) and (line[2] ~= 0.5) then
						target = getunitid(line[2])
					end
					
					visionmode(0,target,true)
				elseif (style == "stopvision") then
					local target = line[2]
					
					if (line[2] ~= 0) and (line[2] ~= 0.5) then
						target = getunitid(line[2])
					end
					
					visionmode(1,target,true,{line[3],line[4],line[5]})
				elseif (style == "visiontarget") then
					local unitid = getunitid(line[2])
					
					if (spritedata.values[VISION] == 1) and (unitid ~= 0) then
						local unit = mmf.newObject(unitid)
						if (unit ~= nil) then --paradox-proofing
							MF_updatevision(unit.values[DIR])
							MF_updatevisionpos(unit.values[XPOS],unit.values[YPOS])
							spritedata.values[CAMTARGET] = line[2]
						end
					end
				elseif (style == "holder") then
					local unitid = getunitid(line[2])
					local unit = mmf.newObject(unitid)
					if (unit ~= nil) then --paradox-proofing
						unit.holder = line[3]
					end
				elseif (style == "offset") then --Second and final override for Offset starts here.
					local unit = mmf.newObject(getunitid(line[2]))

					--[[
						@Merge: IMPORTANT. Need this check of "unit ~= nil" for all undo styles to handle cases with NOUNDO.

						If a NOUNDO object undos from a "delete" styled-undo, the object actually gets removed immediately after being created.
						(Look for the code that has the comment "@Merge(note)").
						This causes a "paradox" (not in reference to the actual table called "paradax") where the other undo entries assume that the NOUNDO object will exist.
						To guard against this case, patashu's modpack adds these checks for every undo style. It's tedious, but I guess its how things are done.
					 ]]
					if (unit ~= nil) then --paradox-proofing
						unit.xoffset = line[3]
						unit.yoffset = line[4] --Second and final override for Offset ends here.
					end
				elseif (style == "leveloffset") then
					offset_levelxoffset = line[2]
					offset_levelyoffset = line[3]
					MF_setroomoffset(line[4],line[5]) --Second and final override for Offset ends here.
                elseif (style == "stable") then
                    handle_stable_undo(line)
				elseif (style == "levelkarma") then -- Level karma got updated
					local previous_karma = line[2] or false
					levelKarma = previous_karma
				elseif (style == "unitkarma") then -- Unit karma got updated
					local unitid = getunitid(line[2])
					local unit = mmf.newObject(unitid)
					local previous_karma = line[3] or false

					if (unit ~= nil) then --paradox-proofing
						unit.karma = previous_karma
					end
				elseif (style == "ws_deathCounter") then -- Death counter got updated
					local name = line[2]
					if (ws_deathCounter[name] <= 1) then
						ws_deathCounter[name] = nil
					else
						ws_deathCounter[name] = ws_deathCounter[name] - 1
					end
					--timedmessage("Decreasing death counter for "..name,0,1)
				elseif (style == "ws_trap") then -- Something became trapped or stopped being trapped without being destroyed
					local unitid = getunitid(line[2])
					local unit = mmf.newObject(unitid)
					local previous_trapped = line[3] or false

					unit.ws_trapped = previous_trapped
				elseif (style == "ws_bungee_pos") then -- Unit bungee position was updated
					local unitid = getunitid(line[2])
					local unit = mmf.newObject(unitid)
					local previous_pos = line[3]

					unit.ws_bungee_pos = previous_pos
				elseif (style == "ws_level_bungee") then
					local previous_pos = line[2]
					ws_levelBungeeOffset = previous_pos
				elseif (style == "ws_morph") then
					local unitid = getunitid(line[2])
					local unit = mmf.newObject(unitid)
					unit.ws_previousOverlap = line[3]
                end
			end
		end
		
		local nextundo = undobuffer[1]
		nextundo.wordunits = {}
		nextundo.wordrelatedunits = {}
		-- EDIT: pass echo units (could this be handled better?)
		nextundo.echounits = {}
		nextundo.echorelatedunits = {}
		nextundo.classunits = {}
		nextundo.classrelatedunits = {}
		nextundo.symbolunits = {}
		nextundo.symbolrelatedunits = {}
		nextundo.visiontargets = {}
		nextundo.fixedseed = Fixedseed
		
		for i,v in ipairs(currentundo.wordunits) do
			table.insert(nextundo.wordunits, v)
		end
		for i,v in ipairs(currentundo.wordrelatedunits) do
			table.insert(nextundo.wordrelatedunits, v)
		end
		for i,v in ipairs(currentundo.symbolunits) do
			table.insert(nextundo.symbolunits, v)
		end
		for i,v in ipairs(currentundo.symbolrelatedunits) do
			table.insert(nextundo.symbolrelatedunits, v)
		end
		
		-- EDIT: pass ECHO stuff to the next undo
		for i,v in ipairs(currentundo.echounits) do
			table.insert(nextundo.echounits, v)
		end
		for i,v in ipairs(currentundo.echorelatedunits) do
			table.insert(nextundo.echorelatedunits, v)
		end
		for i,v in ipairs(currentundo.classunits) do
			table.insert(nextundo.classunits, v)
		end
		for i,v in ipairs(currentundo.classrelatedunits) do
			table.insert(nextundo.classrelatedunits, v)
		end
		if (#currentundo.visiontargets > 0) then
			visiontargets = {}
			for i,v in ipairs(currentundo.visiontargets) do
				table.insert(nextundo.visiontargets, v)
				
				local fix = MF_getfixed(v)
				if (fix ~= nil) then
					table.insert(visiontargets, fix)
				end
			end
		end
		
		table.remove(undobuffer, 2)
	end
	
	--MF_alert("Current fixed seed: " .. tostring(Fixedseed))
	
	do_mod_hook("undoed_after")
	logevents = true
	
	return result
end

function newundo(resetundo)
	--MF_alert("Newundo: " .. tostring(updateundo) .. ", " .. tostring(doundo))

	if (updateundo == false) or (doundo == false) or resetundo then
    undowasupdated = false
		table.remove(undobuffer, 1)
	else
    undowasupdated = true
		generaldata2.values[UNDOTOOLTIPTIMER] = 0
	end

	table.insert(undobuffer, 1, {})

	local thisundo = undobuffer[1]
	thisundo.key = last_key
	thisundo.fixedseed = Fixedseed

	--MF_alert("Stored " .. tostring(Fixedseed))

	if (thisundo ~= nil) then
		thisundo.wordunits = {}
		thisundo.wordrelatedunits = {}
		thisundo.symbolunits = {}
		thisundo.symbolrelatedunits = {}
		thisundo.breakunits = {}
		thisundo.breakrelatedunits = {}
		thisundo.visiontargets = {}
		-- EDIT: store echo units???
		thisundo.echounits = {}
		thisundo.echorelatedunits = {}
		thisundo.classunits = {}
		thisundo.classrelatedunits = {}

		if (#wordunits > 0) then
			for i,v in ipairs(wordunits) do
				local wunit = mmf.newObject(v[1])
				table.insert(thisundo.wordunits, wunit.values[ID])
			end
		end

		if (#(breakunits or {}) > 0) then
			for i,v in ipairs(breakunits) do
				local wunit = mmf.newObject(v[1])
				table.insert(thisundo.breakunits, wunit.values[ID])
			end
		end

		if (#symbolunits > 0) then
			for i,v in ipairs(symbolunits) do
				local wunit = mmf.newObject(v[1])
				table.insert(thisundo.symbolunits, wunit.values[ID])
			end
		end
		
		if (#visiontargets > 0) then
			for i,v in ipairs(visiontargets) do
				local wunit = mmf.newObject(v)
				table.insert(thisundo.visiontargets, wunit.values[ID])
			end
		end

		if (#wordrelatedunits > 0) then
			for i,v in ipairs(wordrelatedunits) do
				if (v[1] ~= 2) then
					local wunit = mmf.newObject(v[1])
					table.insert(thisundo.wordrelatedunits, wunit.values[ID])
				else
					--table.insert(thisundo.wordrelatedunits, wunit.values[ID])
				end
			end
		end
		
		-- EDIT: ECHO again
		if (#echounits > 0) then
			for i,v in ipairs(echounits) do
				local eunit = mmf.newObject(v[1])
				table.insert(thisundo.echounits, eunit.values[ID])
			end
		end
		
		if (#echorelatedunits > 0) then
			for i,v in ipairs(echorelatedunits) do
				if (v[1] ~= 2) then
					local eunit = mmf.newObject(v[1])
					table.insert(thisundo.echorelatedunits, eunit.values[ID])
				end
			end
		end

		if (#classunits > 0) then
			for i,v in ipairs(classunits) do
				local eunit = mmf.newObject(v[1])
				table.insert(thisundo.classunits, eunit.values[ID])
			end
		end

		if (#classrelatedunits > 0) then
			for i,v in ipairs(classrelatedunits) do
				if (v[1] ~= 2) then
					local eunit = mmf.newObject(v[1])
					table.insert(thisundo.classrelatedunits, eunit.values[ID])
				end
			end
		end
		
		if (#symbolrelatedunits > 0) then
			for i,v in ipairs(symbolrelatedunits) do
				if (v[1] ~= 2) then
					local wunit = mmf.newObject(v[1])
					table.insert(thisundo.symbolrelatedunits, wunit.values[ID])
				else
					--table.insert(thisundo.symbolrelatedunits, wunit.values[ID])
				end
			end
		end

		if (#(breakrelatedunits or {}) > 0) then
			for i,v in ipairs(breakrelatedunits) do
				if (v[1] ~= 2) then
					local wunit = mmf.newObject(v[1])
					table.insert(thisundo.breakrelatedunits, wunit.values[ID])
				else
					--table.insert(thisundo.wordrelatedunits, wunit.values[ID])
				end
			end
		end
	end

	updateundo = false
end