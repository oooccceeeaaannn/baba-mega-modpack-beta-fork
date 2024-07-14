-- Both now clear FULLUNITLIST.
-- This now uses an insertion technique so I don't have to update these functions.
local oldclearunits = clearunits
function clearunits(restore_)
	fullunitlist = {}
	oldclearunits(restore_)
end
local oldinit = init
function init(...)
	fullunitlist = {}
	oldinit(...)
	unitreference["level"] = "level" -- fix stupid bug
end
