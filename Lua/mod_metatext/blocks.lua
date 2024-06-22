-- Removes line that changes name to "text"

--[[ @Merge: startblock() was merged ]]


-- You can now make metatext, and metatext can now make text.

--[[ @Merge: block() was merged ]]


-- Fixes TELE behavior, if applicable.

--[[ @Merge: moveblock() was merged ]]


-- :)
local oldeffectblock = effectblock
-- @Merge(injection)
function effectblock()
	oldeffectblock()
	if featureindex["love"] ~= nil and metatext_egg then
		local valid = true
		if featureindex["not love"] ~= nil then
			for i,rule in pairs(featureindex["not love"]) do
				if rule[1][1] == "love" and rule[1][2] == "is" and rule[1][3] == "not love" then
					valid = false
					break
				end
			end
		end
		if valid then
			for i,rule in pairs(visualfeatures) do
				if rule[1][1] == "love" and rule[1][2] == "is" and rule[1][3] == "love" and #rule[2] < 1 then
					local foundtag = false
					for num,tag in pairs(rule[4]) do
						if tag == "mimic" then
							foundtag = true
							break
						end
					end
					if not foundtag then
						for a,unitids in ipairs(rule[3]) do
							for b,unitid in ipairs(unitids) do
								local unit = mmf.newObject(unitid)
								if (unit.className ~= "level") then
									unit.colours = {}
									local ccolours = {{2,2},{2,3},{2,4},{5,3},{5,2},{1,4},{3,2},{3,1},{4,1}}

									local c1,c2,ca = -1,-1,-1

									for a=1,#ccolours do
										local c = ccolours[a]

										if (#unit.colours == 0) then
											c1 = c[1]
											c2 = c[2]
											ca = a
										end

										table.insert(unit.colours, c)
									end

									if (#unit.colours == 1) then
										if (c1 > -1) and (c2 > -1) and (ca > 0) then
											MF_setcolour(unit.fixed,c1,c2)
											unit.colour = {c1,c2}
											unit.values[A] = ca
										end
									elseif (#unit.colours == 0) then
										if (unit.values[A] > 0) and (math.floor(unit.values[A]) == unit.values[A]) then
											if (unit.strings[UNITTYPE] ~= "text") or (unit.active == false) then
												setcolour(unit.fixed)
											else
												setcolour(unit.fixed,"active")
											end
											unit.values[A] = 0
										end
									else
										unit.values[A] = ca

										if (unit.strings[UNITTYPE] == "text") then
											local curr = (unit.currcolour % #unit.colours) + 1
											local c = unit.colours[curr]

											unit.colour = {c[1],c[2]}
											MF_setcolour(unit.fixed,c[1],c[2])
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
end
