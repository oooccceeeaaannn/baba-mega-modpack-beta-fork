-- This is an optional file that adds two new objects. It is not needed for the mod to work.

-- Adds object to editor.
table.insert(editor_objlist_order,"text_meta")
table.insert(editor_objlist_order,"text_unmeta")
table.insert(editor_objlist_order,"text_mega")
table.insert(editor_objlist_order,"text_unmega")
table.insert(editor_objlist_order,"text_meea")
table.insert(editor_objlist_order,"text_unmeea")
table.insert(editor_objlist_order,"text_mena")
table.insert(editor_objlist_order,"text_unmena")
table.insert(editor_objlist_order,"text_unmexa")
table.insert(editor_objlist_order,"text_meta-1")
table.insert(editor_objlist_order,"text_meta0")
table.insert(editor_objlist_order,"text_meta1")
table.insert(editor_objlist_order,"text_meta2")
table.insert(editor_objlist_order,"text_meta3")
editor_objlist["text_meta"] = {
  name = "text_meta",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text_quality","text_special", "metatext"},
  tiling = -1,
  type = 2,
  layer = 20,
  colour = {4, 0},
  colour_active = {4, 1},
}
editor_objlist["text_unmeta"] = {
  name = "text_unmeta",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text_quality","text_special", "metatext"},
  tiling = -1,
  type = 2,
  layer = 20,
  colour = {3, 0},
  colour_active = {3, 1},
}
editor_objlist["text_mega"] = {
  name = "text_mega",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text_quality","text_special", "metatext"},
  tiling = -1,
  type = 2,
  layer = 20,
  colour = {3, 2},
  colour_active = {3, 3},
}
editor_objlist["text_unmega"] = {
  name = "text_unmega",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text_quality","text_special", "metatext"},
  tiling = -1,
  type = 2,
  layer = 20,
  colour = {1, 3},
  colour_active = {1, 4},
}
editor_objlist["text_meea"] = {
  name = "text_meea",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text_quality","text_special", "metatext"},
  tiling = -1,
  type = 2,
  layer = 20,
  colour = {5, 2},
  colour_active = {5, 3},
}
editor_objlist["text_unmeea"] = {
  name = "text_unmeea",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text_quality","text_special", "metatext"},
  tiling = -1,
  type = 2,
  layer = 20,
  colour = {5, 1},
  colour_active = {5, 2},
}
editor_objlist["text_mena"] = {
  name = "text_mena",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text_quality","text_special", "metatext"},
  tiling = -1,
  type = 2,
  layer = 20,
  colour = {6, 1},
  colour_active = {2, 4},
}
editor_objlist["text_unmena"] = {
  name = "text_unmena",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text_quality","text_special", "metatext"},
  tiling = -1,
  type = 2,
  layer = 20,
  colour = {2, 1},
  colour_active = {2, 2},
}
editor_objlist["text_unmexa"] = {
  name = "text_unmexa",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text_quality","text_special", "metatext"},
  tiling = -1,
  type = 2,
  layer = 20,
  colour = {0, 1},
  colour_active = {0, 3},
}
editor_objlist["text_meta-1"] = {
  name = "text_meta-1",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text_special","abstract", "metatext"},
  tiling = -1,
  type = 0,
  layer = 20,
  colour = {4, 1},
  colour_active = {4, 2},
}
editor_objlist["text_meta0"] = {
  name = "text_meta0",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text_special","abstract", "metatext"},
  tiling = -1,
  type = 0,
  layer = 20,
  colour = {3, 0},
  colour_active = {3, 1},
}
editor_objlist["text_meta1"] = {
  name = "text_meta1",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text_special","abstract", "metatext"},
  tiling = -1,
  type = 0,
  layer = 20,
  colour = {3, 0},
  colour_active = {3, 1},
}
editor_objlist["text_meta2"] = {
  name = "text_meta2",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text_special","abstract", "metatext"},
  tiling = -1,
  type = 0,
  layer = 20,
  colour = {3, 0},
  colour_active = {3, 1},
}
editor_objlist["text_meta3"] = {
  name = "text_meta3",
  sprite_in_root = false,
  unittype = "text",
  tags = {"text_special","abstract", "metatext"},
  tiling = -1,
  type = 0,
  layer = 20,
  colour = {3, 0},
  colour_active = {3, 1},
}

add_glyph_using_text("meta")
add_glyph_using_text("unmeta")
add_glyph_using_text("mega")
add_glyph_using_text("unmega")

formatobjlist()

-- Disables if X IS X, like REVERT.

--[[ @Merge: postrules() was merged ]]


-- Implementation.

--[[ @Merge: conversion() was merged ]]

