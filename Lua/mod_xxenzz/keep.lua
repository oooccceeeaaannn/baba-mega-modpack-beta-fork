table.insert(editor_objlist_order, "text_keep")

editor_objlist["text_keep"] =
{
    name = "text_keep",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 3,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}
formatobjlist()

condlist["keep"] = function(params,checkedconds,checkedconds_,cdata)
    return true,checkedconds,true
end

function getkeepunits()
    local keepunits = {}
    for a, b in ipairs(features) do
        if b[2] ~= nil then
            local kept = false
            for c, d in ipairs(b[2]) do
                if d[1] == "keep" then
                    kept = true
                    for _,p in ipairs(b[3]) do
                        if #p ~= 0 then
                            for __,q in ipairs(p) do
                                keepunits[mmf.newObject(q)] = true
                            end
                        end
                    end
                end
            end
        end
    end
    return keepunits
end
