table.insert(objlistdata.alltags, "logics")

table.insert(editor_objlist_order, "text_logic")

editor_objlist["text_logic"] =
{
	name = "text_logic",
	sprite_in_root = false,
	unittype = "text",
	tags = {"logics","text", "abstract"},
	tiling = -1,
	type = 0,
	layer = 20,
	colour = {3, 0},
	colour_active = {3, 1},
}

add_glyph_using_text("logic")

table.insert(editor_objlist_order, "text_logic_")

editor_objlist["text_logic_"] =
{
	name = "text_logic_",
	sprite = "text_logicpre",
	sprite_in_root = false,
	unittype = "text",
	tags = {"logics","text", "abstract"},
	tiling = -1,
	type = 4,
	layer = 20,
	colour = {3, 0},
	colour_active = {3, 1},
}

table.insert(editor_objlist_order, "text_metalogic")

editor_objlist["text_metalogic"] =
{
	name = "text_metalogic",
	sprite_in_root = false,
	unittype = "text",
	tags = {"text", "abstract", "glyph","logics"},
	tiling = -1,
	type = -1,
	layer = 20,
	colour = {3, 0},
	colour_active = {3, 1},
}

table.insert(editor_objlist_order, "glyph_metalogic")

editor_objlist["glyph_metalogic"] =
{
	name = "glyph_metalogic",
	sprite_in_root = false,
	unittype = "object",
	tags = {"abstract", "glyph", "logics"},
	tiling = -1,
	type = 0,
	layer = 1,
	colour = {3, 0},
	colour_active = {3, 1},
}

table.insert(editor_objlist_order, "glyph_logic_")

editor_objlist["glyph_logic_"] =
{
	name = "glyph_logic_",
	sprite = "glyph_logicpre",
	sprite_in_root = false,
	unittype = "object",
	tags = {"abstract", "glyph", "logics"},
	tiling = -1,
	type = 0,
	layer = 1,
	colour = {3, 0},
	colour_active = {3, 1},
}

table.insert(editor_objlist_order, "text_log")

editor_objlist["text_log"] =
{
	name = "text_log",
	sprite_in_root = false,
	unittype = "text",
	tags = {""},
	tiling = -1,
	type = 1,
	layer = 20,
	colour = {0, 1},
	colour_active = {0, 3},
	argtype = {0, 2}
}

table.insert(nlist.full, "logic")
table.insert(nlist.short, "logic")
table.insert(nlist.objects, "logic")

logic_types = {}
logic_argtypes = {}

function addlogic(name,type,col,acol,argtype,tiling)
	local logicname = "logic_"..name

	logic_types[logicname] = type
	logic_argtypes[logicname] = argtype

	table.insert(editor_objlist_order, logicname)

	editor_objlist[logicname] =
	{
		name = logicname,
		sprite_in_root = false,
		unittype = "logic",
		tags = {"logics"},
		tiling = tiling,
		type = 0,
		layer = 20,
		colour = col,
		colour_active = acol,
	}
end

--start
addlogic("start",4,{3,3},{4,4},{},0)
addlogic("omnistart",10,{3,0},{4,2},{},-1)

--connecters
addlogic("connect",-1,{0,1},{0,3},{},0)
addlogic("omniconnect",9,{0,1},{0,3},{},-1)
addlogic("longconnect",-4,{0,1},{0,3},{},0)
addlogic("omnilongconnect",13,{0,1},{0,3},{},-1)

--wireless connecters
addlogic("send",-3,{3,2},{3,3},{},-1)
addlogic("recieve",-2,{3,2},{3,3},{},-1)
addlogic("send2",-3,{2,1},{2,2},{},-1)
addlogic("recieve2",-2,{2,1},{2,2},{},-1)
addlogic("send3",-3,{5,2},{5,3},{},-1)
addlogic("recieve3",-2,{5,2},{5,3},{},-1)

--verbs
addlogic("is",1,{0,1},{0,3},{0,2},-1)
addlogic("has",1,{0,1},{0,3},{0},-1)
addlogic("eat",1,{2,1},{2,2},{0},-1)
addlogic("fear",1,{2,1},{2,2},{0},-1)
addlogic("follow",1,{5,1},{5,3},{0},-1)
addlogic("make",1,{0,1},{0,3},{0},-1)
addlogic("mimic",1,{2,1},{2,2},{0},-1)
addlogic("write",1,{0,1},{0,3},{0,2},-1)
addlogic("log",1,{0,1},{0,3},{0,2},-1)

--prefixes
addlogic("idle",6,{2,2},{2,3},{},-1)
addlogic("lonely",6,{2,1},{2,2},{},-1)
addlogic("often",6,{5,2},{5,3},{},-1)
addlogic("seldom",6,{3,2},{3,3},{},-1)
addlogic("powered",6,{6,1},{2,4},{},-1)
addlogic("powered2",6,{5,2},{5,3},{},-1)
addlogic("powered3",6,{3,2},{4,4},{},-1)

--infixes
addlogic("on",3,{0,1},{0,3},{0},-1)
addlogic("near",3,{0,1},{0,3},{0},-1)
addlogic("nextto",3,{0,1},{0,3},{0},-1)
addlogic("facing",3,{0,1},{0,3},{0},-1)
addlogic("seeing",3,{0,1},{0,3},{0},-1)
addlogic("without",3,{0,1},{0,3},{0},-1)
addlogic("feeling",3,{0,1},{0,3},{2},-1)
addlogic("above",3,{1,2},{1,4},{0},-1)
addlogic("below",3,{1,2},{1,4},{0},-1)
addlogic("besideleft",3,{1,2},{1,4},{0},-1)
addlogic("besideright",3,{1,2},{1,4},{0},-1)

--boolean
addlogic("true",5,{5,1},{5,3},{},0)
addlogic("omnitrue",8,{1,2},{1,4},{},-1)
addlogic("false",5,{2,1},{2,2},{},0)
addlogic("omnifalse",8,{2,2},{2,3},{},-1)

--not
addlogic("not",7,{2,1},{2,2},{},-1)

--halt
addlogic("halt",11,{2,0},{2,1},{},0)
addlogic("omnihalt",12,{2,1},{2,2},{},-1)

--special nouns
addlogic("logic",0,{3,0},{3,1},{},-1)
addlogic("text",0,{4,0},{4,1},{},-1)
addlogic("event",0,{5,2},{5,3},{},-1)
addlogic("node",0,{6,1},{2,4},{},-1)
addlogic("glyph",0,{3,2},{3,3},{},-1)
addlogic("all",0,{0,1},{0,3},{},-1)
addlogic("level",0,{4,0},{4,1},{},-1)
addlogic("group",0,{3,2},{3,3},{},-1)
addlogic("group2",0,{2,1},{2,2},{},-1)
addlogic("group3",0,{5,2},{5,3},{},-1)
addlogic("empty",0,{0,1},{0,3},{},-1)
addlogic("cursor",0,{2,3},{2,4},{},-1)

--normal nouns
addlogic("baba",0,{4,0},{4,1},{},-1)
addlogic("flag",0,{6,1},{2,4},{},-1)
addlogic("wall",0,{1,1},{0,1},{},-1)
addlogic("rock",0,{6,0},{6,1},{},-1)
addlogic("brick",0,{6,0},{6,1},{},-1)
addlogic("tile",0,{1,1},{0,1},{},-1)
addlogic("grass",0,{5,1},{5,3},{},-1)
addlogic("hedge",0,{5,0},{5,1},{},-1)
addlogic("water",0,{1,2},{1,3},{},-1)
addlogic("lava",0,{2,2},{2,3},{},-1)
addlogic("bog",0,{5,1},{5,3},{},-1)
addlogic("belt",0,{1,2},{1,3},{},-1)
addlogic("cog",0,{0,1},{0,2},{},-1)
addlogic("fire",0,{2,0},{2,2},{},-1)
addlogic("ice",0,{1,2},{1,3},{},-1)
addlogic("skull",0,{2,0},{2,1},{},-1)
addlogic("pipe",0,{1,1},{0,1},{},-1)
addlogic("keke",0,{2,1},{2,2},{},-1)
addlogic("me",0,{3,0},{3,1},{},-1)
addlogic("fofo",0,{5,1},{5,2},{},-1)
addlogic("it",0,{1,2},{1,4},{},-1)
addlogic("box",0,{6,0},{6,1},{},-1)
addlogic("door",0,{2,1},{2,2},{},-1)
addlogic("key",0,{6,1},{2,4},{},-1)
addlogic("square",0,{4,0},{4,1},{},-1)
addlogic("circle",0,{5,2},{5,3},{},-1)
addlogic("fruit",0,{2,1},{2,2},{},-1)
addlogic("tree",0,{5,1},{5,2},{},-1)
addlogic("trees",0,{5,1},{5,2},{},-1)
addlogic("husk",0,{6,0},{6,1},{},-1)
addlogic("husks",0,{6,1},{6,2},{},-1)
addlogic("crab",0,{2,1},{2,2},{},-1)
addlogic("bubble",0,{1,3},{1,4},{},-1)
addlogic("algae",0,{5,1},{5,2},{},-1)
addlogic("jelly",0,{1,3},{1,4},{},-1)
addlogic("cliff",0,{6,1},{6,2},{},-1)
addlogic("star",0,{6,1},{2,4},{},-1)
addlogic("moon",0,{6,1},{2,4},{},-1)
addlogic("dust",0,{6,1},{2,4},{},-1)

--props
addlogic("you",2,{4,0},{4,1},{},-1)
addlogic("you2",2,{4,0},{4,1},{},-1)
addlogic("win",2,{6,1},{2,4},{},-1)
addlogic("stop",2,{5,0},{5,1},{},-1)
addlogic("push",2,{6,0},{6,1},{},-1)
addlogic("sink",2,{1,2},{1,3},{},-1)
addlogic("defeat",2,{2,0},{2,1},{},-1)
addlogic("hot",2,{2,2},{2,3},{},-1)
addlogic("melt",2,{1,2},{1,3},{},-1)
addlogic("open",2,{6,1},{2,4},{},-1)
addlogic("shut",2,{2,1},{2,2},{},-1)
addlogic("move",2,{5,1},{5,3},{},-1)
addlogic("shift",2,{1,2},{1,3},{},-1)
addlogic("float",2,{1,2},{1,4},{},-1)
addlogic("tele",2,{1,2},{1,4},{},-1)
addlogic("pull",2,{6,1},{6,2},{},-1)
addlogic("weak",2,{1,1},{1,2},{},-1)
addlogic("boom",2,{2,1},{2,2},{},-1)
addlogic("safe",2,{0,1},{0,3},{},-1)
addlogic("phantom",2,{1,1},{0,1},{},-1)
addlogic("swap",2,{3,0},{3,1},{},-1)
addlogic("right",2,{1,2},{1,4},{},-1)
addlogic("up",2,{1,2},{1,4},{},-1)
addlogic("left",2,{1,2},{1,4},{},-1)
addlogic("down",2,{1,2},{1,4},{},-1)
addlogic("bonus",2,{4,0},{4,1},{},-1)
addlogic("red",2,{2,1},{2,2},{},-1)
addlogic("blue",2,{3,2},{3,3},{},-1)
addlogic("fall",2,{5,1},{5,3},{},-1)
addlogic("fallright",2,{5,1},{5,3},{},-1)
addlogic("fallup",2,{5,1},{5,3},{},-1)
addlogic("fallleft",2,{5,1},{5,3},{},-1)
addlogic("nudgedown",2,{5,1},{5,3},{},-1)
addlogic("nudgeright",2,{5,1},{5,3},{},-1)
addlogic("nudgeup",2,{5,1},{5,3},{},-1)
addlogic("nudgeleft",2,{5,1},{5,3},{},-1)
addlogic("lockeddown",2,{4,1},{4,2},{},-1)
addlogic("lockedright",2,{4,1},{4,2},{},-1)
addlogic("lockedup",2,{4,1},{4,2},{},-1)
addlogic("lockedleft",2,{4,1},{4,2},{},-1)
addlogic("turn",2,{1,2},{1,4},{},-1)
addlogic("deturn",2,{1,2},{1,4},{},-1)
addlogic("power",2,{6,1},{2,4},{},-1)
addlogic("power2",2,{5,2},{5,3},{},-1)
addlogic("power3",2,{3,2},{4,4},{},-1)
addlogic("refers",3,{0,1},{0,3},{0,2},-1)

formatobjlist()

function logicbaserule()
	addbaserule("logic", "is", "push")
end

table.insert(mod_hook_functions.rule_baserules, logicbaserule)

function hotbar_updatethumbnail(object,thumbid,slotid)
	local thumb = mmf.newObject(thumbid)

	if (string.len(object) > 0) then
		local sprite = getactualdata_objlist(object,"sprite")
		local sprite_in_root = getactualdata_objlist(object,"sprite_in_root")
		local colour = getactualdata_objlist(object,"colour")
		local colour_a = getactualdata_objlist(object,"active")
		local tiletype = getactualdata_objlist(object,"unittype")

		local path = "Data/Sprites/"
		if (sprite_in_root == false) then
			path = "Data/Worlds/" .. generaldata.strings[WORLD] .. "/Sprites/"
		end

		MF_thumbnail_loadimage(thumbid,0,slotid,path .. sprite .. "_0_1.png")

		if (tiletype == "object") then
			MF_setcolour(thumbid, colour[1], colour[2])
		else
			MF_setcolour(thumbid, colour_a[1], colour_a[2])
		end

		thumb.visible = true
	else
		thumb.visible = false
	end
end

menufuncs.objectedit =
{
	button = "ObjectEditButton",
	escbutton = "return",
	slide = {1,0},
	slide_leave = {-1,0},
	enter =
	function(parent,name,buttonid,unitname)
		local x = screenw * 0.5
		local y = f_tilesize * 2.5

		createbutton("return",x,y,2,16,1,langtext("return"),name,3,1,buttonid)

		local dynamic_structure = {}
		table.insert(dynamic_structure, {{"return"}})

		local extended = false
		local extended_ = tonumber(MF_read("settings","editor","mode")) or 0
		if (extended_ == 1) then
			extended = true
		end

		y = y + f_tilesize * 1.5

		local realname = unitreference[unitname]
		local currname = getactualdata_objlist(realname,"name")
		local unittype = getactualdata_objlist(realname,"unittype")

		local unitid = MF_create(realname)
		local unit = mmf.newObject(unitid)

		unit.x = f_tilesize * 5
		unit.y = f_tilesize * 5
		unit.scaleX = 5
		unit.scaleY = 5
		unit.layer = 2
		editor.values[EDITTARGET] = unitid

		getmetadata(unit)
		if (changes[realname] ~= nil) then
			dochanges(unitid)
		end
		setcolour(unitid)

		if (extended == false) then
			y = y + f_tilesize * 1
		end

		x = screenw * 0.6

		writetext(tostring(currname) .. " (" .. tostring(realname) .. ") - " .. tostring(unittype),0,x,y,"objectinfo",true,nil,nil,nil,nil,nil,nil,true)

		y = y + f_tilesize * 1

		createbutton("sprite",x,y,2,16,1,langtext("editor_object_sprite"),name,3,2,buttonid)

		table.insert(dynamic_structure, {{"sprite"}})

		if extended then
			y = y + f_tilesize * 1

			createbutton("name",x,y,2,16,1,langtext("editor_object_name"),name,3,2,buttonid)
			table.insert(dynamic_structure, {{"name"}})

			y = y + f_tilesize * 1

			createbutton("type",x,y,2,16,1,langtext("editor_object_type"),name,3,2,buttonid)
			table.insert(dynamic_structure, {{"type"}})

			y = y + f_tilesize * 1
		else
			y = y + f_tilesize * 2
		end

		x = screenw * 0.5

		writetext(langtext("editor_object_colour"),0,x,y,name,true)

		y = y + f_tilesize * 1

		local dynamic_structure_row = {}

		if (unittype ~= "object") then
			createbutton("colour",x - f_tilesize * 6.5,y,2,12,1,langtext("editor_object_colour_base"),name,3,2,buttonid)
			table.insert(dynamic_structure_row, {"colour"})

			createbutton("acolour",x + f_tilesize * 6.5,y,2,12,1,langtext("editor_object_colour_active"),name,3,2,buttonid)
			table.insert(dynamic_structure_row, {"acolour"})
		else
			createbutton("colour",x,y,2,12,1,langtext("editor_object_colour_onlybase"),name,3,2,buttonid)
			table.insert(dynamic_structure_row, {"colour"})
		end

		table.insert(dynamic_structure, dynamic_structure_row)

		if extended then
			y = y + f_tilesize * 1

			writetext(langtext("editor_object_animation"),0,x,y,name,true)

			y = y + f_tilesize * 1

			local w = 9

			local bw = w * f_tilesize + f_tilesize
			local bh = f_tilesize

			local ox = x - bw

			createbutton("a1",ox,y,2,w,1,langtext("editor_object_animation_none"),name,3,2,buttonid)
			createbutton("a2",ox + bw,y,2,w,1,langtext("editor_object_animation_dirs"),name,3,2,buttonid)
			createbutton("a3",ox + bw * 2,y,2,w,1,langtext("editor_object_animation_anim"),name,3,2,buttonid)
			createbutton("a4",ox,y + bh,2,w,1,langtext("editor_object_animation_animdirs"),name,3,2,buttonid)
			createbutton("a5",ox + bw,y + bh,2,w,1,langtext("editor_object_animation_character"),name,3,2,buttonid)
			createbutton("a6",ox + bw * 2,y + bh,2,w,1,langtext("editor_object_animation_tiled"),name,3,2,buttonid)

			table.insert(dynamic_structure, {{"a1"},{"a2"},{"a3"}})
			table.insert(dynamic_structure, {{"a4"},{"a5"},{"a6"}})

			local aselect = getactualdata(realname,"tiling")
			local changed = false

			MF_alert(unit.strings[NAME] .. ", " .. tostring(aselect) .. ", " .. tostring(realname))

			if (aselect == 4) and (changed == false) then
				aselect = 1
				changed = true
			elseif (aselect == 3) and (changed == false) then
				aselect = 2
				changed = true
			elseif (aselect == 2) and (changed == false) then
				aselect = 3
				changed = true
			elseif (aselect == 1) and (changed == false) then
				aselect = 4
				changed = true
			end

			makeselection({"a1","a2","a3","a4","a5","a6"},aselect + 2)

			y = y + f_tilesize * 2

			if (unittype == "text") then
				writetext(langtext("editor_object_text_type"),0,x,y,name,true)

				y = y + f_tilesize * 1

				w = 4.5
				bw = w * f_tilesize + f_tilesize

				ox = x - bw * 2.5

				createbutton("w1",ox,y,2,w,1,"baba",name,3,2,buttonid)
				createbutton("w2",ox + bw,y,2,w,1,"is",name,3,2,buttonid)
				createbutton("w3",ox + bw * 2,y,2,w,1,"you",name,3,2,buttonid)

				createbutton("w4",ox + bw * 3,y,2,w,1,"lonely",name,3,2,buttonid)
				createbutton("w5",ox + bw * 4,y,2,w,1,"on",name,3,2,buttonid)
				createbutton("w6",ox + bw * 5,y,2,w,1,"ba",name,3,2,buttonid)

				table.insert(dynamic_structure, {{"w1"},{"w2"},{"w3"},{"w4"},{"w5"},{"w6"}})

				local otype = getactualdata(realname,"type")
				makeselection({"w1","w2","w3","w4","","w6","","w5"},otype + 1)

				y = y + f_tilesize * 1

				writetext(langtext("editor_object_text_manualtype"),0,x,y,name,true)

				x = screenw * 0.5
				y = y + f_tilesize * 1

				createbutton("-",x - f_tilesize * 1,y,2,1,1,"<",name,3,2,buttonid)
				createbutton("+",x + f_tilesize * 1,y,2,1,1,">",name,3,2,buttonid)

				table.insert(dynamic_structure, {{"-","cursor"},{"+","cursor"}})

				local symbolid = MF_specialcreate("Editor_number")
				local symbol = mmf.newObject(symbolid)
				symbol.x = x
				symbol.y = y
				symbol.layer = 3
				symbol.values[1] = 0
				symbol.strings[OWNERMENU] = "objectedit"
				symbol.strings[GROUP] = "TextType"
				symbol.values[6] = x
				symbol.values[7] = y

				symbol.values[TYPE] = otype

				y = y + f_tilesize * 1
			end
		else
			y = y + f_tilesize * 2
		end

		x = screenw * 0.5

		writetext(langtext("editor_object_zlevel"),0,x,y,name,true)

		y = y + f_tilesize * 1

		createbutton("l-",x - f_tilesize * 1,y,2,1,1,"<",name,3,2,buttonid)
		createbutton("l+",x + f_tilesize * 1,y,2,1,1,">",name,3,2,buttonid)

		table.insert(dynamic_structure, {{"l-","cursor"},{"l+","cursor"}})

		local symbolid2 = MF_specialcreate("Editor_number")
		local symbol2 = mmf.newObject(symbolid2)
		symbol2.x = x
		symbol2.y = y
		symbol2.layer = 3
		symbol2.values[1] = -1
		symbol2.strings[OWNERMENU] = "objectedit"
		symbol2.strings[GROUP] = "ZLevel"
		symbol2.values[6] = x
		symbol2.values[7] = y

		symbol2.values[TYPE] = getactualdata(realname,"layer")

		y = y + f_tilesize * 1

		table.insert(dynamic_structure, {{"reset"}})

		createbutton("reset",x,y,2,16,1,langtext("editor_object_reset"),name,3,2,buttonid)

		buildmenustructure(dynamic_structure)
	end,
	leave =
	function(parent,name)
		MF_delete("ObjectEditButton")
		MF_letterclear("objectinfo",0)
	end,
	submenu_leave =
	function(parent,name)
		MF_visible("ObjectEditButton",0)
		MF_letterclear("objectinfo",0)
	end,
	submenu_return =
	function(parent,name)
		MF_visible("ObjectEditButton",1)

		local x = screenw * 0.6
		local y = f_tilesize * 4

		local unitid = editor.values[EDITTARGET]
		local unit = mmf.newObject(unitid)

		local currname = getactualdata_objlist(unit.className,"name")
		local realname = unit.className
		local unittype = getactualdata_objlist(unit.className,"unittype")

		unit.strings[UNITTYPE] = unittype

		writetext(currname .. " (" .. realname .. ") - " .. unittype,0,x,y,"objectinfo",true,nil,nil,nil,nil,nil,nil,true)
	end,
}

function findflowunits()
	local result = {}
	local alreadydone = {}
	local checkrecursion = {}
	local related = {}

	local identifier = ""
	local fullid = {}

	if (featureindex["flow"] ~= nil) then
		for i,v in ipairs(featureindex["flow"]) do
			local rule = v[1]
			local conds = v[2]
			local ids = v[3]

			local name = rule[1]
			local subid = ""

			if (rule[2] == "is") then
				if ((objectlist[name] ~= nil) or (is_str_broad_noun(name))) and (name ~= "logic") and (alreadydone[name] == nil) then
					local these = findall({name})
					alreadydone[name] = 1

					if (#these > 0) then
						for a,b in ipairs(these) do
							local bunit = mmf.newObject(b)
							local unitname = ""
							if (name == "logic") then
								unitname = bunit.strings[UNITNAME]
							else
								unitname = name
							end
							local valid = true

							if (featureindex["broken"] ~= nil) then
								if (hasfeature(getname(bunit),"is","broken",b,bunit.values[XPOS],bunit.values[YPOS]) ~= nil) then
									valid = false
								end
							end

							if valid then
								table.insert(result, {b, conds})
								subid = subid .. unitname
								-- LISÄÄ TÄHÄN LISÄÄ DATAA
							end
						end
					end
				end

				if (#subid > 0) then
					for a,b in ipairs(conds) do
						local condtype = b[1]
						local params = b[2] or {}

						subid = subid .. condtype

						if (#params > 0) then
							for c,d in ipairs(params) do
								subid = subid .. tostring(d)

								related = findunits(d,related,conds)
							end
						end
					end
				end

				table.insert(fullid, subid)

				--MF_alert("Going through " .. name)

				if (#ids > 0) then
					if (#ids[1] == 1) then
						local firstunit = mmf.newObject(ids[1][1])

						local notname = name
						if (string.sub(name, 1, 4) == "not ") then
							notname = string.sub(name, 5)
						end

						if (firstunit.strings[UNITNAME] ~= "text_" .. name) and (firstunit.strings[UNITNAME] ~= "text_" .. notname) and (firstunit.strings[UNITNAME] ~= "logic_" .. name) and (firstunit.strings[UNITNAME] ~= "logic_" .. notname) then
							--MF_alert("Checking recursion for " .. name)
							table.insert(checkrecursion, {name, i})
						end
					end
				else
					MF_alert("No ids listed in Word-related rule! rules.lua line 1302 - this needs fixing asap (related to grouprules line 1118)")
				end
			end
		end

		table.sort(fullid)
		for i,v in ipairs(fullid) do
			-- MF_alert("Adding " .. v .. " to id")
			identifier = identifier .. v
		end

		--MF_alert("Identifier: " .. identifier)

		for a,checkname_ in ipairs(checkrecursion) do
			local found = false

			local checkname = checkname_[1]

			local b = checkname
			if (string.sub(b, 1, 4) == "not ") then
				b = string.sub(checkname, 5)
			end

			for i,v in ipairs(featureindex["flow"]) do
				local rule = v[1]
				local ids = v[3]
				local tags = v[4]

				-- Gotta change this to prevent some false infinite loops
				if (equals_or_included(b, rule[1])) or (rule[1] == "all" and get_pref(b) == "") or ((rule[1] ~= b) and (string.sub(rule[1], 1, 4) == "not ") and string.sub(b,1,5) ~= "text_") or ((rule[1] == "text" or rule[1] == "not all") and string.sub(b,1,5) == "text_") or ((rule[1] ~= b) and (string.sub(rule[1], 1, 9) == "not text_") and string.sub(b,1,5) == "text_")
						or ("meta"..getmetalevel(b) == rule[1]) or ("not meta"..getmetalevel(b) ~= rule[1] and (metatext_includenoun or string.sub(b,1,5) == "text_")) then
					for c,g in ipairs(ids) do
						for a,d in ipairs(g) do
							local idunit = mmf.newObject(d)

							-- Tässä pitäisi testata myös Group!
							if (idunit.strings[UNITNAME] == "text_" .. rule[1]) or ((idunit.strings[UNITNAME] == "glyph_" .. rule[1]) and (tags[1] == "glyphrule")) or ((idunit.strings[UNITNAME] == rule[1]) and (tags[1] == "glyphrule")) or ((rule[1] == "all") and (rule[1] ~= "glyph")) or (idunit.strings[UNITNAME] == "logic_" .. rule[1]) then
								--MF_alert("Matching objects - found")
								found = true
							elseif (string.sub(rule[1], 1, 5) == "group") then
								--MF_alert("Group - found")
								found = true
							elseif (rule[1] ~= checkname) and (((string.sub(rule[1], 1, 3) == "not") and (rule[1] ~= "glyph")) or ((rule[1] == "not all") and (rule[1] == "glyph"))) then
								--MF_alert("Not Object - found")
								found = true
							elseif idunit.strings[UNITNAME] == "text_this" then
								-- Note: this could match any "this is word" or "not this is word" rules. But we handle the raycast buisness in testcond
								found = true
							elseif (idunit.strings[UNITNAME] == "text_text_") then
								found = true
							end
						end
					end

					for c,g in ipairs(tags) do
						if (g == "mimic") then
							found = true
						end
					end
				end			end

			if (found == false) then
				identifier = "null"
				flowunits = {}

				for i,v in pairs(featureindex["flow"]) do
					local rule = v[1]
					local ids = v[3]

					--MF_alert("Checking to disable: " .. rule[1] .. " " .. ", not " .. b)

					if (rule[1] == b) or (rule[1] == "not " .. b) then
						v[2] = {{"never",{}}}
					end
				end

				if (string.sub(checkname, 1, 4) == "not ") then
					local notrules_flow = notfeatures["flow"]
					local notrules_id = checkname_[2]
					local disablethese = notrules_flow[notrules_id]

					for i,v in ipairs(disablethese) do
						v[2] = {{"never",{}}}
					end
				end
			end
		end
	end

	--MF_alert("Current id (end): " .. identifier)

	return result,identifier,related
end

function checkflowchanges(unitid,unitname)
	if (#flowunits > 0) then
		for i,v in ipairs(flowunits) do
			if (v[1] == unitid) then
				updatecode = 1
				return
			end
		end
	end

	if (#flowrelatedunits > 0) then
		for i,v in ipairs(flowrelatedunits) do
			if (v[1] == unitid) then
				updatecode = 1
				return
			end
		end
	end
end

local meta_table = {
	__index = function(t,k)
		if is_str_special_prefixed(k) and not is_str_special_prefix(k) then return 0 end
		return
	end
}

setmetatable(logic_types,meta_table)