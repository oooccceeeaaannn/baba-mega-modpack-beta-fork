--This was the code for reload and return before it was changed to being when stepped on by a player.
--[[table.insert(mod_hook_functions.turn_end, function()
	if editor.values[INEDITOR] == 0 then
		if findfeature(nil, "is", "reload") ~= nil then
			local entering = {{nil, generaldata.strings[LEVELNAME], generaldata.strings[CURRLEVEL]}}

			fillkeepruleslist()

			generaldata.values[TRANSITIONREASON] = 9
			generaldata.values[IGNORE] = 1
			generaldata3.values[STOPTRANSITION] = 1
			generaldata2.values[UNLOCK] = 0
			generaldata2.values[UNLOCKTIMER] = 0

			MF_loop("transition",1)
		elseif findfeature(nil, "is", "return") ~= nil then
			local newlevelfile = uplevel()
			local entering = {{nil, get_level_name_from_ld(newlevelfile), newlevelfile}}

			fillkeepruleslist()

			generaldata.values[TRANSITIONREASON] = 9
			generaldata.values[IGNORE] = 1
			generaldata3.values[STOPTRANSITION] = 1
			generaldata2.values[UNLOCK] = 0
			generaldata2.values[UNLOCKTIMER] = 0

			MF_loop("transition",1)
		end
	end
end)]]


--thanks to hermitthc on discord for this code, very cool :D
function get_level_name_from_ld(ld_filename)
    local old_target_file_location = "Data/Worlds/" .. generaldata.strings[WORLD] .. "/" .. generaldata.strings[CURRLEVEL] .. ".ld"
    local target_file_location = "Data/Worlds/" .. generaldata.strings[WORLD] .. "/" .. ld_filename .. ".ld"
    MF_setfile("level", target_file_location)
    local level_name = MF_read("level", "general", "name")
    MF_setfile("level", old_target_file_location) -- Restore old target file location, which should point to the current level (important)
    return level_name
end