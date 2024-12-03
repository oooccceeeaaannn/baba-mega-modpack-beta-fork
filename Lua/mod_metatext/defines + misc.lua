-- Use the in-game menu now.

table.insert(mod_hook_functions["level_start"], function()
	metatext_fixquirks = get_setting("fix_quirks") --[[Set this to FALSE to:
Make TEXT/META# IS TELE link text units of the same type together rather than all text units included.
(Removed as of v469) Make TEXT IS MORE allow text units to grow into other text units as long as they are not the same type.
Make TEXT/META# IS GROUP, NOUN HAS/MAKE/BECOME GROUP make NOUN HAS/MAKE/BECOME every text included.
Make TEXT/META# IS GROUP, NOUN NEAR GROUP force noun to be near every text included.]]

	metatext_overlaystyle = get_setting("overlay_style", true) --[[Has 3 options:
0 disables this feature.
1 enables overlay if the "meta level" (the amount of times "text_" appears in the name excluding
if the name ends with "text_") does not match the name of the object.
Anything else always enables the overlay.]]

	metatext_textisword = get_setting("text_word") --Makes TEXT IS WORD a default rule, and breaking it will make text not parse.

	metatext_istextnometa = get_setting("is_nometa") --[[Makes METATEXT IS TEXT not turn the text object into it's metatext
counterpart, instead making it not transform.
Not recommended to set to TRUE if you are not using the Meta/Unmeta addon.]]

	metatext_hasmaketextnometa = get_setting("hasmake_nometa") --[[Makes METATEXT HAS/MAKE TEXT not make the text object have/make
it's metatext counterpart. Since you can't make Has/Make Meta/Unmeta, this is really only useful for
consistency I guess.]]

	metatext_autogenerate = get_setting("auto_gen", true) --[[Tries to add more metatext to the object palette if it does not exist.
Can only add up to 35 additional objects. REQUIRES metaunmeta.lua.
Comes with the following options:
0 disables this feature.
1 tries to use the correct sprite, if it exists. Otherwise, it uses the default.
2 is like 1, but if the sprite doesn't exist, it won't generate.
Anything else always uses the default sprite. If you choose this, you're gonna want the overlay on.
Note that if the nonexistant text is available in the editor object list, that will be referenced instead.]]

	metatext_includenoun = get_setting("include_noun") --Includes nouns in NOT META#.

	metatext_glyph_display = get_setting("better_disp")
end
)

-- New function, checks if rule relies on certain noun. Based off of hasfeature()
function checkiftextrule(rule1, rule2, rule3, unitid, findtextrule_, findtag_)
	local findtag = "text"
	local findtextrule = false
	if findtextrule_ ~= nil then
		findtextrule = findtextrule_
	end
	if findtag_ ~= nil then
		findtag = findtag_
	end
	if (featureindex[rule3] ~= nil) and (rule2 ~= nil) and (rule1 ~= nil) then
		for i, rules in ipairs(featureindex[rule3]) do
			local rule = rules[1]
			local conds = rules[2]
			local tags = rules[4]
			local foundtag = false
			for num, tag in pairs(tags) do
				if tag == findtag then
					foundtag = true
					break
				end
			end

			if (conds[1] ~= "never") and (foundtag == findtextrule) then
				if (rule[1] == rule1) and (rule[2] == rule2) and (rule[3] == rule3) then
					if testcond(conds, unitid) then
						return findtextrule
					end
				end
			end
		end
	end
	return (not findtextrule)
end

-- New function that writes the meta level of an object in the top right corner, if enabled.
function writemetalevel()
	if metatext_overlaystyle ~= 0 and not (generaldata.values[MODE] == 5) then
		MF_letterclear("metaoverlay")
		for id, unit in pairs(units) do
			local unitname = unit.strings[UNITNAME]

			local metalevel = getmetalevel(unitname)

			if metalevel >= 0 and unit.values[TYPE] == 0 and unit.visible then
				local show = true
				if metatext_overlaystyle == 1 then
					local c = changes[unit.className] or {}
					if c.image == nil then
						show = false
					else
						local imetalevel = getmetalevel(c.image)
						if imetalevel == metalevel then
							show = false
						end
					end
				end
				if metalevel > 4 then
					local mouse_x, mouse_y = MF_mouse()
					local half_tilesize = f_tilesize * generaldata2.values[ZOOM] * spritedata.values[TILEMULT] / 2
					if not (mouse_x >= unit.x - half_tilesize and mouse_x < unit.x + half_tilesize and mouse_y >= unit.y - half_tilesize and mouse_y < unit.y + half_tilesize) then
						show = false
					end
				end
				if show then
					-- imagine flag: print pink T text
					local color = textoverlaycolor(unit, {4,1}, {4,2})
					if metatext_glyph_display then
						local sequenceText, sequenceGlyph, sN, sE, sL = makemetastring(unitname)
						writetext(sequenceText:sub(2), unit.fixed, (8 * unit.scaleX),
								-(6 * unit.scaleY), "metaoverlay", true,
								1, true, color)

						--imagine flag: print blue lambda text. I had to flip it over which was crazy but looks amazing
						color = textoverlaycolor(unit, {3,3}, {1,4})
						local _, glyphflip = writetext(sequenceGlyph:sub(2), unit.fixed, (8 * unit.scaleX),
								-(6 * unit.scaleY), "metaoverlay", true,
								1, true, color)
						for _, table in ipairs(glyphflip) do
							mmf.newObject(table[1]).angle = 180
						end

						color = textoverlaycolor(unit, {2,4}, {3,4})
						writetext(sN:sub(2), unit.fixed, (8 * unit.scaleX),
								-(6 * unit.scaleY), "metaoverlay", true,
								1, true, color)
						color = textoverlaycolor(unit, {5,4}, {5,3})
						writetext(sE:sub(2), unit.fixed, (8 * unit.scaleX),
								-(6 * unit.scaleY), "metaoverlay", true,
								1, true, color)
						color = textoverlaycolor(unit, {3,1}, {3,0})
						writetext(sL:sub(2), unit.fixed, (8 * unit.scaleX),
								-(6 * unit.scaleY), "metaoverlay", true,
								1, true, color)
					else
						writetext(getmetalevel(getname(unit)), unit.fixed, (8 * unit.scaleX),
								-(6 * unit.scaleY), "metaoverlay", true,
								1, true, color)
					end
				end
			end
		end
	end
end

function textoverlaycolor(unit, maincolor, backcolor)
	local textcolor = maincolor
	local unitcolor1, unitcolor2 = getcolour(unit.fixed)
	if unit.colours ~= nil and #unit.colours > 0 then
		for z, c in pairs(unit.colours) do
			unitcolor1, unitcolor2 = c[1], c[2]
			if textcolor[1] == tonumber(unitcolor1) and textcolor[2] == tonumber(unitcolor2) then
				textcolor = backcolor
			end
		end
	else
		if unit.active == true or generaldata.values[MODE] == 5 then
			unitcolor1, unitcolor2 = getcolour(unit.fixed, "active")
		end
		if textcolor[1] == tonumber(unitcolor1) and textcolor[2] == tonumber(unitcolor2) then
			textcolor = backcolor
		end
	end
	return textcolor
end

table.insert(mod_hook_functions["always"], writemetalevel)

-- Enables TEXT IS WORD behavior with letters if enabled

--[[ @Merge: formlettermap() was merged ]]



-- Try to add more metatext if it doesn't exist.
function tryautogenerate(want, have)

	if (objectpalette[want] ~= nil or unitreference[want] ~= nil) then return true end
	if is_str_special_prefix(want) then
		return false -- fix silly edgecase
	else
		if metatext_autogenerate ~= 0 then
		if editor_objlist_reference[want] ~= nil then
			local data = editor_objlist[editor_objlist_reference[want]]
			local root = data.sprite_in_root
			if root == nil then
				root = true
			end
			local colour = data.colour
			local active = data.colour_active
			local colourasstring = colour[1] .. "," .. colour[2]
			local activeasstring = "0,0"
			if active ~= nil then
				activeasstring = active[1] .. "," .. active[2]
			end
			local new =
			{
				want,
				data.sprite or data.name,
				colourasstring,
				data.tiling,
				data.type or 0,
				data.unittype,
				activeasstring,
				root,
				data.layer or 10,
				nil,
			}
			local target = "120"
			while target ~= "156" do
				local done = true
				for objname, data in pairs(objectpalette) do
					if data == "object" .. target then
						done = false
						target = tostring(tonumber(target) + 1)
						while string.len(target) < 3 do
							target = "0" .. target
						end
					end
				end
				if done then break end
			end
			if target == "156" then
				return false
			else
				savechange("object" .. target, new, nil, true)
				dochanges_full("object" .. target)
				objectpalette[want] = "object" .. target
				objectlist[want] = 1
				if root == true then
					fullunitlist[want] = "fixroot" .. (data.sprite or data.name)
				else
					fullunitlist[want] = "fix" .. (data.sprite or data.name)
				end
				return true
			end
		elseif have == nil then
			local test = want
			local count = 0
			if objectpalette["text_" .. test] == nil then
				while objectpalette[test] == nil do
					if is_str_special_prefixed(test) and not is_str_special_prefix(test) then
						test = get_ref(test)
						count = count + 1
					else
						local lowestlevel = "text_" .. test
						if lowestlevel == "text_" then
							lowestlevel = "text_text_"
						end
						local SAFETY = 0
						while (not getmat_text(lowestlevel)) and SAFETY <= 1000 do
							lowestlevel = "text_" .. lowestlevel
							SAFETY = SAFETY + 1
						end
						-- this shouldn't happen, but just in case
						if SAFETY >= 1000 then
							return false
						end
						have = lowestlevel
						break
					end
				end
				if have == nil then
					have = test
				end
			else
				have = "text_" .. test
			end
		end
		if get_pref(have) == "" then
			have = get_pref(want) .. have
		end
		print("Trying to generate " .. want .. " from " .. have .. ".")
		local realname = objectpalette[have]
		local root = getactualdata_objlist(realname, "sprite_in_root")
		local colour = getactualdata_objlist(realname, "colour")
		local active = getactualdata_objlist(realname, "active")
		if colour == nil then
			return false
		end
		local sprite = getactualdata_objlist(realname, "sprite", true) or getactualdata_objlist(realname, "name")
		local colourasstring = colour[1] .. "," .. colour[2]
		local activeasstring = "0,0"
		if active ~= nil then
			activeasstring = active[1] .. "," .. active[2]
		end
		local tiling = getactualdata_objlist(realname, "tiling")
		local type = getactualdata_objlist(realname, "unittype")
		if (string.sub(want,1,5) == "text_" or string.sub(want,1,6) == "event_") then
			type = "text"
		elseif (string.sub(want,1,6) == "glyph_") then
			type = "object"
		elseif (string.sub(want,1,6) == "logic_") then
			type = "logic"
		elseif string.sub(want,1,5) == "node_" then
			type = "node"
			tiling = 0
		end
		local new =
		{
			want,
			sprite,
			colourasstring,
			tiling,
			0,
			type,
			activeasstring,
			root,
			getactualdata_objlist(realname, "layer"),
			nil,
		}
		if metatext_autogenerate == 1 or metatext_autogenerate == 2 then
			local spritewanted = get_pref(want)
			local base = want
			for _,k in ipairs(special_prefixes) do
				base = string.gsub(base,k,"")
			end
			spritewanted = spritewanted..base
			if MF_findsprite(spritewanted .. "_0_1.png", false) or MF_findsprite(spritewanted .. "_0_1.png", true) then
				sprite = spritewanted
				new[2] = sprite
				root = MF_findsprite(spritewanted .. "_0_1.png", true)
				new[8] = root
			elseif metatext_autogenerate == 2 then
				return false
			end
		end
		local target = "120"
		while target ~= "156" do
			local done = true
			for objname, data in pairs(objectpalette) do
				if data == "object" .. target then
					done = false
					target = tostring(tonumber(target) + 1)
					while string.len(target) < 3 do
						target = "0" .. target
					end
				end
			end
			if done then break end
		end
		if target == "156" then
			return false
		else
			savechange("object" .. target, new, nil, true)
			dochanges_full("object" .. target)
			objectpalette[want] = "object" .. target
			objectlist[want] = 1
			if root == true then
				fullunitlist[want] = "fixroot" .. sprite
			else
				fullunitlist[want] = "fix" .. sprite
			end
			return true
		end
	end
		return not disable_toometa
	end
end

-- Allows metatext to be named in editor.
if old_editor_trynamechange == nil then
	old_editor_trynamechange = editor_trynamechange
end
-- @Merge(injection)
function editor_trynamechange(object,newname_,fixed,objlistid,oldname_)
	local valid = true

	local newname = newname_ or "error"
	local oldname = oldname_ or "error"
	local checking = true

	if (newname:sub(1,1) == "$") then -- support for raw rename mod
		return old_editor_trynamechange(object,newname_,fixed,objlistid,oldname_)
	end

	newname = string.gsub(newname, "_", "UNDERDASH")
	newname = string.gsub(newname, "%W", "")
	newname = string.gsub(newname, "UNDERDASH", "_")

	while checking do
		checking = false

		for a,obj in pairs(editor_currobjlist) do
			if (obj.name == newname) then
				checking = true

				if (tonumber(string.sub(obj.name, -1)) ~= nil) then
					local num = tonumber(string.sub(obj.name, -1)) + 1

					newname = string.sub(newname, 1, string.len(newname)-1) .. tostring(num)
				else
					newname = newname .. "2"
				end
			end
		end
	end

	if (#newname == 0) or (newname == "level") or (newname == "text_crash") or (newname == "text_error") or (newname == "crash") or (newname == "error") or (newname == "text_never") or (newname == "never") then
		valid = false
	end

	if (string.find(newname, "#") ~= nil) then
		valid = false
	end

	MF_alert("Trying to change name: " .. object .. ", " .. newname .. ", " .. tostring(valid))

	if valid then
		savechange(object,{newname},fixed)
		MF_updateobjlistname_hack(objlistid,newname)

		-- we're gonna change every layer
		local textlessName, metalevel = string.gsub(oldname, "text_", "")
		if string.sub(oldname, -5) == "text_" then
			metalevel = metalevel - 1
			textlessName = "text_"..textlessName
		end
		newname = string.gsub(newname, "text_", "", metalevel)
		
		for i,v in ipairs(editor_currobjlist) do
			--[[if (v.object == object) then -- idk what this does, I'm just gonna disable this
				v.name = newname
			end]]

			local nTextlessName, nMetalevel = string.gsub(v.name, "text_", "")
			if string.sub(v.name, -5) == "text_" then
				nMetalevel = nMetalevel - 1
				nTextlessName = "text_"..nTextlessName
			end

			if (nTextlessName == textlessName) then
				local tOldname = v.name
				v.name = string.rep("text_",nMetalevel) .. newname
				local vid = MF_create(v.object)
				savechange(v.object,{v.name},vid)
				MF_cleanremove(vid)

				MF_alert("Found " .. tOldname .. ", changing to " .. v.name)

				MF_updateobjlistname_byname(tOldname,v.name)
			end
		end
	end

	return valid
end

-- Fix issue with FEAR.

--[[ @Merge: getunitverbtargets() was merged ]]


-- This fixes this really weird bug where the game tries to convert particles and text.
olddoconvert = doconvert
-- @Merge(injection)
function doconvert(data, extrarule_)
	local unitid = data[1]
	if unitid ~= 2 then
		local unit = mmf.newObject(unitid)
		if unit.strings[UNITNAME] == "" then
			return
		end
	end
	olddoconvert(data, extrarule_)
end

special_prefixes = {"glyph_", "text_", "node_", "event_", "logic_"}

--[[ Gets the meta level of a string
(times "text_" appears, minus 1, minus 1 again if the string ends with "text_")
Examples:
"baba" = -1
"text_baba" = 0
"text_text_baba" = 1
"text_text_" = 0
"text_text_text_" = 1
]]
--flag imagine
function getmetalevel(str)
	local metalevel = 0
	for _,v in ipairs(special_prefixes) do
		local _,delta = string.gsub(str,v,v)
		metalevel = metalevel + delta
		if string.sub(str,-#v) == v then metalevel = metalevel - 1 end
	end
	metalevel = metalevel - 1
	return metalevel
end

function makemetastring(string)
	local namestring = string
	local sT, sG, sN, sE, sL = "", "", "", "", ""
	while true do
		if namestring:sub(1,5) == "text_" and #namestring > 5 then
			sT = sT.."T"
			sG = sG.." "
			sN = sN.." "
			sE = sE.." "
			sL = sL.." "
			namestring = namestring.gsub(namestring, "text_", "", 1)
		elseif namestring:sub(1,6) == "glyph_" and #namestring > 6 then
			sT = sT.." "
			sG = sG.."V"
			sN = sN.." "
			sE = sE.." "
			sL = sL.." "
			namestring = namestring.gsub(namestring, "glyph_", "", 1)
		elseif namestring:sub(1, 5) == "node_" and #namestring > 5 then
			sT = sT .. " "
			sG = sG .. " "
			sN = sN .. "N"
			sE = sE .. " "
			sL = sL .. " "
			namestring = namestring.gsub(namestring, "node_", "", 1)
		elseif namestring:sub(1, 6) == "event_" and #namestring > 6 then
			sT = sT .. " "
			sG = sG .. " "
			sN = sN .. " "
			sE = sE .. "E"
			sL = sL .. " "
			namestring = namestring.gsub(namestring, "event_", "", 1)
		elseif namestring:sub(1, 6) == "logic_" and #namestring > 6 then
			sT = sT .. " "
			sG = sG .. " "
			sN = sN .. " "
			sE = sE .. " "
			sL = sL .. "L"
			namestring = namestring.gsub(namestring, "logic_", "", 1)
		else
			return sT, sG, sN, sE, sL
		end
	end
end

function is_str_special_prefix(str)
	for _,v in ipairs(special_prefixes) do
		if str == v then return true end
	end
	return false
end

function get_pref(name)
	for _,v in ipairs(special_prefixes) do
		if v == string.sub(name, 1, #v) then return v end
	end
	return ""
end

function get_ref(name)
	for _,v in ipairs(special_prefixes) do
		if v == string.sub(name, 1, #v) then return string.sub(name, #v + 1) end
	end
	return name
end

function is_str_special_prefixed(name)
	for _,v in ipairs(special_prefixes) do
		if v == string.sub(name, 1, #v) then return true end
	end
	return false
end

function equals_or_included(a,b)
	if a == b then return true end
	if ("meta"..getmetalevel(a) == b) then return true end
	if get_pref(a) == b .. "_" then return true end
	return false
end

function diff_or_excluded(a,b)
	if a ~= b then
		if get_pref(a) == get_pref(b) then return true end
		if ("meta"..getmetalevel(a) ~= b) and (metatext_includenoun or getmetalevel(a) >= 0) then
			if get_pref(a) ~= b .. "_" then return true end
		end
	end
	return false
end

function get_broad_name(unit)
	local result = getname(unit)
	local res = get_broaded_str(result)
	if res ~= "" then return res end
	return result
end

function both_hasfeature_in_same_ref(unit1, unit2, feature) --assume unit1 has the feature
	local name1, name2 = unit1.strings[UNITNAME], unit2.strings[UNITNAME]
	if not hasfeature(name2, "is", feature, unit2.fixed) then
		return false
	end
	if (name1 ~= name2) then
		if very_sticky then
			return true
		elseif metatext_fixquirks then
			local bname = get_broaded_str(name1)
			if (bname ~= get_broaded_str(name2)) or (not (checkiftextrule(name1, "is", feature, unit1.fixed, true, bname)
					and checkiftextrule(name2, "is", feature, unit2.fixed, true, bname))) then
				local lvl1 = getmetalevel(name1)
				if lvl1 == getmetalevel(name2) then
					bname = "meta" .. tostring(lvl1)
				else
					return false
				end
				if (not (checkiftextrule(name1, "is", feature, unit1.fixed, true, bname)
						and checkiftextrule(name2, "is", feature, unit2.fixed, true, bname))) then
					return false
				end
			end
		else
			return false
		end
	end
	return true
end
-- Remove lines that include "text" rules if rule1 starts with "text_".

--[[ @Merge: hasfeature() was merged ]]


-- Fix issue with TEXT MAKE TEXT

--[[ @Merge: getunitswithverb() was merged ]]

