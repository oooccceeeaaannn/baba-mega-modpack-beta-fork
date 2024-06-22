table.insert(editor_objlist_order, "text_crash")
table.insert(editor_objlist_order, "text_eternal")
table.insert(editor_objlist_order, "text_secure")
table.insert(editor_objlist_order, "text_toxic")
table.insert(editor_objlist_order, "text_alkali")
table.insert(editor_objlist_order, "text_equal")
table.insert(editor_objlist_order, "text_approx")
table.insert(editor_objlist_order, "text_elementof")
table.insert(editor_objlist_order, "text_nequal")
table.insert(editor_objlist_order, "text_nelementof")
table.insert(editor_objlist_order, "text_2equal")
table.insert(editor_objlist_order, "text_minus")
table.insert(editor_objlist_order, "text_draw")
table.insert(editor_objlist_order, "text_type")
table.insert(editor_objlist_order, "text_jot")

editor_objlist["text_draw"] =
{
    name = "text_draw",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
    argtype = {8},
    customobjects = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "ab", "ba"},
}

editor_objlist["text_type"] =
{
    name = "text_type",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
    argtype = {8},
    customobjects = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"},
}

editor_objlist["text_jot"] =
{
    name = "text_jot",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
    argtype = {8},
    customobjects = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"},
}

editor_objlist["text_equal"] =
{
    name = "text_equal",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
    argtype = {0,2}
}
editor_objlist["text_approx"] =
{
    name = "text_approx",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {2, 1},
    colour_active = {2, 2},
    argtype = {0}
}
editor_objlist["text_elementof"] =
{
    name = "text_elementof",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
    argtype = {0}
}
editor_objlist["text_nequal"] =
{
    name = "text_nequal",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {2, 1},
    colour_active = {2, 2},
    argtype = {0,2}
}
editor_objlist["text_nelementof"] =
{
    name = "text_nelementof",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {2, 1},
    colour_active = {2, 2},
    argtype = {0,2}
}
editor_objlist["text_2equal"] =
{
    name = "text_2equal",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
    argtype = {2}
}
editor_objlist["text_minus"] =
{
    name = "text_minus",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
    argtype = {0}
}

editor_objlist["text_crash"] =
{
    name = "text_crash",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 1},
    colour_active = {2, 2},
}

editor_objlist["text_eternal"] =
{
    name = "text_eternal",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}

editor_objlist["text_secure"] =
{
    name = "text_secure",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}

editor_objlist["text_toxic"] =
{
    name = "text_toxic",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 1},
    colour_active = {5, 4},
}
editor_objlist["text_alkali"] =
{
    name = "text_alkali",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 1},
    colour_active = {4, 2},
}
formatobjlist()