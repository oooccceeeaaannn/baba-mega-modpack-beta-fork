function destroylevel_do()
    if et_ignoreinfloop then
        return
    end
    if (generaldata.values[MODE] ~= 5) and destroylevel_check then
        MF_musicstate(1)
        generaldata2.values[NOPLAYER] = 1

        local should_reparse_rules = false

        destroylevel_check = false
        local special = destroylevel_style or ""
        destroylevel_style = ""

        local dellist = {}
        for i,unit in ipairs(units) do
            table.insert(dellist, unit.fixed)
        end

        if (#dellist > 0) then
            for i,unitid in ipairs(dellist) do
                local unit = mmf.newObject(unitid)
                local c1,c2 = getcolour(unitid)
                local pmult,sound = checkeffecthistory("destroylevel")

                if (special ~= "infinity") and (special ~= "empty") and (special ~= "bonus") then
                    MF_particles("bling",unit.values[XPOS],unit.values[YPOS],10 * pmult,c1,c2,1,1)
                elseif (special == "bonus") then
                    MF_particles("win",unit.values[XPOS],unit.values[YPOS],10 * pmult,4,1,1,1)
                end

                local name = getname(unit)
                if ((special ~= "infinity") or (hasfeature(name,"is","eternal",unitid,x,y) == nil))
                        and ((special == "infinity") or (hasfeature(name,"is","secure",unitid,x,y) == nil)) then
                    delete(unitid,nil,nil,true)
                else
                    should_reparse_rules = true
                    updatecode = 1
                end
            end
        end

        if (special == "infinity") then
            if (HACK_INFINITY >= 200) then
                writetext(langtext("ingame_infiniteloop"),0,screenw * 0.5 - 12,screenh * 0.5 + 60,0,true,3,true,{4,1},3)
                HACK_INFINITY = 0

                MF_playsound("infinity")

                local isignid = MF_specialcreate("Special_infinity")
                local isign = mmf.newObject(isignid)

                isign.x = screenw * 0.5
                isign.y = screenh * 0.5 - 36
                isign.layer = 2
                MF_setcolour(isignid,4,1)
            end
        elseif (special == "toocomplex") then
            writetext(langtext("ingame_toocomplex"),0,screenw * 0.5 - 12,screenh * 0.5,0,true,3,true,{4,1},3)
            HACK_INFINITY = 0

            MF_playsound("infinity")
        elseif (special == "bonus") then
            MF_playsound("bonus")
        end

        if not should_reparse_rules then
            MF_removeblockeffect(0)
            updatecode = 1
            features = {}
            featureindex = {}
            visualfeatures = {}
            notfeatures = {}
        else
            et_ignoreinfloop = true
            code()
            et_ignoreinfloop = false
        end
        collectgarbage()
    elseif (generaldata.values[MODE] == 5) then
        timedmessage("Destroylevel() called from editor. Report this!")
    end
end
