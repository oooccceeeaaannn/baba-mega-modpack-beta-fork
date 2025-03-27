setmetatable(node_types, {__index = function(tab, name)
    if (is_str_special_prefixed(name) and not is_str_special_prefix(name)) then
        return 0
    end
    return nil
end})

function parselegacyarrows(breakunitresult)
    isarrow = {}
    firstarrows = {}
    hoverhints = {}
    for name, list in pairs(unitlists) do
        if (string.sub(name, 1, 5) == "node_") then
            for i, unitid in ipairs(list) do
                setcolour(unitid)
                local unit = mmf.newObject(unitid)
                isarrow[unitid] = true
                local name = string.sub(unit.strings[UNITNAME], 6, -1)
                if node_types[name] == 0 then
                    table.insert(firstarrows, unitid)
                end
            end
        end
    end
    pointsto = {}
    --pointedby = {}
    nottedarrows = {}
    for unitid, _ in pairs(isarrow) do
        local unit = mmf.newObject(unitid)
        local dir = unit.values[DIR]
        local drs = ndirs[dir + 1]
        local ox,oy = drs[1],drs[2]
        local xpos,ypos = unit.values[XPOS],unit.values[YPOS]
        xpos = xpos + ox
        ypos = ypos + oy
        local done = false
        while xpos > 0 and xpos < roomsizex and ypos > 0 and ypos < roomsizey do
            for i, unitid2 in ipairs(findallhere(xpos, ypos)) do
                if breakunitresult[unitid2] == 1 then
                    done = true
                    break
                end
                if isarrow[unitid2] then
                    pointsto[unitid] = unitid2
                    --[[pointedby[unitid2] = pointedby[unitid2] or {}
                    table.insert(pointedby[unitid2], unit)]]
                    local unit = mmf.newObject(unitid)
                    if string.sub(unit.strings[UNITNAME], 6, -1) == "not" then
                        nottedarrows[unitid2] = unitid
                    end
                    done = true
                    break
                end
            end
            if done then
                break
            end
            xpos = xpos + ox
            ypos = ypos + oy
        end
    end

    rulestoapply = {}
    bannedfirstarrows = {}
    for i, unitid in ipairs(firstarrows) do
        local targetnotted = nottedarrows[unitid]
        local unit = mmf.newObject(unitid)
        local target = nil
        local targetunitid = {unitid}
        local checkfornot = unitid
        local hasnot = true
        while checkfornot ~= nil do
            hasnot = not hasnot
            checkfornot = nottedarrows[checkfornot]
            table.insert(targetunitid, checkfornot)
        end
        if hasnot then
            target = "not " .. string.sub(unit.strings[UNITNAME], 6, -1)
        else
            target = string.sub(unit.strings[UNITNAME], 6, -1)
        end
        local parsed = {[unitid] = true}
        unitid = pointsto[unitid]
        local effects = {}
        local effectunitids = {}
        local conds = {}
        local condunitids = {}
        local currsubgroup = nil
        local currsubgroupunitid = nil
        local currsubgroupargtype = nil
        local currsubgroupargextra = nil
        local currsubgroupargs = {}
        local currsubgroupargunitids = {}
        local subgrouptype = nil
        local notted = false
        local notunitids = {}
        local nils = {}
        while unitid ~= nil do
            if parsed[unitid] then
                break
            end
            unit = mmf.newObject(unitid)
            local name = string.sub(unit.strings[UNITNAME], 6, -1)
            local texttype = node_types[name]
            if dirnames[name] ~= nil then
                name = dirnames[name][unit.values[DIR] + 1]
            end
            if texttype == -1 then
                table.insert(nils, unitid)
            else
                if currsubgroup == nil then
                    if texttype == 0 or texttype == 2 then
                        if notted then
                            table.insert(effects, {"is", "not " .. name})
                        else
                            table.insert(effects, {"is", name})
                        end
                        local toadd = {unitid, table.unpack(nils)}
                        for i, v in ipairs(notunitids) do
                            table.insert(toadd, 1, v)
                        end
                        table.insert(effectunitids, {{}, toadd})
                        notted = false
                        notunitids = {}
                    elseif texttype == 1 or texttype == 7 then
                        if notted then
                            if texttype == 1 then
                                break
                            end
                            currsubgroup = "not " .. name
                        else
                            currsubgroup = name
                        end

                        currsubgroupunitid = {unitid, table.unpack(nils)}
                        for i, v in ipairs(notunitids) do
                            table.insert(currsubgroupunitid, v)
                        end
                        notted = false
                        notunitids = {}

                        currsubgroupargtype = node_argtypes[name] or {0}
                        currsubgroupargextra = node_argextras[name] or {}
                        subgrouptype = texttype
                    elseif texttype == 6 then
                        if #effects == 0 or notted then
                            break
                        end
                        for i, v in ipairs(effects) do
                            table.insert(rulestoapply, {{target, v[1], v[2]}, copyqwe(conds), {targetunitid, effectunitids[i][1], effectunitids[i][2], table.unpack(condunitids)}, {"noderule"}})
                        end
                        effects = {}
                        conds = {}
                        effectunitids = {}
                        condunitids = {{unitid}}
                    elseif texttype == 4 then
                        notted = not notted
                        table.insert(notunitids, unitid)
                    elseif texttype == 3 then
                        if notted then
                            table.insert(conds, {"not " .. name, {}})
                        else
                            table.insert(conds, {name})
                        end
                        local toadd = {unitid, table.unpack(nils)}
                        for i, v in ipairs(notunitids) do
                            table.insert(toadd, 1, v)
                        end
                        table.insert(condunitids, toadd)
                        notted = false
                        notunitids = {}
                    else
                        break
                    end
                else
                    if texttype == 0 or texttype == 2 then
                        local allowed = false
                        for i, v in ipairs(currsubgroupargtype) do
                            if texttype == v then
                                allowed = true
                                break
                            end
                        end
                        for i, v in ipairs(currsubgroupargextra) do
                            if name == v then
                                allowed = true
                                break
                            end
                        end
                        if allowed then
                            bannedfirstarrows[unitid] = true
                            if notted then
                                table.insert(currsubgroupargs, "not " .. name)
                            else
                                table.insert(currsubgroupargs, name)
                            end
                            local toadd = {unitid, table.unpack(nils)}
                            for i, v in ipairs(notunitids) do
                                table.insert(toadd, 1, v)
                            end
                            table.insert(currsubgroupargunitids, toadd)
                            notted = false
                            notunitids = {}
                        else
                            break
                        end
                    elseif texttype == 6 then
                        if #currsubgroupargs == 0 or notted then
                            break
                        end
                        if subgrouptype == 1 then
                            for i, v in ipairs(currsubgroupargs) do
                                table.insert(effects, {currsubgroup, v})
                                table.insert(effectunitids, {currsubgroupunitid, {v}})
                            end
                        else
                            table.insert(conds, {currsubgroup, currsubgroupargs})
                            table.insert(condunitids, currsubgroupunitid)
                            for _, v in ipairs(currsubgroupargunitids) do
                                table.insert(condunitids, v)
                                -- table.insert(condunitids, {})
                            end
                            table.insert(condunitids, {unitid})
                        end
                        currsubgroup = nil
                        currsubgroupunitid = nil
                        currsubgroupargtype = nil
                        currsubgroupargextra = nil
                        currsubgroupargs = {}
                        currsubgroupargunitids = {}
                    elseif texttype == 4 then
                        notted = not notted
                        table.insert(notunitids, unitid)
                    else
                        break
                    end
                end
                nils = {}
            end
            parsed[unitid] = true
            unitid = pointsto[unitid]
        end
        if currsubgroup ~= nil and #currsubgroupargs > 0 then
            if subgrouptype == 1 then
                for i, v in ipairs(currsubgroupargs) do
                    table.insert(effects, {currsubgroup, v})
                    table.insert(effectunitids, {currsubgroupunitid, currsubgroupargunitids[i]})
                end
            else
                table.insert(conds, {currsubgroup, currsubgroupargs})
                table.insert(condunitids, {currsubgroupunitid})
                for _, v in ipairs(currsubgroupargunitids) do
                    table.insert(condunitids, v)
                    -- table.insert(condunitids, {})
                end
            end
        end
        -- condunitids[#condunitids] = nil
        for i, v in ipairs(effects) do
            table.insert(rulestoapply, {{target, v[1], v[2]}, copyqwe(conds), {targetunitid, effectunitids[i][1], effectunitids[i][2], table.unpack(condunitids)}})
        end
    end
    for i, v in ipairs(rulestoapply) do
        local firstarrow = v[3][1][#(v[3][1])]
        if bannedfirstarrows[firstarrow] == nil then
            if string.sub(v[1][3], 1, 4) == "not " then
                addoption(v[1], v[2], v[3], nil, nil, {"noderule"})
            else
                addoption(v[1], v[2], v[3], nil, nil, {"noderule"})
            end
        end
    end
end

function parsearrows(breakunitresult)
    isarrow = {}
    firstarrows = {}
    hoverhints = {}
    for name, list in pairs(unitlists) do
        if (string.sub(name, 1, 5) == "node_") then
            for i, unitid in ipairs(list) do
                setcolour(unitid)
                local unit = mmf.newObject(unitid)
                isarrow[unitid] = true
                if node_types[string.sub(unit.strings[UNITNAME], 6, -1)] == 0 then
                    table.insert(firstarrows, unitid)
                end
            end
        end
    end
    pointedby = {}
    nilfinder = {}
    notunitids = {}
    notnils = {}
    local nils
    local alsodo
    local starts = {}
    for unitid, _ in pairs(isarrow) do
        local unit = mmf.newObject(unitid)
        if node_types[unit.strings[UNITNAME]:sub(6, -1)] ~= -1 then
            table.insert(starts, {unitid, unit.values[XPOS], unit.values[YPOS], unit.values[DIR], {}, {[0] = {}, [1] = {}, [2] = {}, [3] = {}}})
        end
    end
    local totalruns = 0
    while #starts ~= 0 do
        print("== Start of run ==")
        totalruns = totalruns + 1
        if totalruns > 500 then
            print("Total runs exceeded 500")
            destroylevel("toocomplex")
            return
        end
        local start = table.remove(starts)
        local unitid = start[1]
        local xpos = start[2]
        local ypos = start[3]
        local dir = start[4]
        local unit = mmf.newObject(unitid)
        local drs = ndirs[dir + 1]
        local ox,oy = drs[1],drs[2]
        xpos = xpos + ox
        ypos = ypos + oy
        local done = false
        nils = start[5]
        local nilcheck = start[6]
        while xpos > 0 and xpos < roomsizex and ypos > 0 and ypos < roomsizey do
            for i, unitid2 in ipairs(findallhere(xpos, ypos)) do
                if breakunitresult[unitid2] == 1 then
                    done = true
                    break
                end
                if isarrow[unitid2] then
                    local unit2 = mmf.newObject(unitid2)
                    if node_types[unit2.strings[UNITNAME]:sub(6, -1)] == -1 then
                        if nilcheck[dir][unitid2] then
                            done = true
                            break
                        end
                        local nodename = unit2.strings[UNITNAME]:sub(6, -1)
                        if nodename == "nil" then
                            nilcheck[dir][unitid2] = true
                            dir = unit2.values[DIR]
                            drs = ndirs[dir + 1]
                            ox,oy = drs[1],drs[2]
                            table.insert(nils, unitid2)
                            nilcheck[dir][unitid2] = true
                        elseif nodename == "nil_perp" then
                            nilcheck[dir][unitid2] = true
                            dir = (unit2.values[DIR] + 1) % 4
                            drs = ndirs[dir + 1]
                            ox,oy = drs[1],drs[2]
                            table.insert(nils, unitid2)
                            nilcheck[dir][unitid2] = true
                            table.insert(starts, {unitid, xpos, ypos, (unit2.values[DIR] + 3) % 4, table_copy(nils), table_copy(nilcheck)})
                        elseif nodename == "nil_branch" then
                            nilcheck[dir][unitid2] = true
                            dir = unit2.values[DIR]
                            drs = ndirs[dir + 1]
                            ox,oy = drs[1],drs[2]
                            table.insert(nils, unitid2)
                            nilcheck[dir][unitid2] = true
                            table.insert(starts, {unitid, xpos, ypos, (unit2.values[DIR] + 3) % 4, table_copy(nils), table_copy(nilcheck)})
                        elseif nodename == "nil_debranch" then
                            nilcheck[dir][unitid2] = true
                            dir = unit2.values[DIR]
                            drs = ndirs[dir + 1]
                            ox,oy = drs[1],drs[2]
                            table.insert(nils, unitid2)
                            nilcheck[dir][unitid2] = true
                            table.insert(starts, {unitid, xpos, ypos, (unit2.values[DIR] + 1) % 4, table_copy(nils), table_copy(nilcheck)})
                        elseif nodename == "nil_spread" then
                            nilcheck[dir][unitid2] = true
                            dir = unit2.values[DIR]
                            drs = ndirs[dir + 1]
                            ox,oy = drs[1],drs[2]
                            table.insert(nils, unitid2)
                            table.insert(starts, {unitid, xpos, ypos, (unit2.values[DIR] + 1) % 4, table_copy(nils), table_copy(nilcheck)})
                            table.insert(starts, {unitid, xpos, ypos, (unit2.values[DIR] + 3) % 4, table_copy(nils), table_copy(nilcheck)})
                        elseif nodename == "nil_bump" then
                            bumpdir = unit2.values[DIR]
                            drs = ndirs[bumpdir + 1]
                            table.insert(nils, unitid2)
                            nilcheck[dir][unitid2] = true
                            xpos = xpos + drs[1] - ox
                            ypos = ypos + drs[2] - oy
                        elseif nodename == "nil_bump_perp" then
                            bumpdir = (unit2.values[DIR] + 1) % 4
                            drs = ndirs[bumpdir + 1]
                            table.insert(nils, unitid2)
                            nilcheck[dir][unitid2] = true
                            table.insert(starts, {unitid, xpos - drs[1], ypos - drs[2], dir, table_copy(nils), table_copy(nilcheck)})
                            xpos = xpos + drs[1] - ox
                            ypos = ypos + drs[2] - oy
                        elseif nodename == "nil_bump_branch" then
                            bumpdir = unit2.values[DIR]
                            drs = ndirs[bumpdir + 1]
                            table.insert(nils, unitid2)
                            nilcheck[dir][unitid2] = true
                            table.insert(starts, {unitid, xpos - drs[2], ypos + drs[1], dir, table_copy(nils), table_copy(nilcheck)})
                            xpos = xpos + drs[1] - ox
                            ypos = ypos + drs[2] - oy
                        elseif nodename == "nil_bump_debranch" then
                            bumpdir = unit2.values[DIR]
                            drs = ndirs[bumpdir + 1]
                            table.insert(nils, unitid2)
                            nilcheck[dir][unitid2] = true
                            table.insert(starts, {unitid, xpos + drs[2], ypos - drs[1], dir, table_copy(nils), table_copy(nilcheck)})
                            xpos = xpos + drs[1] - ox
                            ypos = ypos + drs[2] - oy
                        elseif nodename == "nil_bump_spread" then
                            bumpdir = unit2.values[DIR]
                            drs = ndirs[bumpdir + 1]
                            table.insert(nils, unitid2)
                            nilcheck[dir][unitid2] = true
                            table.insert(starts, {unitid, xpos + drs[2], ypos - drs[1], dir, table_copy(nils), table_copy(nilcheck)})
                            table.insert(starts, {unitid, xpos - drs[2], ypos + drs[1], dir, table_copy(nils), table_copy(nilcheck)})
                            xpos = xpos + drs[1] - ox
                            ypos = ypos + drs[2] - oy
                        end
                    elseif node_types[unit.strings[UNITNAME]:sub(6, -1)] == 4 then
                        pointedby[unitid2] = pointedby[unitid2] or {}
                        table.insert(pointedby[unitid2], unitid)
                        nilfinder[unitid2] = nilfinder[unitid2] or {}
                        table.insert(nilfinder[unitid2], table_copy(nils))
                        notunitids[unitid2] = notunitids[unitid2] or {}
                        table.insert(notunitids[unitid2], unitid)
                        notnils[unitid2] = notnils[unitid2] or {}
                        for _, nilunitid in ipairs(nils) do
                            table.insert(notnils[unitid2], nilunitid)
                        end
                        nils = {}
                        done = true
                    else
                        pointedby[unitid2] = pointedby[unitid2] or {}
                        table.insert(pointedby[unitid2], unitid)
                        nilfinder[unitid2] = nilfinder[unitid2] or {}
                        table.insert(nilfinder[unitid2], table_copy(nils))
                        done = true
                        nils = {}
                    end
                end
            end
            if done then
                break
            end
            xpos = xpos + ox
            ypos = ypos + oy
        end
    end

    for i, unitid in ipairs(firstarrows) do
        local unit = mmf.newObject(unitid)
        local targetname = unit.strings[UNITNAME]:sub(6, -1)
        local nots = notunitids[unitid] or {}
        if (#nots % 2) == 1 then
            targetname = "not " .. targetname
        end
        local extraunitids = table_copy(nots)
        for _, nilunitid in ipairs(notnils[unitid] or {}) do
            table.insert(extraunitids, nilunitid)
        end
        for j, verbunitid in ipairs(pointedby[unitid] or {}) do
            local verbunit = mmf.newObject(verbunitid)
            local verbnils = nilfinder[unitid][j]
            if node_types[verbunit.strings[UNITNAME]:sub(6, -1)] == 1 then
                -- find the objects and conditions
                local actions = {}
                local actionunitids = {}
                local conditions = {}
                local condunitids = {}
                for k, childunitid in ipairs(pointedby[verbunitid] or {}) do
                    local childunit = mmf.newObject(childunitid)
                    local childtype = node_types[childunit.strings[UNITNAME]:sub(6, -1)]
                    local childnils = nilfinder[verbunitid][k]
                    local childnots = notunitids[childunitid] or {}
                    local childnotnils = notnils[childunitid]
                    local childname = getnodename(childunit)
                    local nextup = {childunitid}
                    for _, v in ipairs(childnils or {}) do
                        table.insert(nextup, v)
                    end
                    for _, v in ipairs(childnots or {}) do
                        table.insert(nextup, v)
                    end
                    for _, v in ipairs(childnotnils or {}) do
                        table.insert(nextup, v)
                    end
                    if (#childnots % 2) == 1 then
                        childname = "not " .. childname
                    end
                    if childtype == 0 or childtype == 2 then
                        local legal = false
                        for _, v in ipairs(node_argtypes[verbunit.strings[UNITNAME]:sub(6, -1)] or {}) do
                            if v == childtype then
                                legal = true
                                break
                            end
                        end
                        for _, v in ipairs(node_argextras[verbunit.strings[UNITNAME]:sub(6, -1)] or {}) do
                            if v == childname then
                                legal = true
                                break
                            end
                        end
                        if legal then
                            table.insert(actions, childname)
                            table.insert(actionunitids, nextup)
                        end
                    elseif childtype == 3 then
                        table.insert(condunitids, {childunitid})
                        table.insert(conditions, {childname, {}})
                    elseif childtype == 7 then
                        local args = {}
                        for l, argunitid in ipairs(pointedby[childunitid] or {}) do
                            local argunit = mmf.newObject(argunitid)
                            local arg_type = node_types[argunit.strings[UNITNAME]:sub(6, -1)]
                            local argname = getnodename(argunit)
                            local argnots = notunitids[argunitid] or {}
                            if (#argnots % 2) == 1 then
                                argname = "not " .. argname
                            end
                            local extraargunitids = table_copy(argnots)
                            for _, nilunitid in ipairs(notnils[argunitid] or {}) do
                                table.insert(extraargunitids, nilunitid)
                            end
                            for _, nilunitid in ipairs(nilfinder[childunitid][l] or {}) do
                                table.insert(extraargunitids, nilunitid)
                            end
                            local legal = false
                            for _, v in ipairs(node_argtypes[childunit.strings[UNITNAME]:sub(6, -1)] or {}) do
                                if v == arg_type then
                                    legal = true
                                    break
                                end
                            end
                            for _, v in ipairs(node_argextras[childunit.strings[UNITNAME]:sub(6, -1)] or {}) do
                                if v == argname then
                                    legal = true
                                    break
                                end
                            end
                            if legal then
                                table.insert(args, argname)
                                table.insert(condunitids, {argunitid, table.unpack(extraargunitids)})
                            end
                        end
                        if #args > 0 then
                            table.insert(conditions, {childname, args})
                            table.insert(condunitids, nextup)
                        end
                    end
                end
                for l, action in ipairs(actions) do
                    local ids = {{unitid}, extraunitids, {verbunitid}, verbnils, table.unpack(actionunitids)}
                    for _, toadd in ipairs(condunitids) do
                        table.insert(ids, toadd)
                    end
                    addoption({targetname, verbunit.strings[UNITNAME]:sub(6, -1), action}, table_copy(conditions), table_copy(ids), nil, nil, {"noderule"})
                end
            end
        end
    end
end


function getnodename(unit)
    local name = unit.strings[UNITNAME]:sub(6, -1)
    if dirnames[name] then
        name = dirnames[name][unit.values[DIR]]
    end
    return name
end

function findbreakunits()
    local result = {}
    local alreadydone = {}
    local checkrecursion = {}
    local related = {}

    local identifier = ""
    local fullid = {}

    if (featureindex["break"] ~= nil) then
        for i,v in ipairs(featureindex["break"]) do
            local rule = v[1]
            local conds = v[2]
            local ids = v[3]

            local name = rule[1]
            local subid = ""

            if (rule[2] == "is") then
                if (objectlist[name] ~= nil) and (alreadydone[name] == nil) then
                    local these = findall({name,{}})
                    alreadydone[name] = 1

                    if (#these > 0) then
                        for a,b in ipairs(these) do
                            local bunit = mmf.newObject(b)
                            local valid = true

                            if (featureindex["broken"] ~= nil) then
                                if (hasfeature(getname(bunit),"is","broken",b,bunit.values[XPOS],bunit.values[YPOS]) ~= nil) then
                                    valid = false
                                end
                            end

                            if valid then
                                table.insert(result, {b, conds})
                                subid = subid .. name
                                -- LISÄÄ TÄHÄN LISÄÄ DATAA
                            end
                        end
                    end
                end

                if (#subid > 0) then
                    for a,b in ipairs(conds) do
                        local condtype = b[1]
                        local params = b[2] or {}

                        subid = subid .. condtype

                        if (#params > 0) then
                            for c,d in ipairs(params) do
                                subid = subid .. tostring(d)

                                related = findunits(d,related,conds)
                            end
                        end
                    end
                end

                table.insert(fullid, subid)

                --MF_alert("Going through " .. name)

                if (#ids > 0) then
                    if (#ids[1] == 1) then
                        local firstunit = mmf.newObject(ids[1][1])

                        local notname = name
                        if (string.sub(name, 1, 4) == "not ") then
                            notname = string.sub(name, 5)
                        end

                        if (firstunit.strings[UNITNAME] ~= "text_" .. name) and (firstunit.strings[UNITNAME] ~= "text_" .. notname) and (firstunit.strings[UNITNAME] ~= "node_" .. name) and (firstunit.strings[UNITNAME] ~= "node_" .. notname) then
                            --MF_alert("Checking recursion for " .. name)
                            table.insert(checkrecursion, {name, i})
                        end
                    end
                else
                    MF_alert("No ids listed in Word-related rule! rules.lua line 1302 - this needs fixing asap (related to grouprules line 1118)")
                end
            end
        end

        table.sort(fullid)
        for i,v in ipairs(fullid) do
            -- MF_alert("Adding " .. v .. " to id")
            identifier = identifier .. v
        end

        --MF_alert("Identifier: " .. identifier)

        for a,checkname_ in ipairs(checkrecursion) do
            local found = false

            local checkname = checkname_[1]

            local b = checkname
            if (string.sub(b, 1, 4) == "not ") then
                b = string.sub(checkname, 5)
            end

            for i,v in ipairs(featureindex["break"]) do
                local rule = v[1]
                local ids = v[3]
                local tags = v[4]

                if (rule[1] == b) or (rule[1] == "all") or ((rule[1] ~= b) and (string.sub(rule[1], 1, 3) == "not")) then
                    for c,g in ipairs(ids) do
                        for a,d in ipairs(g) do
                            local idunit = mmf.newObject(d)

                            -- Tässä pitäisi testata myös Group!
                            if (idunit.strings[UNITNAME] == "text_" .. rule[1]) or (rule[1] == "all") then
                                --MF_alert("Matching objects - found")
                                found = true
                            elseif (string.sub(rule[1], 1, 5) == "group") then
                                --MF_alert("Group - found")
                                found = true
                            elseif (rule[1] ~= checkname) and (string.sub(rule[1], 1, 3) == "not") then
                                --MF_alert("Not Object - found")
                                found = true
                            end
                        end
                    end

                    for c,g in ipairs(tags) do
                        if (g == "mimic") then
                            found = true
                        end
                    end
                end
            end

            if (found == false) then
                --MF_alert("Wordunit status for " .. b .. " is unstable!")
                identifier = "null"
                breakunits = {}

                for i,v in pairs(featureindex["break"]) do
                    local rule = v[1]
                    local ids = v[3]

                    --MF_alert("Checking to disable: " .. rule[1] .. " " .. ", not " .. b)

                    if (rule[1] == b) or (rule[1] == "not " .. b) then
                        v[2] = {{"never",{}}}
                    end
                end

                if (string.sub(checkname, 1, 4) == "not ") then
                    local notrules_word = notfeatures["break"]
                    local notrules_id = checkname_[2]
                    local disablethese = notrules_word[notrules_id]

                    for i,v in ipairs(disablethese) do
                        v[2] = {{"never",{}}}
                    end
                end
            end
        end
    end

    --MF_alert("Current id (end): " .. identifier)

    return result,identifier,related
end

--events code

event_text_types = {}
event_text_types["baba"] = "noun"
event_text_types["flag"] = "noun"
event_text_types["tile"] = "noun"
event_text_types["keke"] = "noun"
event_text_types["text"] = "noun"
event_text_types["event"] = "noun"
event_text_types["rock"] = "noun"
event_text_types["wall"] = "noun"
event_text_types["lava"] = "noun"
event_text_types["water"] = "noun"
event_text_types["box"] = "noun"
event_text_types["key"] = "noun"
event_text_types["door"] = "noun"
event_text_types["skull"] = "noun"
event_text_types["belt"] = "noun"
event_text_types["grass"] = "noun"
event_text_types["brick"] = "noun"
event_text_types["fire"] = "noun"
event_text_types["flower"] = "noun"
event_text_types["ice"] = "noun"
event_text_types["leaf"] = "noun"
event_text_types["me"] = "noun"
event_text_types["orb"] = "noun"
event_text_types["tree"] = "noun"
event_text_types["it"] = "noun"
event_text_types["jiji"] = "noun"
event_text_types["hedge"] = "noun"

event_text_types["group"] = "nounjective"

event_text_types["destroy"] = "adjective"
event_text_types["you"] = "adjective"
event_text_types["win"] = "adjective"
event_text_types["push"] = "adjective"
event_text_types["stop"] = "adjective"
event_text_types["hot"] = "adjective"
event_text_types["melt"] = "adjective"
event_text_types["sink"] = "adjective"
event_text_types["pull"] = "adjective"
event_text_types["open"] = "adjective"
event_text_types["shut"] = "adjective"
event_text_types["defeat"] = "adjective"
event_text_types["power"] = "adjective"
event_text_types["shift"] = "adjective"
event_text_types["red"] = "adjective"
event_text_types["blue"] = "adjective"
event_text_types["yellow"] = "adjective"
event_text_types["still"] = "adjective"
event_text_types["nop"] = "adjective"

event_text_types["func"] = "function"

event_text_types["turn"] = "verb"
event_text_types["move"] = "verb"
event_text_types["become"] = "verb"
event_text_types["make"] = "verb"
event_text_types["be"] = "verb"
event_text_types["eat"] = "verb"
event_text_types["have"] = "verb"
event_text_types["code"] = "verb"
event_text_types["goto"] = "verb"

event_text_types["as"] = "as"

event_text_types["press"] = "conditionverb"
event_text_types["idle"] = "action"

event_text_types["down"] = "direction"
event_text_types["up"] = "direction"
event_text_types["right"] = "direction"
event_text_types["left"] = "direction"
event_text_types["aroundleft"] = "direction"
event_text_types["aroundright"] = "direction"
event_text_types["forward"] = "direction"
event_text_types["backward"] = "direction"
event_text_types["way"] = "direction"

event_text_types["on"] = "condition"
event_text_types["near"] = "condition"
event_text_types["when"] = "condition"

event_text_types["repeat"] = "loop"

event_text_types["not"] = "not"

event_text_types["never"] = "never"

event_text_types["halt"] = "halt"

event_text_types["start"] = "begin"

event_text_types["backslash"] = "backslash"

event_text_types["then"] = "then"

event_text_types["lonely"] = "prefix"
event_text_types["powered"] = "prefix"
event_text_types["moved"] = "prefix"

event_text_types["0"] = "number"
event_text_types["1"] = "number"
event_text_types["2"] = "number"
event_text_types["3"] = "number"
event_text_types["4"] = "number"
event_text_types["5"] = "number"
event_text_types["6"] = "number"
event_text_types["7"] = "number"
event_text_types["8"] = "number"
event_text_types["9"] = "number"

verb_allowed_types = {}
verb_allowed_types["turn"] = {"direction"}
verb_allowed_types["move"] = {"direction"}
verb_allowed_types["repeat"] = {"number"}
verb_allowed_types["when"] = {"prefix", "adjective", "nounjective", "verb"}
verb_allowed_types["not when"] = {"prefix", "adjective", "nounjective", "verb"}
verb_allowed_types["be"] = {"noun", "adjective", "nounjective"}
verb_allowed_types["never"] = {"adjective", "verb", "nounjective"}
verb_allowed_types["adjective"] = {"adjective"}

number_extensions = {"power", "group", "powered"}

never_opposites = {}
never_opposites["not destroy"] = "safe"
never_opposites["not push"] = "pushless"
never_opposites["not pull"] = "pullless"
never_opposites["not swap"] = "swapless"
never_opposites["not stop"] = "nonstop"
never_opposites["not win"] = "lose"
never_opposites["not sink"] = "swim"

setmetatable(event_text_types, {__index = function(tab, name)
    if (is_str_special_prefixed(name) and not is_str_special_prefix(name)) then
        return "noun"
    end

end})


function event_code(tokenunitresult) --@TODO: Add generic support for GLYPH IS TOKEN

    local starts = findall({"event_start", {}}, true)
    if (#starts == 0) then
        return
    end

    local event_list = {}

    for i, j in ipairs(starts) do

        local unit = mmf.newObject(j)

        local x, y = unit.values[XPOS], unit.values[YPOS]

        local thex = x
        local they = y + 1

        local applicable, applicable_ids = find_events(x + 1, y, "noun", true, tokenunitresult)
        local backup_applicable = {}
        for i, zzzzz in ipairs(applicable) do
            table.insert(backup_applicable, zzzzz)
        end

        -- if no nouns were detected, dont parse
        if (#applicable > 0) then

            local limit = 0
            local done = false

            local conditions = {}

            local ids = {{j}}
            for i, k in ipairs(applicable_ids) do
                table.insert(ids, {k})
            end

            local backslash = false
            local notted = false
            local notcount = 0
            local blockstack = {}
            local done_lines = {}
            local id_mark = {}

            while limit < 70 and not done do


                local allhere = findallhere(thex, they)

                local isbackslashed = false

                if (#allhere > 0) then
                    local tilevalid = false
                    for i, k in ipairs(allhere) do

                        local kunit = mmf.newObject(k)

                        local name = getname(kunit)


                        local valid = false
                        if not backslash then
                            if (string.sub(name, 1, 6) == "event_") or (tokenunitresult[k]) then
                                valid = true
                            end
                        else
                            if (string.sub(name, 1, 5) == "text_") then
                                valid = true
                            end
                        end

                        if valid then
                            tilevalid = true
                            local copied_conditions = {}

                            for i, q in ipairs(conditions) do
                                table.insert(copied_conditions, q)
                            end

                            local eventname

                            --Handle \
                            if not backslash then
                                eventname = get_ref(name)
                            else
                                eventname = string.sub(name, 6)
                            end

                            local event_type = event_text_types[eventname]
                            if backslash and event_type == nil then
                                if kunit.values[TYPE] == 1 then
                                    event_type = "verb"
                                end
                                if kunit.values[TYPE] == 2 or string.sub(kunit.strings[NAME], 1, 5) == "group" then
                                    event_type = "adjective"
                                end
                                if kunit.values[TYPE] == 7 then
                                    event_type = "condition"
                                end
                            elseif event_type == nil then
                                if kunit.values[TYPE] == 1 then
                                    event_type = "verb"
                                end
                                if kunit.values[TYPE] == 2 or string.sub(kunit.strings[NAME], 1, 5) == "group" then
                                    event_type = "adjective"
                                end
                                if kunit.values[TYPE] == 7 then
                                    event_type = "condition"
                                end
                            end

                            --End handling \

                            --Number extension stuff, for GROUP and POWER

                            local number_ids = {}

                            eventname, number_ids = do_number_suffix(eventname, thex, they, tokenunitresult)

                            if notted then
                                if event_type == "condition" then
                                    notted = false
                                    if notcount % 2 == 0 then
                                        eventname = "not " .. eventname
                                    end
                                    notcount = 0
                                elseif event_type == "not" then
                                    notcount = notcount + 1
                                else
                                    done = true
                                    event_type = "NO!"
                                    notcount = 0
                                    table.remove(ids, #ids)
                                end
                            end


                            if event_type == "adjective" or event_type == "nounjective" then

                                table.insert(ids, {k})
                                table.insert(event_list, {applicable, {eventname, ""}, copied_conditions, ids})

                            elseif event_type == "condition" then

                                local targets, target_ids = find_event_targets(thex + 1, they, eventname, true, tokenunitresult)

                                if #targets > 0 then
                                    if eventname ~= "when" and eventname ~= "not when" then
                                        for a, b in ipairs(target_ids) do
                                            table.insert(ids, b)
                                        end
                                        table.insert(ids, {k})
                                        table.insert(conditions, {eventname, targets})
                                        table.insert(blockstack, {eventname, they})
                                    else

                                        --when code. warning: ETREMELY jank
                                        local worked = false
                                        for a, b in ipairs(targets) do
                                            local etype = event_text_types[b]
                                            if string.sub(b, 1, 5) == "group" or string.sub(b, 1, 5) == "power" then
                                                etype = "NO!" --See what i said about it being extremely jank?
                                            end
                                            if string.sub(b, 1, 7) == "powered" then
                                                etype = "prefix"
                                            end
                                            if etype == nil then
                                                local kunit = mmf.newObject(target_ids[a][1])
                                                etype = kunit.values[TYPE]
                                                if etype == 3 then
                                                    etype = "prefix"
                                                end
                                                if etype == 2 or string.sub(kunit.strings[NAME], 1, 5) == "group" then
                                                    etype = "adjective"
                                                end
                                                if etype == 1 then
                                                    etype = "verb"
                                                end
                                            end
                                            --timedmessage(b)
                                            if etype == "prefix" then
                                                worked = true
                                                table.insert(conditions, {eventname, {b}})
                                            elseif etype == "adjective" then
                                                worked = true
                                                table.insert(conditions, {"feeling", {b}})
                                            elseif etype == "verb" then
                                                local targets2, target2_ids = find_event_targets(thex + 2, they, eventname, false, tokenunitresult)

                                                if #targets > 0 then
                                                    for a, b in ipairs(target2_ids) do
                                                        table.insert(target_ids, b)
                                                    end
                                                    table.insert(conditions, {"that".. b, targets2 })
                                                    worked = true
                                                else
                                                    worked = false
                                                    break
                                                end

                                            end
                                        end
                                        if worked then
                                            for a, b in ipairs(target_ids) do
                                                table.insert(ids, b)
                                            end
                                            table.insert(ids, {k})
                                            table.insert(blockstack, {eventname, they})
                                            table.insert(done_lines, they)
                                        else
                                            done = true
                                        end

                                        --when code over
                                    end
                                else
                                    done = true
                                end
                            elseif event_type == "verb" then

                                local targets, target_ids = find_event_targets(thex + 1, they, eventname, false, tokenunitresult)

                                if #targets > 0 then
                                    for a, b in ipairs(target_ids) do
                                        table.insert(ids, b)
                                    end

                                    table.insert(ids, {k})
                                    table.insert(event_list, {applicable, {eventname, targets}, copied_conditions, ids})

                                else
                                    done = true
                                end

                            elseif event_type == "as" then

                                local targets, target_ids = find_event_targets(thex + 1, they, eventname, false, tokenunitresult)

                                if #targets > 0 then
                                    for a, b in ipairs(target_ids) do
                                        table.insert(ids, b)
                                    end
                                    table.insert(ids, {k})
                                    applicable = {}
                                    for i, zzzzz in ipairs(targets) do
                                        table.insert(applicable, zzzzz)
                                    end

                                    local copied_conditions = {}

                                    for i, q in ipairs(conditions) do
                                        table.insert(copied_conditions, q)
                                    end
                                    conditions = {}
                                    table.insert(blockstack, {eventname, they, copied_conditions})

                                else
                                    done = true
                                end

                            elseif event_type == "never" then
                                --Handle never. This will take forever

                                --Step 1: move forward
                                local targets, target_ids = find_event_targets(thex + 1, they, eventname, false, tokenunitresult)
                                local never_succeed = false
                                if #targets > 0 then
                                    for a, target in ipairs(targets) do
                                        if event_text_types[target] == "verb" then
                                            local target2s, target2_ids = find_event_targets(thex + 2, they, target, false, tokenunitresult)

                                            if #target2s > 0 then
                                                never_succeed = true
                                                for a, b in ipairs(target2_ids) do
                                                    table.insert(ids, b)
                                                end
                                                for b, target2 in ipairs(target2s) do
                                                    table.insert(event_list, {applicable, {target, {"not " .. target2}}, copied_conditions, ids})
                                                end
                                            else
                                                done = true
                                            end
                                        elseif event_text_types[target] == "adjective" then
                                            local target2s, target2_ids = find_events(thex + 1, they, "adjective",tokenunitresult)

                                            if #target2s > 0 then
                                                never_succeed = true
                                                for a, b in ipairs(target2_ids) do
                                                    table.insert(ids, {b})
                                                end
                                                for b, target2 in ipairs(target2s) do
                                                    table.insert(event_list, {applicable, {"not " .. target2, ""}, copied_conditions, ids})
                                                end
                                            else
                                                done = true
                                            end
                                        end

                                    end
                                else
                                    done = true
                                end
                                if never_succeed then
                                    table.insert(ids, {k})
                                    for a, b in ipairs(target_ids) do
                                        table.insert(ids, b)
                                    end
                                end

                            elseif event_type == "not" then
                                table.insert(ids, {k})
                                thex = thex + 1
                                notted = true
                            elseif event_type == "backslash" then
                                table.insert(ids, {k})
                                thex = thex + 1
                                isbackslashed = true
                                backslash = true
                            elseif event_type == "halt" then
                                --if there is an object that matches all conditions, add never to the   conditions
                                for i, j in ipairs(copied_conditions) do
                                    if j[1] == "when" then
                                        copied_conditions[i][1] = copied_conditions[i][2][1]
                                        copied_conditions[i][2] = {}
                                    end
                                    if j[1] == "not when" then
                                        copied_conditions[i][1] = "not " .. copied_conditions[i][2][1]
                                        copied_conditions[i][2] = {}
                                    end
                                end

                                table.insert(ids, {k})
                                for a, b in ipairs(applicable) do
                                    local exists = findall({b, copied_conditions}, true)
                                    if exists ~= nil and #exists > 0 then
                                        table.insert(conditions, 1, {"never", {}})
                                    end
                                end
                            elseif event_type == "if" then
                                local result, if_ids, work = do_if(thex, they)
                                if result then
                                    for a, b in ipairs(if_ids) do
                                        table.insert(ids, b)
                                    end
                                    if not work then
                                        table.insert(conditions, 1, {"never", {}})
                                        table.insert(blockstack, {"never", they})
                                    end
                                end
                            elseif event_type == "then" then
                                if #blockstack > 0 then
                                    table.insert(ids, {k})
                                    if blockstack[#blockstack][1] ~= "repeat" and blockstack[#blockstack][1] ~= "as" then
                                        table.remove(conditions, #conditions)
                                        table.remove(blockstack, #blockstack)
                                    elseif blockstack[#blockstack][1] ~= "repeat" then
                                        applicable = {}
                                        for i, zzzzz in ipairs(backup_applicable)do
                                            table.insert(applicable, zzzzz)
                                        end
                                        table.remove(blockstack, #blockstack)
                                    else

                                        if blockstack[#blockstack][2] > 1 then
                                            blockstack[#blockstack][2] = blockstack[#blockstack][2] - 1
                                            they = blockstack[#blockstack][3]
                                        else
                                            table.remove(blockstack, #blockstack)
                                        end
                                    end

                                else
                                    done = true
                                end
                            elseif event_type == "loop" then
                                local targets, target_ids = find_event_targets(thex + 1, they, eventname, false, tokenunitresult)

                                if #targets > 0 then
                                    for a, b in ipairs(target_ids) do
                                        table.insert(ids, b)
                                    end
                                    table.insert(ids, {k})

                                    -- i dont feel like handling threads with repeat AND i dont feel like code skipping, so
                                    if tonumber(targets[1]) ~= 0 then
                                        table.insert(blockstack, {eventname, tonumber(targets[1]), they})
                                    else
                                        table.insert(conditions, {"never", {}})
                                        table.insert(blockstack, {eventname, they})
                                    end

                                    id_mark = {#ids, #event_list}
                                else
                                    done = true
                                end

                            elseif string.sub(eventname, 1, 4) == "var_" then
                                --There are 2 ways this can parse.

                                --x = x + 1
                                --x + = 1
                                for zi, zj in ipairs(applicable) do
                                    if #findall({zj, conditions}, true) > 0 then
                                        do_math_events(thex, they)
                                    end
                                end

                            else
                                done = true
                            end

                            if not done and #number_ids > 0 then

                                for a, b in ipairs(number_ids) do
                                    table.insert(ids, {b})
                                end
                            end


                        else
                            --[[
                            done = true
                            local amount_to_run = #blockstack + 0
                            for ____ = 1, amount_to_run do
                                    if blockstack[#blockstack][1] ~= "repeat" then
                                        table.remove(blockstack, #blockstack)
                                        table.remove(conditions, #conditions)
                                    else
                                        if blockstack[#blockstack][2] > 1 then
                                            blockstack[#blockstack][2] = blockstack[#blockstack][2] - 1
                                            they = blockstack[#blockstack][3]
                                            done = false
                                            break
                                        else
                                            table.remove(blockstack, #blockstack)
                                        end
                                    end
                            end


                            if notted then
                                    notcount = 0
                                    notted = false
                                    table.remove(ids, #ids)
                            end
                            --]]



                        end

                    end

                    if not tilevalid then
                        done = true
                        local amount_to_run = #blockstack + 0
                        for ____ = 1, amount_to_run do
                            if blockstack[#blockstack][1] ~= "repeat" and blockstack[#blockstack][1] ~= "as" then
                                table.remove(conditions, #conditions)
                                table.remove(blockstack, #blockstack)
                            elseif blockstack[#blockstack][1] ~= "repeat" then
                                applicable = {}
                                for i, zzzzz in ipairs(backup_applicable)do
                                    table.insert(applicable, zzzzz)
                                end
                                table.remove(blockstack, #blockstack)
                            else
                                if blockstack[#blockstack][2] > 1 then
                                    blockstack[#blockstack][2] = blockstack[#blockstack][2] - 1
                                    they = blockstack[#blockstack][3]
                                    done = false
                                    break
                                else
                                    table.remove(blockstack, #blockstack)
                                end
                            end
                        end


                        if notted then
                            notcount = 0
                            notted = false
                            table.remove(ids, #ids)
                        end
                    end


                else --nothing to parse anymore!
                    done = true
                    if notted then
                        notcount = 0
                        notted = false
                        table.remove(ids, #ids)
                    end

                    --run "Then" for each block still on the blockstack.
                    local amount_to_run = #blockstack + 0
                    for ____ = 1, amount_to_run do
                        if blockstack[#blockstack][1] ~= "repeat" and blockstack[#blockstack][1] ~= "as" then
                            table.remove(conditions, #conditions)
                            table.remove(blockstack, #blockstack)
                        elseif blockstack[#blockstack][1] ~= "repeat" then
                            applicable = {}
                            for i, zzzzz in ipairs(backup_applicable)do
                                table.insert(applicable, zzzzz)
                            end
                            table.remove(blockstack, #blockstack)
                        else
                            if blockstack[#blockstack][2] > 1 then
                                blockstack[#blockstack][2] = blockstack[#blockstack][2] - 1
                                they = blockstack[#blockstack][3]
                                done = false
                                break
                            else
                                table.remove(blockstack, #blockstack)
                            end
                        end
                    end
                end



                if not isbackslashed and not notted then
                    they = they + 1
                    thex = x
                    backslash = false
                end


            end

        end

    end


    for i, w in ipairs(event_list) do

        local nouns = w[1]
        local verb = w[2]
        local conds = w[3]
        local ids = w[4]

        --Replace all "X WHEN Y" conditions with "Y X" prefixes
        for i, j in ipairs(conds) do
            if j[1] == "when" then
                conds[i][1] = conds[i][2][1]
                conds[i][2] = {}
            end
            if j[1] == "not when" then
                conds[i][1] = "not " .. conds[i][2][1]
                conds[i][2] = {}
            end
        end

        for i, j in ipairs(nouns) do
            --WE DID IT
            if verb[2] == "" then
                if string.sub(verb[1], 1, 4) ~= "not " then
                    addoption({j, "is", verb[1]},conds,ids, true,nil,{"eventrule"})
                else
                    if never_opposites[verb[1]] ~= nil then
                        addoption({ j, "is", never_opposites[verb[1]] }, conds, ids, true,nil, { "eventrule" })
                    else
                        addoption({ j, "is", verb[1] }, conds, ids, true,nil, { "eventrule" })
                    end
                end
            else

                for i, k in ipairs(verb[2]) do
                    if verb[1] == "have" then
                        verb[1] = "has"
                    end

                    if verb[1] == "move" then
                        if string.sub(k, 1, 4) ~= "not " then
                            if k ~= "forward" then
                                addoption({ j, "is", "nudge" .. k }, conds, ids, true, nil, { "eventrule" })
                            else
                                addoption({ j, "is", "auto" }, conds, ids, true, nil, { "eventrule" })
                            end
                        else
                            addoption({ j, "is", "locked" .. string.sub(k, 5) }, conds, ids, true, nil, { "eventrule" })
                        end
                    elseif verb[1] == "turn" then
                        if k ~= "aroundleft" and k ~= "aroundright" then
                            addoption({ j, "is", k }, conds, ids, true, nil, { "eventrule" })
                        else
                            if k == "aroundleft" then
                                addoption({ j, "is", "turn" }, conds, ids, true, nil, { "eventrule" })
                            else
                                addoption({ j, "is", "deturn" }, conds, ids, true, nil, { "eventrule" })
                            end
                        end
                    elseif verb[1] == "be" then
                        addoption({ j, "is", k }, conds, ids, true, nil, { "eventrule" })
                    else
                        if string.sub(k, 1, 4) ~= "not " then
                            addoption({ j, verb[1], k }, conds, ids, true, nil, { "eventrule" })
                        end
                    end
                end

            end
        end

    end

    return (#event_list > 0)

end

function find_events(x, y, type, havenot, tokenunitresult)

    local the_ids, the_targets = {}, {}

    local hasbackslash = false
    local backslashid = nil

    for i, k in ipairs(findallhere(x, y)) do

        local kunit = mmf.newObject(k)
        local name = getname(kunit, true)

        if string.sub(name, 1, 6) == "event_" or (tokenunitresult[k]) then
            local realname = get_ref(name)


            if realname == "backslash" then
                backslashid = k
                hasbackslash = true
            end

            local event_type = event_text_types[realname]
            if event_type == nil then
                if kunit.values[TYPE] == 0 then
                    event_type = "noun"
                end
                if kunit.values[TYPE] == 2 then
                    event_type = "adjective"
                end
                if kunit.values[TYPE] == 4 then
                    event_type = "not"
                end
            end

            if event_type == type or type == nil or (type == "noun" and (string.sub(realname, 1, 6) == "event_" or string.sub(realname, 1, 5) == "text_")) or (event_text_types[realname] == "nounjective" and (type == "noun" or type == "adjective")) then

                local realername, num_ids = do_number_suffix(realname, x, y, tokenunitresult)
                for ya, yb in ipairs(num_ids) do
                    table.insert(the_ids, yb)
                end

                table.insert(the_targets, realername)
                table.insert(the_ids, k)
            end

            if event_type == "not" and havenot then
                local re_targets, re_ids = find_events(x + 1, y, type, true, tokenunitresult)
                if #re_targets > 0 then

                    for a, b in ipairs(re_targets) do


                        local bname, num_ids = do_number_suffix(b, x, y, tokenunitresult)
                        for ya, yb in ipairs(num_ids) do
                            table.insert(the_ids, yb)
                        end



                        if string.sub(b, 1, 4) == "not " then
                            table.insert(the_targets, string.sub(bname, 5))
                        else
                            table.insert(the_targets, "not " .. bname)
                        end
                    end
                    for a, b in ipairs(re_ids) do
                        table.insert(the_ids, b)
                    end
                    table.insert(the_ids, k)
                end
            end

        end

    end

    if hasbackslash then
        for i, k in ipairs(findallhere(x + 1, y)) do

            local kunit = mmf.newObject(k)
            local name = getname(kunit, true)

            if string.sub(name, 1, 5) == "text_" then

                local realname = string.sub(name, 6)

                local event_type = event_text_types[realname]
                if event_type == nil then
                    if kunit.values[TYPE] == 0 then
                        event_type = "noun"
                    end
                    if kunit.values[TYPE] == 2 then
                        event_type = "adjective"
                    end
                    if kunit.values[TYPE] == 4 then
                        event_type = "not"
                    end
                end
                if event_type == type or type == nil then

                    table.insert(the_targets, realname)
                    table.insert(the_ids, k)
                    table.insert(the_ids, backslashid)
                end

                if event_type == "not" and havenot then
                    local re_targets, re_ids = find_events(x + 2, y, type, true, tokenunitresult)
                    if #re_targets > 0 then
                        for a, b in ipairs(re_targets) do
                            if string.sub(b, 1, 4) == "not " then
                                table.insert(the_targets, string.sub(b, 5))
                            else
                                table.insert(the_targets, "not " .. b)
                            end
                        end
                        for a, b in ipairs(re_ids) do
                            table.insert(the_ids, b)
                        end
                        table.insert(the_ids, k)
                        table.insert(the_ids, backslashid)
                    end
                end

            end

        end
    end



    return the_targets, the_ids
end

function do_number_suffix(name_, thx, thy, tokenunitresult)
    local bname = name_
    local _ids = {}
    for za, zb in ipairs(number_extensions) do
        if bname == zb then
            local lim = 4
            local fx = thx

            while lim > 0 do
                fx = fx + 1
                local target2s, target2_ids = find_event_targets(fx, thy, "repeat", false, tokenunitresult)

                if #target2s > 0 then
                    for ya, yb in ipairs(target2_ids) do
                        table.insert(_ids, yb[1])
                    end

                    bname = bname .. target2s[1]

                else
                    break
                end

                lim = lim - 1
            end
        end
    end

    return bname, _ids
end

function find_event_targets(x, y, eventname, havenot_, tokenunitresult)

    local havenot = havenot_ or false

    local targets = {}
    local target_ids = {}

    local isbackslashed = false
    local backslashid = nil

    for i, m in ipairs(findallhere(x, y)) do
        local munit = mmf.newObject(m)
        local name = getname(munit, true)


        if string.sub(name, 1, 6) == "event_" or (tokenunitresult[m]) then
            local realname = get_ref(name)

            local event_type = event_text_types[realname]
            if event_type == nil then
                if munit.values[TYPE] == 0 then
                    event_type = "noun"
                end
                if munit.values[TYPE] == 1 then
                    event_type = "verb"
                end
                if munit.values[TYPE] == 2 then
                    event_type = "adjective"
                end
                if munit.values[TYPE] == 3 then
                    event_type = "prefix"
                end
            end

            local valid = false

            if verb_allowed_types[eventname] ~= nil then
                for a, b in ipairs(verb_allowed_types[eventname]) do

                    if b == event_type or ((event_type == "noun" or event_type == "adjective") and b == "nounjective") then
                        valid = true
                    end

                end
            else
                if event_type == "noun" or event_text_types[realname] == "nounjective" then
                    valid = true
                end
            end

            if event_type == "not" and havenot_ then
                local re_targets, re_ids = find_event_targets(x + 1, y, eventname, true, tokenunitresult)
                if #re_targets > 0 then

                    for a, b in ipairs(re_targets) do
                        if string.sub(b, 1, 4) == "not " then
                            table.insert(targets, string.sub(b, 5))
                        else
                            table.insert(targets, "not " .. b)
                        end
                    end

                    for a, b in ipairs(re_ids) do
                        table.insert(target_ids, b)
                    end

                    table.insert(target_ids, {m})
                end
            end

            if event_text_types[realname] == "backslash" then
                isbackslashed = true
                backslashid = m
            end


            if valid then
                for a, b in ipairs(number_extensions) do
                    if realname == b then
                        local target2s, target2_ids = find_event_targets(x + 1, y, "repeat", false, tokenunitresult)
                        if #target2s > 0 then
                            for a, b in ipairs(target2_ids) do
                                table.insert(target_ids, b)
                            end
                            realname = realname .. target2s[1]
                        end
                    end
                end

                table.insert(target_ids, {m})
                table.insert(targets, realname)
            end

        end
    end

    if isbackslashed then
        for i, m in ipairs(findallhere(x + 1, y)) do
            local munit = mmf.newObject(m)
            local name = getname(munit)

            if string.sub(name, 1, 5) == "text_" then

                local realname = string.sub(name, 6)

                local event_type = event_text_types[realname]
                if event_type == nil then
                    if munit.values[TYPE] == 0 then
                        event_type = "noun"
                    end
                    if munit.values[TYPE] == 1 then
                        event_type = "verb"
                    end
                    if munit.values[TYPE] == 2 then
                        event_type = "adjective"
                    end
                    if munit.values[TYPE] == 3 then
                        event_type = "prefix"
                    end
                end


                local valid = false

                if verb_allowed_types[eventname] ~= nil then
                    for a, b in ipairs(verb_allowed_types[eventname]) do

                        if b == event_type or ((event_type == "noun" or event_type == "adjective") and b == "nounjective") then
                            valid = true
                        end

                    end
                else
                    if event_type == "noun" or event_type == "nounjective" then
                        valid = true
                    end
                end

                if event_text_types[realname] == "not" then
                    local re_targets, re_ids = find_event_targets(x + 1, y, eventname, true, tokenunitresult)
                    if #re_targets > 0 then

                        for a, b in ipairs(re_targets) do
                            if string.sub(b, 1, 4) == "not " then
                                table.insert(targets, string.sub(b, 5))
                            else
                                table.insert(targets, "not " .. b)
                            end
                        end

                        for a, b in ipairs(re_ids) do
                            table.insert(target_ids, b)
                        end

                        table.insert(target_ids, {m})
                    end
                end


                if valid then
                    table.insert(target_ids, {m})
                    table.insert(targets, realname)
                    table.insert(target_ids, {backslashid})
                end

            end
        end
    end
    if #targets > 0 and havenot == "anded" then
        for zx, zy in ipairs(find_event_targets(x + 1, y, eventname, "anded", tokenunitresult)) do
            table.insert(targets, zy)
        end
    end
    return targets, target_ids
end

function checkbreakchanges(unitid,unitname)
    if (#(breakunits or {}) > 0) then
        for i,v in ipairs(breakunits) do
            if (v[1] == unitid) then
                updatecode = 1
                return
            end
        end
    end

    if (#(breakrelatedunits or {}) > 0) then
        for i,v in ipairs(breakrelatedunits) do
            if (v[1] == unitid) then
                updatecode = 1
                return
            end
        end
    end
end

function findtokenunits()
    local result = {}
    local checkrecursion = {}
    local related = {}

    local identifier = ""
    local fullid = {}

    if (featureindex["token"] ~= nil) then
        for i, v in ipairs(featureindex["token"]) do
            local rule = v[1]
            local conds = v[2]
            local ids = v[3]
            local tags = v[4]

            local name = rule[1]
            local subid = ""

            if (rule[2] == "is") then
                if (fullunitlist[name] ~= nil) and (name ~= "event") and (string.sub(name, 1, 6) ~= "event_") then
                    local these = findall({ name })

                    if (#these > 0) then
                        for a, b in ipairs(these) do
                            local bunit = mmf.newObject(b)
                            local unitname = ""

                            local valid = true

                            if (featureindex["broken"] ~= nil) then
                                if (hasfeature(getname(bunit), "is", "broken", b, bunit.values[XPOS], bunit.values[YPOS]) ~= nil) then
                                    valid = false
                                end
                            end

                            if valid then
                                table.insert(result, { b, conds })
                                subid = subid .. unitname
                                -- LISÄÄ TÄHÄN LISÄÄ DATAA
                            end
                        end
                    end
                end

                if (#subid > 0) then
                    for a, b in ipairs(conds) do
                        local condtype = b[1]
                        local params = b[2] or {}

                        subid = subid .. condtype

                        if (#params > 0) then
                            for c, d in ipairs(params) do
                                subid = subid .. tostring(d)

                                related = findunits(d, related, conds)
                            end
                        end
                    end
                end

                table.insert(fullid, subid)

                --MF_alert("Going through " .. name)

                if (#ids > 0) then
                    if (#ids[1] == 1) then
                        local firstunit = mmf.newObject(ids[1][1])

                        local notname = name
                        if (string.sub(name, 1, 4) == "not ") then
                            notname = string.sub(name, 5)
                        end

                        for _, v in ipairs(tags) do
                            if v == "eventrule" then
                                if (firstunit.strings[UNITNAME] ~= "event_" .. name) and (firstunit.strings[UNITNAME] ~= "event_" .. notname) then
                                    --MF_alert("Checking recursion for " .. name)
                                    table.insert(checkrecursion, { name, i })
                                end
                                break
                            end
                        end
                    end
                else
                    MF_alert(
                    "No ids listed in Word-related rule! rules.lua line 1302 - this needs fixing asap (related to grouprules line 1118)")
                end
            end
        end

        table.sort(fullid)
        for i, v in ipairs(fullid) do
            -- MF_alert("Adding " .. v .. " to id")
            identifier = identifier .. v
        end

        --MF_alert("Identifier: " .. identifier)

        for a, checkname_ in ipairs(checkrecursion) do
            local found = false

            local checkname = checkname_[1]

            local b = checkname
            if (string.sub(b, 1, 4) == "not ") then
                b = string.sub(checkname, 5)
            end

            for i, v in ipairs(featureindex["token"]) do
                local rule = v[1]
                local ids = v[3]
                local tags = v[4]

                -- Gotta change this to prevent some false infinite loops
                if can_refer(rule[1], b) then
                    for c, g in ipairs(ids) do
                        for a, d in ipairs(g) do
                            local idunit = mmf.newObject(d)

                            -- Tässä pitäisi testata myös Group!
                            if (idunit.strings[UNITNAME] == "evnet_" .. rule[1]) or ((idunit.strings[UNITNAME] == "glyph_" .. rule[1]) and (tags[1] == "glyphrule")) or ((idunit.strings[UNITNAME] == rule[1]) and (tags[1] == "glyphrule")) or ((rule[1] == "all") and (rule[1] ~= "glyph")) then
                                --MF_alert("Matching objects - found")
                                found = true
                            elseif (string.sub(rule[1], 1, 5) == "group") then
                                --MF_alert("Group - found")
                                found = true
                            elseif (rule[1] ~= checkname) and (((string.sub(rule[1], 1, 4) == "not ") and (rule[1] ~= "glyph")) or ((rule[1] == "not all") and (rule[1] == "glyph"))) then
                                --MF_alert("Not Object - found")
                                found = true
                            end
                        end
                    end

                    for c, g in ipairs(tags) do
                        if (g == "mimic") then
                            found = true
                        end
                    end
                end
            end

            if (found == false) then
                --MF_alert("Wordunit status for " .. b .. " is unstable!")
                identifier = "null"
                tokenunits = {}

                for i, v in pairs(featureindex["token"]) do
                    local rule = v[1]
                    local ids = v[3]

                    --MF_alert("Checking to disable: " .. rule[1] .. " " .. ", not " .. b)

                    if (rule[1] == b) or (rule[1] == "not " .. b) then
                        v[2] = { { "never", {} } }
                    end
                end

                if (string.sub(checkname, 1, 4) == "not ") then
                    local notrules_word = notfeatures["token"]
                    local notrules_id = checkname_[2]
                    local disablethese = notrules_word[notrules_id]

                    for i, v in ipairs(disablethese) do
                        v[2] = { { "never", {} } }
                    end
                end
            end
        end
    end

    --MF_alert("Current id (end): " .. identifier)

    return result, identifier, related
end
