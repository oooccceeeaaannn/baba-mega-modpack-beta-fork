
condlist.moved = function(params, checkedconds, _, cdata)
    local unitid = cdata.unitid
    local unit = mmf.newObject(unitid)
    return unit.values[MOVED] == 1, checkedconds
end

condlist.that = function(params,checkedconds,checkedconds_,cdata)

    local allfound = 0
    local alreadyfound = {}
    local name,unitid,x,y,limit = cdata.name,cdata.unitid,cdata.x,cdata.y,cdata.limit
    local verb = cdata.subtype

    if verb == "have" then
        verb = "has"
    end

    if (#params > 0) then
        for a,b in ipairs(params) do
            local pname = b
            local pnot = false
            if (string.sub(b, 1, 4) == "not ") then
                pnot = true
                pname = string.sub(b, 5)
            end

            local bcode = b .. "_" .. tostring(a)

            if (featureindex[name] ~= nil) then
                for c,d in ipairs(featureindex[name]) do
                    local drule = d[1]
                    local dconds = d[2]

                    if (checkedconds[tostring(dconds)] == nil) then
                        if (pnot == false) then
                            if (drule[1] == name) and (drule[2] == verb) and (drule[3] == b) then
                                checkedconds[tostring(dconds)] = 1

                                if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
                                    alreadyfound[bcode] = 1
                                    allfound = allfound + 1
                                    break
                                end
                            end
                        else
                            if (string.sub(drule[3], 1, 4) ~= "not ") then
                                if (drule[1] == name) and (drule[2] == verb) and (drule[3] ~= pname) then
                                    checkedconds[tostring(dconds)] = 1

                                    if (alreadyfound[bcode] == nil) and testcond(dconds, unitid, x, y, nil, limit, checkedconds) then
                                        alreadyfound[bcode] = 1
                                        allfound = allfound + 1
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    else
        return false,checkedconds,true
    end

    --MF_alert(tostring(cdata.debugname) .. ", " .. tostring(allfound) .. ", " .. tostring(#params))

    return (allfound == #params),checkedconds,true
end
