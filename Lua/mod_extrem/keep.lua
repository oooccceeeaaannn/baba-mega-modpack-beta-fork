condlist["keep"] = function(params, checkedconds, checkedconds_, cdata)
    return true, checkedconds, true
end

keeprules = {}

function fillkeepruleslist()
    keeprules = {}
    for a, b in ipairs(visualfeatures) do
        if b[2] ~= nil then
            local kept = false
            local rule = b[1]
            if not (rule[1] == "this" or rule[1] == "that" or rule[1] == "these" or rule[1] == "those" or
                    rule[3] == "this" or rule[3] == "that" or rule[3] == "these" or rule[3] == "those") then
                for c, d in ipairs(b[2]) do
                    if d[1] == "keep" then
                        kept = true
                        break
                    end
                end
            end
            if kept then
                local conds = {}
                local isthisrule = false
                for e, f in ipairs(b[2]) do
                    if f[1] ~= "keep" then
                        table.insert(conds, f)
                    end
                    if f[1] == "this" then
                        isthisrule = true
                        break
                    end
                end
                if not isthisrule then
                    table.insert(keeprules, { rule, conds, b[3], b[4], b[5] })
                end
            end
        end
    end
end
--[[
table.insert(mod_hook_functions.level_win, function()
    fillkeepruleslist()
end)
--]]
table.insert(mod_hook_functions.rule_baserules, function()
    for a, b in ipairs(keeprules) do
        addbaserule(b[1][1], b[1][2], b[1][3], b[2],true)
        table.insert(visualfeatures, keeprules[a])
    end
end)

--Override to add the fillkeepruleslist() function in there
--@Merge: merged many functions










