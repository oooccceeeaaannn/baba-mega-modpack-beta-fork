function table_to_string(tbl)
    local result = "{"
    for k, v in pairs(tbl) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."[\""..k.."\"]".."="
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

function copyqwe(obj)
    if type(obj) ~= 'table' then return obj end
    local res = {}
    for k, v in pairs(obj) do res[copyqwe(k)] = copyqwe(v) end
    return res
end

table_copy = copyqwe

function get_text_type(name)
    if is_str_special_prefixed(name) and not is_str_special_prefix(name) then return 0 end
    name = "text_"..name
    if objectpallete[name] ~= nil then
        local altname = objectpalette[name]
        return getactualdata_objlist(altname, "type")
    end
    return editor_objlist[name].type
end