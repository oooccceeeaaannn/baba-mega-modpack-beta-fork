condlist['refers'] = function(params, checkedconds, checkedconds_, cdata)
    for i, j in pairs(params) do
        local _params = " " .. j

        local unitname = mmf.newObject(cdata.unitid).strings[UNITNAME]
        _params = string.sub(_params, 2)
        if (string.sub(unitname, 1, 5) == "text_") or (string.sub(unitname, 1, 6) == "glyph_") then
            if (string.sub(unitname, 6) == _params) then
                return true, checkedconds
            end
        end

        if hasfeature(unitname, "is", "word", cdata.unitid) and (unitname == _params) then
            return true, checkedconds
        end
    end
    return false, checkedconds
end