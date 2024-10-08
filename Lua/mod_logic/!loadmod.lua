local str = debug.getinfo(1).source:sub(2)
local dir = str:match("(.*/)")

local load_order = {
    "!settings.lua",
	"logic.lua",
    "logicparsing.lua",
}

for _, file in ipairs(load_order) do
    print("[Mega Modpack] Loading "..file)
    dofile(dir..file)
end