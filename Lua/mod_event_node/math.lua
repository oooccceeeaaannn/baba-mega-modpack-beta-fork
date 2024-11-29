math_vars = {}

function do_math_events(x, y)
  local ids = {}

  local target = ""

    local begin, bgn_ids, eqpos = find_events_math(x, y, "var")
    if #begin > 0 then
      for i, j in ipairs(bgn_ids) do
        table.insert(ids, {j})
      end
      target = begin[1]
    else
      return false, {}
    end

    local equal, eq_ids, endpos = find_events_math(eqpos[1], eqpos[2], "equals")
    if #equal > 0 then
      for i, j in ipairs(eq_ids) do
        table.insert(ids, {j})
      end
    else
      return false, {}
    end

    equal, eq_ids = find_events_math(endpos[1], endpos[2], "number")
    if #equal > 0 then
      for i, j in ipairs(eq_ids) do
        table.insert(ids, {j})
      end
      math_vars[target] = equal[1]

      return true, ids
    else
      return false, {}
    end



end



function do_if(x, y)
  local ids = {}

  local target = ""

    local begin, bgn_ids, eqpos, btype = find_events_math(x, y, {"var", "noun"})

    if btype == "var" then
      if #begin > 0 then
        for i, j in ipairs(bgn_ids) do
          table.insert(ids, {j})
        end
        target = begin[1]
      else
        return false, {}
      end

      local equal, eq_ids, endpos = find_events_math(eqpos[1], eqpos[2], "equals")
      if #equal > 0 then
        for i, j in ipairs(eq_ids) do
          table.insert(ids, {j})
        end
      else
        return false, {}
      end

      equal, eq_ids = find_events_math(endpos[1], endpos[2], "number")
      if #equal > 0 then
        for i, j in ipairs(eq_ids) do
          table.insert(ids, {j})
        end

        return true, ids, (math_vars[target] == equal[1])
      else
        return false, {}
      end

    elseif btype == "noun" then
      if #begin > 0 then
        for i, j in ipairs(bgn_ids) do
          table.insert(ids, {j})
        end
        target = begin[1]
      else
        return false, {}
      end

      local equal, eq_ids, endpos = find_events_math(eqpos[1], eqpos[2], "is")
      if #equal > 0 then
        for i, j in ipairs(eq_ids) do
          table.insert(ids, {j})
        end
      else
        return false, {}
      end

      equal, eq_ids = find_events_math(endpos[1], endpos[2], {"noun", "adjective"})
      if #equal > 0 then
        for i, j in ipairs(eq_ids) do
          table.insert(ids, {j})
        end

        return true, ids, #findfeature(target, "is", equal[1]) > 0
      else
        return false, {}
      end
    end



end

function find_events_math(x, y, types_, havenot)

	local the_ids, the_targets = {}, {}

  local nextpos = {x + 1, y}
  local ttype = nil
  local types = types_ or {"var"}
  if type(types_) ~= "table" then
    types = {types_}
  end


	for i, k in ipairs(findallhere(x, y)) do

		local kunit = mmf.newObject(k)
		local name = getname(kunit, true)

		if string.sub(name, 1, 6) == "event_" then

			local realname = string.sub(name, 7)

      for i, t in ipairs(types) do

  			if event_text_types[realname] == t or (t == "var" and string.sub(realname, 1, 4) == "var_") then

  				table.insert(the_targets, realname)
  				table.insert(the_ids, k)
          if ttype == nil then
            ttype = t
          end
  			end
      end

    end


	end

	return the_targets, the_ids, next_pos
end
