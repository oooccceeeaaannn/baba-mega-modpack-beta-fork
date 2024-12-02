OPTIMIZATION_ON = false

local memory_in_kb = collectgarbage("count")
memory_in_kb = math.floor(memory_in_kb)
if memory_in_kb > -2763 then
    local str = debug.getinfo(1).source:sub(2)
    local pf_lua_dir = str:match("(.*/)")
    local directory = pf_lua_dir
    print("[Mega Modpack] ---- Loading optimization feature ----")
    dofile(directory.."load_first/modules/optimization/main.lua")
    OPTIMIZATION_ON = true
    error("Memory usage: "..memory_in_kb.." KB, which is too high.\n" ..
            "Optimal memory usage is -2763 KB or less.\n" ..
            "Enabling the optimization feature..." )
end