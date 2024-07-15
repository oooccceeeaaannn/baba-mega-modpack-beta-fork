table.insert(editor_objlist_order, "text_node")
table.insert(editor_objlist_order, "text_node_")
table.insert(editor_objlist_order, "text_break")

node_types = {}
node_argtypes = {}
node_argextras = {}

function add_node(insert, name, type_, colour, colour_active, argtype, argextras)
    node_types[name] = type_
    node_argtypes[name] = argtype
    node_argextras[name] = argextras
    name = "node_" .. name
    if insert then
    table.insert(editor_objlist_order, name)
    end
    editor_objlist[name] =
    {
        name = name,
        sprite_in_root = false,
        unittype = "node",
        tags = {"nodes"},
        tiling = 0,
        type = 0,
        layer = 20,
        colour = colour,
        colour_active = colour_active,
    }
end

table.insert(nlist.full, "node")
table.insert(nlist.short, "node")
table.insert(nlist.objects, "node")
table.insert(nlist.brief, "node")

editor_objlist["text_node"] =
{
 	name = "text_node",
 	sprite_in_root = false,
 	unittype = "text",
 	tags = {"text"},
 	tiling = -1,
 	type = 0,
 	layer = 20,
 	colour = {6, 1},
    colour_active = {2, 4}
}

editor_objlist["text_node_"] =
{
    name = "text_node_",
    sprite = "text_nodepre",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text"},
    tiling = -1,
    type = 4,
    layer = 20,
    colour = {6, 1},
    colour_active = {2, 4}
}

editor_objlist["text_break"] =
{
 	name = "text_break",
 	sprite_in_root = false,
 	unittype = "text",
 	tags = {"text"},
 	tiling = -1,
 	type = 2,
 	layer = 20,
 	colour = {2, 1},
    colour_active = {2, 2}
}

add_node(true, "baba", 0, {4, 0}, {4, 1})
add_node(true, "flag", 0, {6, 1}, {2, 4})
add_node(true, "rock", 0, {6, 0}, {6, 1})
add_node(true, "wall", 0, {1, 1}, {0, 1})
add_node(true, "keke", 0, {2, 1}, {2, 2})
add_node(true, "text", 0, {4, 0}, {4, 1})
add_node(true, "node", 0, {6, 1}, {2, 4})
add_node(true, "you", 2, {4, 0}, {4, 1})
add_node(true, "win", 2, {6, 1}, {2, 4})
add_node(true, "push", 2, {6, 0}, {6, 1})
add_node(true, "stop", 2, {5, 0}, {5, 1})
add_node(true, "dir", 2, {1, 3}, {1, 4})
add_node(true, "break", 2, {2, 1}, {2, 2})
add_node(true, "and", 6, {0, 1}, {0, 3})
add_node(true, "not", 4, {2, 1}, {2, 2})
add_node(true, "lonely", 3, {2, 1}, {2, 2})
add_node(true, "on", 7, {0, 1}, {0, 3}, {0})
add_node(true, "facing", 7, {0, 1}, {0, 3}, {0}, {"up", "down", "left", "right"})
add_node(true, "has", 1, {0, 1}, {0, 3})
add_node(true, "nil", -1, {6, 1}, {2, 4})

dirnames = {
    dir = {"right", "up", "left", "down"},
    fall = {"fallright", "fallup", "fallleft", "fall"},
    nudge = {"nudgeright", "nudgeup", "nudgeleft", "nudgedown"},
    locked = {"lockedright", "lockedup", "lockedleft", "lockeddown"},
}

formatobjlist()