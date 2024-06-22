
function isalkali(unitid,x,y)
    name = ""

    if (unitid ~= 1) and (unitid ~= 2) then
        local unit = mmf.newObject(unitid)
        name = unit.strings[UNITNAME]
    elseif (unitid == 1) then
        name = "level"
    else
        name = "empty"
    end

    local alkali = hasfeature(name,"is","alkali",unitid,x,y)

    if (alkali ~= nil) then
        return true
    end

    local toxic = hasfeature(name,"is","toxic",unitid,x,y)

    if (toxic ~= nil) then
        return true
    end


    return false
end

function isnt_symbol_name(tilename)
    return ((tilename ~= "equal") and (tilename ~= "approx") and (tilename ~= "elementof") and (tilename ~= "nelementof") and (tilename ~= "nequal"))
end