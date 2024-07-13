local str = debug.getinfo(1).source:sub(2)
local dir = str:match("(.*/)")

local load_order = {
    "addtexts.lua",
    "as.lua",
    "glossary.lua",
    "keep.lua",
    "newconds.lua",
    "spin.lua",
    "watch & watched.lua",
}

for _, file in ipairs(load_order) do
    print("[Mega Modpack] Loading "..file)
    dofile(dir..file)
end