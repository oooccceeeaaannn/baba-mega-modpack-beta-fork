function table_to_string(tbl)
    local result = "{"
    for k, v in pairs(tbl) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."[\""..k.."\"]".."="
        end

        if type(k) == "number" then
            result = result.."[\"".. k%100 .."\"]".."="
        end

        -- Check the value type
        if type(v) == "table" then
            result = result..table_to_string(v)
        elseif type(v) == "boolean" then
            result = result..tostring(v)
        else
            result = result.."\""..v.."\""
        end
        result = result..","
    end
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len()-1)
    end
    return result.."}"
end

function table_copy(obj)
    if type(obj) ~= 'table' then return obj end
    local res = {}
    for k, v in pairs(obj) do res[table_copy(k)] = table_copy(v) end
    return res
end

function get_text_type(name)
    if is_str_special_prefixed(name) and not is_str_special_prefix(name) then return 0 end
    local aname = "text_" .. name
    if unitreference[aname] ~= nil then
        local altname = unitreference[aname]
        local result = getactualdata_objlist(altname, "type")
        return result
    end
    local result = editor_objlist[editor_objlist_reference[aname]]
    if result ~= nil then return result.type end
    return -2
end
