local str = debug.getinfo(1).source:sub(2)
local dir = str:match("(.*/)")

local load_order = {
    "autopick.lua",
    "baserule.lua",
    "changes.lua",
    "editor_menudata.lua",
    "events_add_To_editor.lua",
    "nodes_addtoeditor.lua",
    "rules.lua",
    "utils.lua",
    "zzz_newstuff.lua"
}

for _, file in ipairs(load_order) do
    print("[Mega Modpack] Loading "..file)
    dofile(dir..file)
end