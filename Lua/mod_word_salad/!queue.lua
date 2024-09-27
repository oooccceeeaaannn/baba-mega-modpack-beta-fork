-- thank you lua programming guide

WS_Queue = {}

function WS_Queue.new()
	return {first = 0, last = -1}
end

function WS_Queue.isempty(list)
	return list.first > list.last
end

function WS_Queue.pushleft(list, value)
	local first = list.first - 1
	list.first = first
	list[first] = value
end
    
function WS_Queue.pushright(list, value)
	local last = list.last + 1
	list.last = last
	list[last] = value
end
    
function WS_Queue.popleft(list)
	local first = list.first
	if first > list.last then error("list is empty") end
	local value = list[first]
	list[first] = nil        -- to allow garbage collection
	list.first = first + 1
	return value
end
    
function WS_Queue.popright(list)
	local last = list.last
	if list.first > last then error("list is empty") end
	local value = list[last]
	list[last] = nil         -- to allow garbage collection
	list.last = last - 1
	return value
end
