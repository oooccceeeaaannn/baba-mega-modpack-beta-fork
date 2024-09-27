-- SINFUL: true if the object previously destroyed something
condlist.sinful = function(params,_,_,cdata)
	local unitid = cdata.unitid
	if unitid == 2 then -- EMPTY doesn't store karma
		return false
	elseif unitid == 1 then -- LEVEL: check level karma
		return (levelKarma == true)
	end
	local unit = mmf.newObject(unitid)
	if unit.karma then
		return true
	end
	return false
end

-- ALIGNED: true if all objects of that kind are in the same row or column
condlist.aligned = function(params,checkedconds,_,cdata)
	local unitid, name, x, y = cdata.unitid, cdata.name, cdata.x, cdata.y
	if (unitid ~= 1 and unitid ~= 2) then
		-- Ideally we could cache the results, but there's no mod hook for the very beginning of a turn?
		local xFail, yFail = false, false
		for _,u in pairs(unitlists[name]) do
			local unit = mmf.newObject(u)
			local ux, uy = unit.values[XPOS], unit.values[YPOS]
			if (ux ~= x) then -- We found a unit in a different column
				xFail = true
			end
			if (uy ~= y) then -- We found a unit in a different row
				yFail = true
			end
			if xFail and yFail then -- We have at least one unit in a different row and one unit in a different column, so they can't be aligned
				return false,checkedconds
			end
		end
		return true,checkedconds
	elseif unitid == 2 then
		local xFail, yFail = false, false
		local empties = findempty()
		for _,b in ipairs(empties) do
			local ex, ey = b % roomsizex, math.floor(b / roomsizex)
			if (ex ~= x) then -- We found an empty in a different column
				xFail = true
			end
			if (ey ~= y) then -- We found an empty in a different row
				yFail = true
			end
			if xFail and yFail then -- We have at least one empty in a different row and one empty in a different column, so they can't be aligned
				return false,checkedconds
			end
		end
		return true,checkedconds
	elseif unitid == 1 then
		return ws_levelAlignedRow or ws_levelAlignedColumn,checkedconds
	end
	return false,checkedconds
end

-- ALIGNEDX: true if all objects of that kind are in the same row
condlist.alignedx = function(params,checkedconds,_,cdata)
	local unitid, name, y = cdata.unitid, cdata.name, cdata.y
	if (unitid ~= 1 and unitid ~= 2) then
		-- Ideally we could cache the results, but there's no mod hook for the very beginning of a turn?
		for _,u in pairs(unitlists[name]) do
			local unit = mmf.newObject(u)
			local uy = unit.values[YPOS]
			if (uy ~= y) then -- One of the units is in a different row
				return false,checkedconds
			end
		end
		return true,checkedconds
	elseif unitid == 2 then
		local empties = findempty()
		for _,b in ipairs(empties) do
			local ey = math.floor(b / roomsizex)
			if (ey ~= y) then -- One of the empties is in a different row
				return false,checkedconds
			end
		end
		return true,checkedconds
	elseif unitid == 1 then
		return ws_levelAlignedRow,checkedconds
	end
	return false,checkedconds
end

-- ALIGNEDY: true if all objects of that kind are in the same column
condlist.alignedy = function(params,checkedconds,_,cdata)
	local unitid, name, x = cdata.unitid, cdata.name, cdata.x
	if (unitid ~= 1 and unitid ~= 2) then
		-- Ideally we could cache the results, but there's no mod hook for the very beginning of a turn?
		for _,u in pairs(unitlists[name]) do
			local unit = mmf.newObject(u)
			local ux = unit.values[XPOS]
			if (ux ~= x) then -- One of the units is in a different column
				return false,checkedconds
			end
		end
		return true,checkedconds
	elseif unitid == 2 then
		local empties = findempty()
		for _,b in ipairs(empties) do
			local ex = b % roomsizex
			if (ex ~= x) then -- One of the empties is in a different column
				return false,checkedconds
			end
		end
		return true,checkedconds
	elseif unitid == 1 then
		return ws_levelAlignedColumn,checkedconds
	end
	return false,checkedconds
end


-- ELSE: true if no other rule can apply to this unit
-- @Merge (Metatext x Word Salad) Should work fine with metatext.
condlist["else"] = function(params,checkedconds,_,cdata)
	local unitid,name,x,y,limit = cdata.unitid,cdata.name,cdata.x,cdata.y,cdata.limit
	if (featureindex[name] ~= nil) then
		local anytrue = false
		-- Get all rules that apply to the object
		for _,rule in ipairs(featureindex[name]) do
			-- Baserules are ignored, otherwise ELSE would be unusable with TEXT, LEVEL, CURSOR etc.
			local isbaserule = false
			for _,tag in ipairs(rule[4]) do
				if tag == "base" then
					isbaserule = true
					break
				end
			end
			-- If it's not a baserule and the subject matches, we can check it
			if (not isbaserule) and (rule[1][1] == name) then
				local conds = rule[2]
				local foundQuantifier = false
				-- Skip any rule with a quantifier prefix (ELSE or PERFECT)
				for _,cond in ipairs(conds) do
					if (cond[1] == "else") or (cond[1] == "not else") or (cond[1] == "perfect") or (cond[1] == "not perfect") then
						foundQuantifier = true
						break
					end
				end
				-- Check if at least one rule without a quantifier applies to this object
				if not foundQuantifier then
					if testcond(conds,unitid,x,y,nil,limit,checkedconds) then
						anytrue = true
						break -- We found a rule that applies, we can stop checking
					end
				end
			end
		end
		return not anytrue,checkedconds
	end
	return true,checkedconds
end

-- PERFECT: true if all other rules can apply to this unit
condlist.perfect = function(params,checkedconds,_,cdata)
	local unitid,name,x,y,limit = cdata.unitid,cdata.name,cdata.x,cdata.y,cdata.limit
	if (featureindex[name] ~= nil) then
		local anyfalse = false
		-- Get all rules that apply to the object
		for _,rule in ipairs(featureindex[name]) do
			-- Baserules are ignored, otherwise ELSE would be unusable with TEXT, LEVEL, CURSOR etc.
			local isbaserule = false
			for _,tag in ipairs(rule[4]) do
				if tag == "base" then
					isbaserule = true
					break
				end
			end
			-- If it's not a baserule and the subject matches, we can check it
			if (not isbaserule) and (rule[1][1] == name) then
				local conds = rule[2]
				local foundQuantifier = false
				-- Skip any rule with a quantifier prefix (ELSE or PERFECT)
				for _,cond in ipairs(conds) do
					if (cond[1] == "else") or (cond[1] == "not else") or (cond[1] == "perfect") or (cond[1] == "not perfect") then
						foundQuantifier = true
						break
					end
				end
				-- Check if at least one rule without a quantifier doesn't apply to this object
				if not foundQuantifier then
					if not testcond(conds,unitid,x,y,nil,limit,checkedconds) then
						anyfalse = true
						break -- We found a rule that doesn't apply, we can stop checking
					end
				end
			end
		end
		return not anyfalse,checkedconds
	end
	return true,checkedconds
end

-- MISSING: true if at least one target has been destroyed
condlist.missing =  function(params,checkedconds,_,cdata)
	if (#params > 0) then
		local paramsCounter = {}
		local notParamsCounter = {}
		local hasNotParams = false

		-- Copy death counter table
		local remaining = {}
		for n,c in pairs(ws_deathCounter) do
			remaining[n] = c
		end

		for _,param in ipairs(params) do
			-- First handle normal values, then "not" values
			local pname = param
			local pnot = false
			if (string.sub(param, 1, 4) == "not ") then
				pnot = true
				pname = string.sub(param, 5)
				hasNotParams = true
			end

			if (string.sub(pname, 1, 5) == "group") then
				return false,checkedconds
			end

			-- Add entries to the counter tables
			if (pnot == false) then
				if (paramsCounter[pname] == nil) then
					paramsCounter[pname] = 1
					if is_str_special_prefixed(pname) then
						paramsCounter[get_broad_name(pname)] = 1
					end
				else
					if is_str_special_prefixed(pname) then
						paramsCounter[get_broad_name(pname)] = paramsCounter[get_broad_name(pname)] + 1
					end
					paramsCounter[pname] = paramsCounter[pname] + 1
				end
			else
				if (notParamsCounter[pname] == nil) then
					notParamsCounter[pname] = 1
				else
					notParamsCounter[pname] = notParamsCounter[pname] + 1
				end
			end
		end

		for a,b in pairs(paramsCounter) do -- Pairs of "param: count"
			if (remaining[a] == nil) or (remaining[a] < b) then
				return false,checkedconds
			else
				remaining[a] = remaining[a] - b
			end
		end

		-- Handle params like "NOT BABA" or "NOT EMPTY" (note: NOT EMPTY can check for both text and objects; NOT TEXT only checks for objects; NOT X only checks for objects)
		-- this sucks
		if (hasNotParams) then
			remaining["empty"] = nil -- Discard the remaining empties, as nothing checks for those anymore

			-- Prioritize "NOT EMPTY", as it's the only one that can check text
			if (notParamsCounter["empty"] ~= nil) then
				local foundEnough = false
				if (remaining["text"] ~= nil) then
					if (remaining["text"] > notParamsCounter["empty"]) then
						notParamsCounter["empty"] = nil -- The texts are enough to cover "NOT EMPTY", remove this key
					else
						notParamsCounter["empty"] = notParamsCounter["empty"] - remaining["text"]
					end
				end
			end
			remaining["text"] = nil -- Nothing can check for the remaining TEXT either

			-- Check all the other remaining "NOT STUFF"
			for name,count in pairs(notParamsCounter) do
				local foundEnough = false
				-- Sadly we have to iterate over both tables
				if (count > 0) then
					for remName,_ in pairs(remaining) do
						if (remName ~= name) then
							if (remaining[remName] < count) then -- The remaining items aren't enough to cover all
								count = count - remaining[remName] -- Still, remove the ones that were covered
								remaining[remName] = nil -- We can remove this key
							else
								foundEnough = true
								remaining[remName] = remaining[remName] - count
								break -- No need to keep iterating
							end
						end
					end
				else
					foundEnough = true
				end

				-- We iterated through all the remaining items and didn't find enough for this
				if not foundEnough then
					return false,checkedconds
				end
			end
		end

		return true,checkedconds
	end

	return false,checkedconds
end