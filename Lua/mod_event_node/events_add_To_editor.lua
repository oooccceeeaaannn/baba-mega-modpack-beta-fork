
table.insert(editor_objlist_order, "text_event")
table.insert(editor_objlist_order, "text_code")
table.insert(editor_objlist_order, "text_token")

editor_objlist["text_event"] =
{
  name = "text_event",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text","abstract"},
  tiling = -1,
  type = 0,
  layer = 20,
  colour = {5, 2},
  colour_active = {5, 3},
}

editor_objlist["text_code"] =
{
    name = "text_code",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","abstract"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["text_token"] =
{
    name = "text_token",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","abstract"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 2},
    colour_active = {5, 3},
}


table.insert(editor_objlist_order, "text_event_")

editor_objlist["text_event_"] =
{
    name = "text_event_",
    sprite = "text_eventpre",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","abstract"},
    tiling = -1,
    type = 4,
    layer = 20,
    colour = {5, 2},
    colour_active = {5, 3},
}

formatobjlist()

local vvvvvv = {"baba", "flag", "start", "destroy", "turn", "on", "become", "move", "tile", "event", "text", "level", "all",
                "code", "keke", "you", "win", "hot", "rock", "wall", "push", "stop", "melt", "water", "lava", "sink", "make", "box", "pull",
                "be", "key", "door", "open", "shut", "skull", "defeat", "grass", "belt", "shift", "as","brick","fire","flower","have","ice","leaf","me","orb","red","blue","yellow","tree", "fungus", "fungi",
                "hedge", "still", "nop", "fofo", "jiji", "it", "more", "statue", "pillar", "fence", "square", "star",
                "lonely", "power", "powered", "when", "halt",
                "group", "eat", "near", "never", "not",
                "backslash", "then", "forward", "backward", "aroundleft", "aroundright", "up", "down", "left", "right", "repeat", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}

local fakecolors = {}
fakecolors["destroy"] = {colour = {2,1}, colour_active = {2,2}}
fakecolors["halt"] = {colour = {2,1}, colour_active = {2,2}}
fakecolors["never"] = {colour = {2,1}, colour_active = {2,2}}
fakecolors["become"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["be"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["as"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["when"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["openparen"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["closeparen"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["start"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["have"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["backslash"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["then"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["repeat"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["goto"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["tab"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["if"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["press"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["nop"] = {colour = {0,1}, colour_active = {0,2}}
fakecolors["aroundleft"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["aroundright"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["forward"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["backward"] = {colour = {1,2}, colour_active = {1,4}}


fakecolors["func"] = {colour = {2,1}, colour_active = {2,2}}
fakecolors["func2"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["func3"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["def"] = {colour = {0,1}, colour_active = {0,3}}
fakecolors["break"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["tab"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["else"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["var_x"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["var_y"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["var_z"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["equals"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["plus"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["minus"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["times"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["over"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["percent"] = {colour = {0,1}, colour_active = {0,3}}
fakecolors["way"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["parse"] = {colour = {1,2}, colour_active = {1,4}}
for i, j in ipairs(vvvvvv) do
  local eventj = "event_" .. j
  table.insert(editor_objlist_order, eventj)
  if editor_objlist_reference["text_" .. j] ~= nil then
    local eref = editor_objlist[editor_objlist_reference["text_" .. j]]
      local tags = {"events"}
      for _,v in ipairs(eref.tags) do
          table.insert(tags, v)
      end
    editor_objlist[eventj] =
    {
    	name = eventj,
    	sprite_in_root = false,
    	unittype = "text",
    	tags = tags,
    	tiling = -1,
    	type = eref.type,
    	layer = 20,
    	colour = eref.colour,
    	colour_active = eref.colour_active
    }
  elseif fakecolors[j] ~= nil then
    editor_objlist[eventj] =
    {
      name = eventj,
      sprite_in_root = false,
      unittype = "text",
      tags = {"text","abstract", "events"},
      tiling = -1,
      type = 9,
      layer = 20,
      colour = fakecolors[j].colour,
      colour_active = fakecolors[j].colour_active,
    }
  else
    editor_objlist[eventj] =
    {
    	name = eventj,
    	sprite_in_root = false,
    	unittype = "text",
    	tags = {"text","abstract", "events"},
    	tiling = -1,
    	type = 0,
    	layer = 1,
    	colour = {0,1},
    	colour_active = {0,2},
    }
  end
end



formatobjlist()

table.insert(mod_hook_functions.rule_baserules, function()
	addbaserule("event","is","push")
end)

