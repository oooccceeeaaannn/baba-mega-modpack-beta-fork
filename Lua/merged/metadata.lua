

function getmetadata(unit)
	local realname = unit.className
	
	if (realname ~= "level") and (realname ~= "path") and (realname ~= "specialobject") then
		if (tileslist[realname] ~= nil) then
			local data = tileslist[realname]
			
			local name = data.name or "error"
			local unittype = data.unittype or "object"
			local type = data.type or 0
			local tiling = data.tiling or -1
			local layer = data.layer or 10
			
			unit.strings[UNITNAME] = name
			unit.strings[NAME] = get_ref(name)

			unit.strings[UNITTYPE] = unittype
			unit.values[TILING] = tiling
			unit.values[TYPE] = type
			unit.values[ZLAYER] = layer
		else
			print("No metadata found for " .. realname .. "!")
		end
	end
end