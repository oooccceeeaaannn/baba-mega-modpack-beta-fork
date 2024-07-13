condlist["one"] = function(params, checkedconds, checkedconds_, cdata)
	local pass = true
	local unitname = mmf.newObject(cdata.unitid).strings[UNITNAME]

	pass = testcond({ { "without", { unitname } } }, cdata.unitid)

	return pass, checkedconds, true
end

condlist["two"] = function(params, checkedconds, checkedconds_, cdata)
	local pass = false
	local unitname = mmf.newObject(cdata.unitid).strings[UNITNAME]

	if #unitlists[unitname] == 2 then
		pass = true
	end

	return pass, checkedconds, true
end

condlist["three"] = function(params, checkedconds, checkedconds_, cdata)
	local pass = false
	local unitname = mmf.newObject(cdata.unitid).strings[UNITNAME]

	if #unitlists[unitname] == 3 then
		pass = true
	end

	return pass, checkedconds, true
end

condlist["four"] = function(params, checkedconds, checkedconds_, cdata)
	local pass = false
	local unitname = mmf.newObject(cdata.unitid).strings[UNITNAME]

	if #unitlists[unitname] == 4 then
		pass = true
	end

	return pass, checkedconds, true
end

condlist["five"] = function(params, checkedconds, checkedconds_, cdata)
	local pass = false
	local unitname = mmf.newObject(cdata.unitid).strings[UNITNAME]

	if #unitlists[unitname] == 5 then
		pass = true
	end

	return pass, checkedconds, true
end

condlist["equal"] = function(params, checkedconds, checkedconds_, cdata)
	local pass = true
	local unitname = mmf.newObject(cdata.unitid).strings[UNITNAME]

	for a, b in ipairs(params) do
		if #unitlists[unitname] ~= count_object(b) then
			pass = false
			break
		end
	end

	return pass, checkedconds, true
end

condlist["greaterthan"] = function(params, checkedconds, checkedconds_, cdata)
	local pass = true
	local unitname = mmf.newObject(cdata.unitid).strings[UNITNAME]

	for a, b in ipairs(params) do
		if #unitlists[unitname] < count_object(b) then
			pass = false
			break
		end
	end

	return pass, checkedconds, true
end

condlist["lessthan"] = function(params, checkedconds, checkedconds_, cdata)
	local pass = true
	local unitname = mmf.newObject(cdata.unitid).strings[UNITNAME]

	for a, b in ipairs(params) do
		if #unitlists[unitname] > count_object(b) then
			pass = false
			break
		end
	end

	return pass, checkedconds, true
end

function count_object(name)
	local result = 0
	for k,v in pairs(units) do
		if (getname(v, name) == name) then
			result = result + 1
		end
	end
	return result
end

condlist["leveled"] = function(params,checkedconds,checkedconds_,cdata)
	local unitid,x,y = cdata.unitid,cdata.x,cdata.y
	local dunitid

	for a,b in ipairs(params) do
		for c,d in ipairs(units) do
			dunitid = d.fixed
			if unitid ~= d and d.strings[UNITNAME] == b then
				if floating(dunitid,unitid,x,y,d.values[XPOS],d.values[YPOS]) then
					return true,checkedconds,true
				end
			end
		end
	end

	return false,checkedconds,true
end

condlist["original"] = function(params,checkedconds,checkedconds_,cdata)
	local pass = true
	local unit = mmf.newObject(cdata.unitid)
	local oname = unit.originalname
	for a,b in ipairs(params) do
		if oname ~= b
				and (b ~= "text" or string.sub(oname, 1, 5) ~= "text_")
				and (b ~= "glyph" or string.sub(oname, 1, 6) ~= "glyph_")
				and (string.sub(b,1,4) ~= "meta" or "meta"..tostring(getmetalevel(oname)) ~= b) then
			return false,checkedconds,true
		end
	end

	return true,checkedconds,true
end

condlist["hidden"] = function(params,checkedconds,checkedconds_,cdata)
	
	local params = {"hide"}
	   local allfound = 0
	local alreadyfound = {}
	local name,unitid,x,y,limit = cdata.name,cdata.unitid,cdata.x,cdata.y,cdata.limit
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
							if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] == b) then
								checkedconds[tostring(dconds)] = 1
								
								if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
									alreadyfound[bcode] = 1
									allfound = allfound + 1
									break
								end
							end
						else
							if (string.sub(drule[3], 1, 4) ~= "not ") then
								local obj = unitreference["text_" .. drule[3]]
								
								if (obj ~= nil) then
									local objtype = getactualdata_objlist(obj,"type")
									
									if (objtype == 2) then
										if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] ~= pname) then
											checkedconds[tostring(dconds)] = 1
											
											if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
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
			end
		end
	else
		return false,checkedconds,true
	end
	
	--MF_alert(tostring(cdata.debugname) .. ", " .. tostring(allfound) .. ", " .. tostring(#params))
	
	return (allfound == #params),checkedconds,true
end

condlist["petted"] = function(params,checkedconds,checkedconds_,cdata)

	local params = {"pet"}
	   local allfound = 0
	local alreadyfound = {}
	local name,unitid,x,y,limit = cdata.name,cdata.unitid,cdata.x,cdata.y,cdata.limit
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
							if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] == b) then
								checkedconds[tostring(dconds)] = 1
								
								if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
									alreadyfound[bcode] = 1
									allfound = allfound + 1
									break
								end
							end
						else
							if (string.sub(drule[3], 1, 4) ~= "not ") then
								local obj = unitreference["text_" .. drule[3]]
								
								if (obj ~= nil) then
									local objtype = getactualdata_objlist(obj,"type")
									
									if (objtype == 2) then
										if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] ~= pname) then
											checkedconds[tostring(dconds)] = 1
											
											if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
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
			end
		end
	else
		return false,checkedconds,true
	end
	
	--MF_alert(tostring(cdata.debugname) .. ", " .. tostring(allfound) .. ", " .. tostring(#params))
	
	return (allfound == #params),checkedconds,true
end

condlist["static"] = function(params,checkedconds,checkedconds_,cdata)

	local params = {"still"}
	   local allfound = 0
	local alreadyfound = {}
	local name,unitid,x,y,limit = cdata.name,cdata.unitid,cdata.x,cdata.y,cdata.limit
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
							if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] == b) then
								checkedconds[tostring(dconds)] = 1
								
								if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
									alreadyfound[bcode] = 1
									allfound = allfound + 1
									break
								end
							end
						else
							if (string.sub(drule[3], 1, 4) ~= "not ") then
								local obj = unitreference["text_" .. drule[3]]
								
								if (obj ~= nil) then
									local objtype = getactualdata_objlist(obj,"type")
									
									if (objtype == 2) then
										if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] ~= pname) then
											checkedconds[tostring(dconds)] = 1
											
											if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
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
			end
		end
	else
		return false,checkedconds,true
	end
	
	--MF_alert(tostring(cdata.debugname) .. ", " .. tostring(allfound) .. ", " .. tostring(#params))
	
	return (allfound == #params),checkedconds,true
end

condlist["sleepy"] = function(params,checkedconds,checkedconds_,cdata)

	local params = {"sleep"}
	   local allfound = 0
	local alreadyfound = {}
	local name,unitid,x,y,limit = cdata.name,cdata.unitid,cdata.x,cdata.y,cdata.limit
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
							if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] == b) then
								checkedconds[tostring(dconds)] = 1
								
								if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
									alreadyfound[bcode] = 1
									allfound = allfound + 1
									break
								end
							end
						else
							if (string.sub(drule[3], 1, 4) ~= "not ") then
								local obj = unitreference["text_" .. drule[3]]
								
								if (obj ~= nil) then
									local objtype = getactualdata_objlist(obj,"type")
									
									if (objtype == 2) then
										if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] ~= pname) then
											checkedconds[tostring(dconds)] = 1
											
											if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
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
			end
		end
	else
		return false,checkedconds,true
	end
	
	--MF_alert(tostring(cdata.debugname) .. ", " .. tostring(allfound) .. ", " .. tostring(#params))
	
	return (allfound == #params),checkedconds,true
end

condlist["shiny"] = function(params,checkedconds,checkedconds_,cdata)

	local params = {"best"}
	   local allfound = 0
	local alreadyfound = {}
	local name,unitid,x,y,limit = cdata.name,cdata.unitid,cdata.x,cdata.y,cdata.limit
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
							if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] == b) then
								checkedconds[tostring(dconds)] = 1
								
								if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
									alreadyfound[bcode] = 1
									allfound = allfound + 1
									break
								end
							end
						else
							if (string.sub(drule[3], 1, 4) ~= "not ") then
								local obj = unitreference["text_" .. drule[3]]
								
								if (obj ~= nil) then
									local objtype = getactualdata_objlist(obj,"type")
									
									if (objtype == 2) then
										if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] ~= pname) then
											checkedconds[tostring(dconds)] = 1
											
											if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
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
			end
		end
	else
		return false,checkedconds,true
	end
	
	--MF_alert(tostring(cdata.debugname) .. ", " .. tostring(allfound) .. ", " .. tostring(#params))
	
	return (allfound == #params),checkedconds,true
end

condlist["curious"] = function(params,checkedconds,checkedconds_,cdata)

	local params = {"wonder"}
	   local allfound = 0
	local alreadyfound = {}
	local name,unitid,x,y,limit = cdata.name,cdata.unitid,cdata.x,cdata.y,cdata.limit
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
							if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] == b) then
								checkedconds[tostring(dconds)] = 1
								
								if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
									alreadyfound[bcode] = 1
									allfound = allfound + 1
									break
								end
							end
						else
							if (string.sub(drule[3], 1, 4) ~= "not ") then
								local obj = unitreference["text_" .. drule[3]]
								
								if (obj ~= nil) then
									local objtype = getactualdata_objlist(obj,"type")
									
									if (objtype == 2) then
										if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] ~= pname) then
											checkedconds[tostring(dconds)] = 1
											
											if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
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
			end
		end
	else
		return false,checkedconds,true
	end
	
	--MF_alert(tostring(cdata.debugname) .. ", " .. tostring(allfound) .. ", " .. tostring(#params))
	
	return (allfound == #params),checkedconds,true
end

condlist["golden"] = function(params,checkedconds,checkedconds_,cdata)

	local params = {"gold"}
	   local allfound = 0
	local alreadyfound = {}
	local name,unitid,x,y,limit = cdata.name,cdata.unitid,cdata.x,cdata.y,cdata.limit
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
							if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] == b) then
								checkedconds[tostring(dconds)] = 1
								
								if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
									alreadyfound[bcode] = 1
									allfound = allfound + 1
									break
								end
							end
						else
							if (string.sub(drule[3], 1, 4) ~= "not ") then
								local obj = unitreference["text_" .. drule[3]]
								
								if (obj ~= nil) then
									local objtype = getactualdata_objlist(obj,"type")
									
									if (objtype == 2) then
										if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] ~= pname) then
											checkedconds[tostring(dconds)] = 1
											
											if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
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
			end
		end
	else
		return false,checkedconds,true
	end
	
	--MF_alert(tostring(cdata.debugname) .. ", " .. tostring(allfound) .. ", " .. tostring(#params))
	
	return (allfound == #params),checkedconds,true
end

condlist["feelspast"] = function(params,checkedconds,checkedconds_,cdata)

	local params = {"past"}
	   local allfound = 0
	local alreadyfound = {}
	local name,unitid,x,y,limit = cdata.name,cdata.unitid,cdata.x,cdata.y,cdata.limit
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
							if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] == b) then
								checkedconds[tostring(dconds)] = 1
								
								if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
									alreadyfound[bcode] = 1
									allfound = allfound + 1
									break
								end
							end
						else
							if (string.sub(drule[3], 1, 4) ~= "not ") then
								local obj = unitreference["text_" .. drule[3]]
								
								if (obj ~= nil) then
									local objtype = getactualdata_objlist(obj,"type")
									
									if (objtype == 2) then
										if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] ~= pname) then
											checkedconds[tostring(dconds)] = 1
											
											if (alreadyfound[bcode] == nil) and testcond(dconds,unitid,x,y,nil,limit,checkedconds) then
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
			end
		end
	else
		return false,checkedconds,true
	end
	
	--MF_alert(tostring(cdata.debugname) .. ", " .. tostring(allfound) .. ", " .. tostring(#params))
	
	return (allfound == #params),checkedconds,true
end

condlist["feelsfuture"] = function(params, checkedconds, checkedconds_, cdata)

	local params = { "future" }
	local allfound = 0
	local alreadyfound = {}
	local name, unitid, x, y, limit = cdata.name, cdata.unitid, cdata.x, cdata.y, cdata.limit
	if (#params > 0) then
		for a, b in ipairs(params) do
			local pname = b
			local pnot = false
			if (string.sub(b, 1, 4) == "not ") then
				pnot = true
				pname = string.sub(b, 5)
			end

			local bcode = b .. "_" .. tostring(a)

			if (featureindex[name] ~= nil) then
				for c, d in ipairs(featureindex[name]) do
					local drule = d[1]
					local dconds = d[2]

					if (checkedconds[tostring(dconds)] == nil) then
						if (pnot == false) then
							if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] == b) then
								checkedconds[tostring(dconds)] = 1

								if (alreadyfound[bcode] == nil) and testcond(dconds, unitid, x, y, nil, limit, checkedconds) then
									alreadyfound[bcode] = 1
									allfound = allfound + 1
									break
								end
							end
						else
							if (string.sub(drule[3], 1, 4) ~= "not ") then
								local obj = unitreference["text_" .. drule[3]]

								if (obj ~= nil) then
									local objtype = getactualdata_objlist(obj, "type")

									if (objtype == 2) then
										if (drule[1] == name) and ((drule[2] == "is") or (drule[2] == "feel")) and (drule[3] ~= pname) then
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
			end
		end
	else
		return false, checkedconds, true
	end

	--MF_alert(tostring(cdata.debugname) .. ", " .. tostring(allfound) .. ", " .. tostring(#params))

	return (allfound == #params), checkedconds, true
end

condlist["triggered"] = function(params,checkedconds,checkedconds_,cdata)
	local onplayer = false

	local unitid,x,y = cdata.unitid,cdata.x,cdata.y

	for a,b in ipairs(ws_findplayerfeatureat(x,y)) do
		local bunit = mmf.newObject(b)

		if (x == bunit.values[XPOS]) and (y == bunit.values[YPOS]) then
			if floating(b, unitid) then
				return true, checkedconds, true
			end
		end
	end

	return false,checkedconds,true
end

condlist['refers'] = function(params, checkedconds, checkedconds_, cdata)
	for i, j in pairs(params) do
		local pname = j
		local is_param_this, raycast_units, _, this_count = parse_this_param_and_get_raycast_units(pname)
		local _params = pname
		local unitname = mmf.newObject(cdata.unitid).strings[UNITNAME]
		if not is_param_this then
			if (string.sub(unitname, 1, 5) == "text_") then
				if (string.sub(unitname, 6) == _params) then
					return true, checkedconds
				end
			elseif (string.sub(unitname, 1, 6) == "glyph_") then
				if (string.sub(unitname, 7) == _params) then
					return true, checkedconds
				end
			end
		else
			for ray_unitid, _ in pairs(raycast_units) do
				local ray_unit = mmf.newObject(ray_unitid)
				local ray_name = ray_unit.strings[UNITNAME]
				if (string.sub(ray_name, 1, 5) == "text_") then
					if (string.sub(ray_name, 6) == _params) then
						return true, checkedconds
					end
				elseif (string.sub(ray_name, 1, 6) == "glyph_") then
					if (string.sub(ray_name, 7) == _params) then
						return true, checkedconds
					end
				end
			end
		end

		if hasfeature(unitname, "is", "word", cdata.unitid) and (unitname == _params) then
			return true, checkedconds
		end
	end
	return false, checkedconds
end

condlist["cancel"] = function(params,checkedconds,checkedconds_,cdata)
	return false,checkedconds,true
end