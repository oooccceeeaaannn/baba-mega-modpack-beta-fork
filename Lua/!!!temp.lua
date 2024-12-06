function destroylevel_do()
    if (generaldata.values[MODE] ~= 5) and destroylevel_check then
        MF_musicstate(1)
        generaldata2.values[NOPLAYER] = 1

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

                delete(unitid,nil,nil,true)
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
        elseif (special == "custom") then
            if destroy_message == nil then
                destroy_message = "wait what"
            end
            writetext(destroy_message,0,screenw * 0.5 - string.len(destroy_message) + 15,screenh * 0.5,0,true,3,true,{4,1},3)
            HACK_INFINITY = 0

            MF_playsound("infinity")
        elseif (special == "bonus") then
            MF_playsound("bonus")
        end

        MF_removeblockeffect(0)
        updatecode = 1
        features = {}
        featureindex = {}
        visualfeatures = {}
        notfeatures = {}
        collectgarbage()
    elseif (generaldata.values[MODE] == 5) then
        timedmessage("Destroylevel() called from editor. Report this!")
    end
end

function destroylevel(special_, message)
    destroylevel_check = true
    destroylevel_style = special_ or ""
    destroy_message = ""

    if (destroylevel_style == "infinity") or (destroylevel_style == "toocomplex") or (destroylevel_style == "custom") then
        setsoundname("removal",2)
        destroy_message = message or "I ran out of ideas"
    elseif (destroylevel_style ~= "empty") and (destroylevel_style ~= "bonus") then
        setsoundname("removal",1)
    end

    MF_musicstate(1)
    generaldata2.values[NOPLAYER] = 1
end

local dir_props = {"youup","youdown","youleft","youright","you2up","you2down","you2left","you2right","pushup","pushdown","pushleft","pushright","pullup","pulldown","pullleft","pullright","moreup","moredown","moreleft","moreright","stopup","stopdown","stopleft","stopright","shiftup","shiftdown","shiftleft","shiftright","swapup","swapdown","swapleft","swapright"}

local CRASHING_MESSAGES = { -- [lua pattern] = [message]

    on_appearance = {
        -- other parsers
        ["^glyph_"] = "TOO HARD TO PARSE!",
        ["^node_"] = "TOO HARD TO PARSE!",
        ["^event_"] = "TOO HARD TO PARSE!",
        ["^logic_"] = "TOO HARD TO PARSE!",
        ["^text_text_$"] = "TOO META!",
        ["^text_glyph_$"] = "TOO META!",
        ["^text_node_$"] = "TOO META!",
        ["^text_event_$"] = "TOO META!",
        ["^text_logic_$"] = "TOO META!",

        --nuhuh mod
        ["^text_nuhuh"] = "TOO NEGATIVE!",
        ["^text_turning_nuhuh$"] = "TOO NEGATIVE!",
    },

    on_parsing = {
        -- plasma
        ["branching_"] = "TOO MUCH PARSING JANK!",
        ["pivot_"] = "TOO MUCH PARSING JANK!",
    },

    in_rules = {

        -- other parsers
        ["^glyph_"] = "TOO HARD TO PARSE!",
        ["^node_"] = "TOO HARD TO PARSE!",
        ["^event_"] = "TOO HARD TO PARSE!",
        ["^logic_"] = "TOO HARD TO PARSE!",

        ["^glyph$"] = "TOO HARD TO PARSE!",
        ["^node$"] = "TOO HARD TO PARSE!",
        ["^event$"] = "TOO HARD TO PARSE!",
        ["^logic$"] = "TOO HARD TO PARSE!",

        ["^symbol$"] = "TOO HARD TO PARSE!",
        ["^log$"] = "TOO HARD TO PARSE!",
        ["^imprint$"] = "TOO HARD TO PARSE!",
        ["^scribble$"] = "TOO HARD TO PARSE!",
        ["^log$"] = "TOO HARD TO PARSE!",

        ["^text_"] = "TOO META!",
        ["^glyph_"] = "TOO META!",
        ["^node_"] = "TOO META!",
        ["^event_"] = "TOO META!",
        ["^logic_"] = "TOO META!",
        ["^meta"] = "TOO META!",
        ["^unmeta$"] = "TOO UNMETA!",
        ["^mega$"] = "TOO META!",
        ["^meea$"] = "TOO META!",
        ["^mena$"] = "TOO META!",
        ["^mela$"] = "TOO META!",
        ["^unmega$"] = "TOO UNMETA!",
        ["^unmeea$"] = "TOO UNMETA!",
        ["^unmena$"] = "TOO UNMETA!",
        ["^unmela$"] = "TOO UNMETA!",


        ["^this$"] = "TOO HARD TO IMPLEMENT!",
        ["^that$"] = "TOO HARD TO IMPLEMENT!",
        ["^these$"] = "TOO HARD TO IMPLEMENT!",
        ["^those$"] = "TOO HARD TO IMPLEMENT!",
        ["^stable$"] = "TOO HARD TO IMPLEMENT!",

        ["turning_"] = "TOO DIZZY!",
        --[[
        ["^you$"] = "TOO DIZZY!",
        ["^you2$"] = "TOO DIZZY!",
        ["^push$"] = "TOO DIZZY!",
        ["^pull$"] = "TOO DIZZY!",
        ["^more$"] = "TOO DIZZY!",
        ["^stop$"] = "TOO DIZZY!",
        ["^shift$"] = "TOO DIZZY!",
        ["^swap$"] = "TOO DIZZY!",

        ["^up$"] = "TOO DIZZY!",
        ["^down$"] = "TOO DIZZY!",
        ["^left$"] = "TOO DIZZY!",
        ["^right$"] = "TOO DIZZY!",
        --]]

        ["^cut$"] = "TOO MANY POSSIBLE WORDS!",
        ["^pack$"] = "TOO COMPACT!",
        ["^guard$"] = "TOO INNOCENT!",

        ["^uhh$"] = "TOO!",
        ["^hmm$"] = "TOO!",
        ["^ellipsis$"] = "TOO!",
        ["^so$"] = "TOO!",
        ["^actually$"] = "TOO!",
        ["^really$"] = "TOO!",
        ["^well$"] = "TOO!",
        ["^oh$"] = "TOO!",
        ["^ok$"] = "TOO!",
        ["^yknow$"] = "TOO!",
        ["^like$"] = "TOO!",
        ["^just$"] = "TOO!",
        ["^mmm$"] = "TOO!",
        ["^ah$"] = "TOO!",

        -- patashu
        ["^slip$"] = "TOO SLIPPY!",
        ["^slide$"] = "TOO TOO SLIPPY!",

        ["^stops$"] = "TOO BIASED!",
        ["^pushes$"] = "TOO BIASED!",
        ["^pulls$"] = "TOO BIASED!",
        ["^sinks$"] = "TOO BIASED!",
        ["^defeats$"] = "TOO BIASED!",
        ["^opens$"] = "TOO BIASED!",
        ["^shifts$"] = "TOO BIASED!",
        ["^swaps$"] = "TOO BIASED!",
        ["^melts$"] = "TOO BIASED!",
        ["^hates$"] = "TOO BIASED!",
        ["^likes$"] = "TOO BIASED!",

        ["^lazy$"] = "TOO MUCH MOVEMENT JANK!",
        ["^oneway$"] = "TOO MUCH MOVEMENT JANK!",
        ["^copy$"] = "TOO MUCH MOVEMENT JANK!",
        ["^topple$"] = "TOO MUCH MOVEMENT JANK!",
        ["^launch$"] = "TOO MUCH MOVEMENT JANK!",
        ["^sticky$"] = "TOO MUCH MOVEMENT JANK!",

        ["^sidekick$"] = "TOO SIDEWAYS!",
        ["^moonwalk$"] = "TOO SIMILAR TO REVERSE!",

        ["^zoom$"] = "TOO FAST!",
        ["^yeet$"] = "TOO FAST!",

        ["^drunk$"] = "TOO ILLEGAL!",
        ["^drunker$"] = "TOO ILLEGAL!",

        ["^print$"] = "TOO MUCH TEXT!",
        ["^scrawl$"] = "TOO MUCH TEXT!",

        ["^noundo$"] = "TOO MUCH UNDO JANK!",
        ["^reset$"] = "TOO UNFORGIVING FOR MISTAKES!",
        ["^noreset$"] = "TOO UNFORGIVING FOR MISTAKES!",

        -- persistence
        ["^persist$"] = "TOO MUCH SMUGGLING!",
        ["^baserule$"] = "TOO MUCH SMUGGLING!",

        -- past
        ["^past$"] = "TOO NOSTALGIC!",

        -- Stringwords
        ["^starts$"] = "TOO MUCH SPLITTING!",
        ["^contain$"] = "TOO MUCH SPLITTING!",
        ["^ends$"] = "TOO MUCH SPLITTING!",

        -- trash mod
        ["^trash$"] = "TOO MUCH GARBAGE!",
        ["^waste$"] = "TOO MUCH GARBAGE!",
        ["^build$"] = "TOO MUCH GARBAGE!",
        ["^sensing$"] = "TOO MUCH GARBAGE!",

        -- extrem's mod
        -- crash is pardoned for already causing a level destruction
        ["^eternal$"] = "TOO OVERPOWERED!",
        ["^secure$"] = "TOO OVERPOWERED!",

        ["^future$"] = "TOO FUTURISTIC!",
        ["^pastprop$"] = "TOO NOSTALGIC!",
        ["^present$"] = "TOO UNINTERESTING!",

        ["^keep$"] = "TOO MUCH SMUGGLING!",
        ["^reload$"] = "TOO UNFORGIVING FOR MISTAKES!",
        ["^return$"] = "TOO UNFORGIVING FOR MISTAKES!",

        ["^spin"] = "TOO DIZZY!",
        ["^despin"] = "TOO DIZZY!",

        ["^act$"] = "TOO FAKE!",
        ["^perform$"] = "TOO FAKE!",

        ["^virus$"] = "TOO MUCH BIOHAZARD!",
        --infect is pardoned for having to pair with virus

        ["^you%+$"] = "TOO LONG MOVEMENT!",
        ["^puppet$"] = "TOO SCARY!",

        ["^volt$"] = "TOO MUCH ELECTRICITY!",

        ["^refers$"] = "TOO MUCH REFERENCE!",

        ["^one$"] = "TOO MUCH NUMBERS!",
        ["^two$"] = "TOO MUCH NUMBERS!",
        ["^three$"] = "TOO MUCH NUMBERS!",
        ["^four$"] = "TOO MUCH NUMBERS!",
        ["^five$"] = "TOO MUCH NUMBERS!",
        ["^equal$"] = "TOO MUCH CARDINALS!",
        ["^lessthan$"] = "TOO MUCH CARDINALS!",
        ["^greaterthan$"] = "TOO MUCH CARDINALS!",

        ["^power%?$"] = "TOO AMBIGUOUS!",
        ["^powered%?$"] = "TOO AMBIGUOUS!",

        ["^original$"] = "TOO MUCH ORIGINALITY!",

        ["^triggered$"] = "TOO BUTTON-LIKE!",

        ["^leveled$"] = "TOO MUCH LEVELING!",

        ["^cancel$"] = "TOO IMPOSSIBLE!",

        ["^watch"] = "TOO MUCH VISION!",

        ["^toxic$"] = "TOO MUCH CHEMICAL!",
        ["^alkali$"] = "TOO MUCH CHEMICAL!",

        ["^as$"] = "TOO MANY IDENTITIES!",

        ["^hidden$"] = "TOO SPECIFIED FEELING!",
        ["^petted$"] = "TOO SPECIFIED FEELING!",
        ["^static$"] = "TOO SPECIFIED FEELING!",
        ["^sleepy$"] = "TOO SPECIFIED FEELING!",
        ["^shiny$"] = "TOO SPECIFIED FEELING!",
        ["^curious$"] = "TOO SPECIFIED FEELING!",

        --cardinaility
        ["^north$"] = "TOO MUCH CARDINALS!",
        ["^south$"] = "TOO MUCH CARDINALS!",
        ["^east$"] = "TOO MUCH CARDINALS!",
        ["^west$"] = "TOO MUCH CARDINALS!",

        --delete prop
        ["^delete$"] = "TOO DESTRUCTIVE!",

        --glitch mod
        ["^glitch$"] = "TOO GLICHY!",

        --local mod
        ["^local"] = "TOO MUCH NEIGHBOURHOOD!",
        ["^router"] = "TOO MUCH INTERNET!",
        ["^channel"] = "TOO MUCH INTERNET!",
        --offline is pardoned for having to pair with router

        --offset
        ["^offset"] = "TOO OFF!",

        --shruggy
        ["^throw$"] = "TOO MUCH FORCE!",
        ["^unstack$"] = "TOO LITTLE HEIGHT!",

        --visit
        ["^visit$"] = "TOO PUBLICLY VISITED!",

        --word salad

        ["^ambient$"] = "TOO MANY BOXES!",
        ["^alive$"] = 'TOO PARALYZED!',
        ["^vessel"] = "TOO SOULLESS!",
        ["^hop$"] = "TOO MUCH HOPPING!",
        ["^hops$"] = "TOO MUCH HOPPING!",
        ["^karma$"] = "TOO MUCH SIN!",
        ["^sinful$"] = "TOO MUCH COS * TAN!",
        ["^repent$"] = "TOO UNFAIR!",
        ["^echo$"] = "TOO MUCH PARSING JANK!",
        ["^enter$"] = "TOO MANY NEW LINES!",
        ["^vehicle$"] = "TOO MANY CARS!",
        ["^boost$"] = "TOO MUCH BOOST!",
        ["^boosts$"] = "TOO MUCH BOOST!",
        ["^aligned"] = "TOO MUCH ALIGNMENT!",
        ["^morph$"] = "TOO MUCH TRANSFORMATION!",
        ["^trap$"] = "TOO ILLEGAL!",
        ["^traps$"] = "TOO ILLEGAL!",
        ["^else$"] = "TOO LUA-KEYWORDED!",
        ["^perfect$"] = "TOO IMPOSSIBLE!",
        ["^missing$"] = "TOO UNFOUND!",
        ["^bungee$"] = "TOO DANGEROUS!",
        ["^rescue$"] = "TOO UNBOUNDED!",
        ["^bang$"] = "TOO EXPLOSIVE!",
        ["^domino$"] = "TOO INDUCTIVE!",
        ["^fill"] = "TOO OVERFLOWING!",
        ["^fold"] = "TOO COMPACT!",
        ["^align"] = "TOO MUCH ALIGNMENT!"
    },
}

function check_and_crash(name,mode)
    if mode == nil then
        mode = "in_rules"
    end
    if (string.sub(name,1,4) == "not ") then
        name = string.sub(name,5)
    end
    for regex,message in pairs(CRASHING_MESSAGES[mode]) do
        --print(name.. " matches? ".. regex)
        if (string.match(name,regex) ~= nil) then
            destroylevel("custom",message)
            return true
        end
    end
    for _,dir_prop in ipairs(dir_props) do
        if name == dir_prop then
            destroylevel("custom","TOO DIZZY!")
            return true
        end
    end
    return false
end

---[[
local old_sentcalc = calculatesentences

function calculatesentences(...)
    local result,finals,maxlen,variations,sent_ids,newfirstwords = old_sentcalc(...)
    for i,sent in ipairs(result) do
        for _,text_chunk in ipairs(sent) do
            local name = text_chunk[1]
            if (check_and_crash(name,"on_parsing")) then
                break
            end
        end
    end
    return result,finals,maxlen,variations,sent_ids,newfirstwords
end
--]]

local old_addoption = addoption

function addoption(option,conds,ids,visible,notrule,tags_,visualonly_)
    for _,thing in ipairs(option) do
        if check_and_crash(thing) then
            return
        end
    end
    for _,cond in ipairs(conds) do
        local condname, condvals = cond[1], cond[2]
        if check_and_crash(condname) then
            return
        end
        for _,val in ipairs(condvals) do
            if check_and_crash(val) then
                return
            end
        end
    end
    return old_addoption(option,conds,ids,visible,notrule,tags_,visualonly_)
end


table.insert(mod_hook_functions["command_given"],
        function()
            for name, units in pairs(unitlists) do
                if #units ~= 0 then
                    if check_and_crash(name,"on_appearance") then
                        return
                    end
                end
            end
        end
)

--magic string: u2O4T<qLrNeXaH7by6dp>fDYSsmgFzjGcM35JwRPvICtQkBAKEZin0xW1V9l8oUh