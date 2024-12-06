function add_glyph_using_text(name)
    local textname = "text_" .. name
    local textdata = editor_objlist[textname]
    if textdata == nil then
        error("Glyph was attempted to be added before it's text was added")
        return false
    end

    local type = textdata.type

    if type == 5 then
        error("Attempting to add a letter glyph - glyphs don't have letters")
        return false
    end

    local glyph_data = {
        name = "glyph_"..name,
        sprite_in_root = false,
        unittype = "object",
        tags = {"abstract", "glyph"},
        tiling = -1,
        type = 0,
        layer = 1,
        colour = textdata.colour,
        colour_active = textdata.colour_active,
    }
    table.insert(editor_objlist_order, "glyph_" .. name)
    editor_objlist["glyph_" .. name] = glyph_data
    return true
end

table.insert(editor_objlist_order, "text_pivot_is")
table.insert(editor_objlist_order, "text_branching_is")

table.insert(editor_objlist_order, "text_pivot_and")
table.insert(editor_objlist_order, "text_branching_and")

table.insert(editor_objlist_order, "text_pivot_has")
table.insert(editor_objlist_order, "text_branching_has")

table.insert(editor_objlist_order, "text_pivot_near")
table.insert(editor_objlist_order, "text_branching_near")

table.insert(editor_objlist_order, "text_pivot_make")
table.insert(editor_objlist_order, "text_branching_make")

table.insert(editor_objlist_order, "text_pivot_follow")
table.insert(editor_objlist_order, "text_branching_follow")

table.insert(editor_objlist_order, "text_pivot_mimic")
table.insert(editor_objlist_order, "text_branching_mimic")

table.insert(editor_objlist_order, "text_pivot_play")
table.insert(editor_objlist_order, "text_branching_play")

table.insert(editor_objlist_order, "text_pivot_eat")
table.insert(editor_objlist_order, "text_branching_eat")

table.insert(editor_objlist_order, "text_pivot_fear")
table.insert(editor_objlist_order, "text_branching_fear")

table.insert(editor_objlist_order, "text_pivot_on")
table.insert(editor_objlist_order, "text_branching_on")

table.insert(editor_objlist_order, "text_pivot_without")
table.insert(editor_objlist_order, "text_branching_without")

table.insert(editor_objlist_order, "text_pivot_facing")
table.insert(editor_objlist_order, "text_branching_facing")

table.insert(editor_objlist_order, "text_pivot_above")
table.insert(editor_objlist_order, "text_branching_above")

table.insert(editor_objlist_order, "text_pivot_below")
table.insert(editor_objlist_order, "text_branching_below")

table.insert(editor_objlist_order, "text_pivot_besideleft")
table.insert(editor_objlist_order, "text_branching_besideleft")

table.insert(editor_objlist_order, "text_pivot_besideright")
table.insert(editor_objlist_order, "text_branching_besideright")

table.insert(editor_objlist_order, "text_pivot_feeling")
table.insert(editor_objlist_order, "text_branching_feeling")

local omni_white = { {2, 2}, {2, 4} }
local omni_red   = { {4, 1}, {4, 2} }
local omni_green = { {5, 2}, {5, 4} }
local omni_blue  = { {3, 3}, {1, 4} }
local pivot_white = { {1, 3}, {1, 4} }
local pivot_red   = { {2, 2}, {2, 3} }
local pivot_green = { {4, 1}, {4, 2} }
local pivot_blue  = { {3, 2}, {3, 3} }

editor_objlist["text_branching_is"] =
{
    name = "text_branching_is",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = omni_white[1],
    colour_active = omni_white[2],
    pairedwith = "text_is",
}

editor_objlist["text_branching_and"] =
{
    name = "text_branching_and",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 6,
    layer = 20,
    colour = omni_white[1],
    colour_active = omni_white[2],
    pairedwith = "text_and",
}

editor_objlist["text_branching_has"] =
{
    name = "text_branching_has",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = omni_white[1],
    colour_active = omni_white[2],
    pairedwith = "text_has",
}

editor_objlist["text_branching_fear"] =
{
    name = "text_branching_fear",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = omni_red[1],
    colour_active = omni_red[2],
    pairedwith = "text_fear",
}

editor_objlist["text_branching_make"] =
{
    name = "text_branching_make",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = omni_white[1],
    colour_active = omni_white[2],
    pairedwith = "text_make",
}

editor_objlist["text_branching_follow"] =
{
    name = "text_branching_follow",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = omni_green[1],
    colour_active = omni_green[2],
    pairedwith = "text_follow",
}

editor_objlist["text_branching_mimic"] =
{
    name = "text_branching_mimic",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = omni_red[1],
    colour_active = omni_red[2],
    pairedwith = "text_mimic",
}

editor_objlist["text_branching_play"] =
{
    name = "text_branching_play",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = omni_green[1],
    colour_active = omni_green[2],
    pairedwith = "text_play",
}

editor_objlist["text_branching_eat"] =
{
    name = "text_branching_eat",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = omni_red[1],
    colour_active = omni_red[2],
    pairedwith = "text_eat",
}

editor_objlist["text_branching_near"] =
{
    name = "text_branching_near",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = omni_white[1],
    colour_active = omni_white[2],
    pairedwith = "text_near",
}

editor_objlist["text_branching_on"] =
{
    name = "text_branching_on",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = omni_white[1],
    colour_active = omni_white[2],
    pairedwith = "text_on",
}
editor_objlist["text_branching_without"] =
{
    name = "text_branching_without",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = omni_white[1],
    colour_active = omni_white[2],
    pairedwith = "text_without",
}
editor_objlist["text_branching_facing"] =
{
    name = "text_branching_facing",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = omni_white[1],
    colour_active = omni_white[2],
    pairedwith = "text_facing",
    argextra = {"right","up","left","down"},
}
editor_objlist["text_branching_above"] =
{
    name = "text_branching_above",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = omni_blue[1],
    colour_active = omni_blue[2],
    pairedwith = "text_above",
}
editor_objlist["text_branching_below"] =
{
    name = "text_branching_below",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = omni_blue[1],
    colour_active = omni_blue[2],
    pairedwith = "text_below",
}
editor_objlist["text_branching_besideleft"] =
{
    name = "text_branching_besideleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = omni_blue[1],
    colour_active = omni_blue[2],
    pairedwith = "text_besideleft",
}
editor_objlist["text_branching_besideright"] =
{
    name = "text_branching_besideright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = omni_blue[1],
    colour_active = omni_blue[2],
    pairedwith = "text_besideright",
}
editor_objlist["text_branching_feeling"] =
{
    name = "text_branching_feeling",
    sprite_in_root = false,
    unittype = "text",
    tags = {"omni text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = omni_white[1],
    colour_active = omni_white[2],
    pairedwith = "text_feeling",
    argtype = {2},
}

-- Pivot text
editor_objlist["text_pivot_is"] =
{
    name = "text_pivot_is",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = pivot_white[1],
    colour_active = pivot_white[2],
    pairedwith = "text_is",
}

editor_objlist["text_pivot_and"] =
{
    name = "text_pivot_and",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 6,
    layer = 20,
    colour = pivot_white[1],
    colour_active = pivot_white[2],
    pairedwith = "text_and",
}

editor_objlist["text_pivot_has"] =
{
    name = "text_pivot_has",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = pivot_white[1],
    colour_active = pivot_white[2],
    pairedwith = "text_has",
}

editor_objlist["text_pivot_fear"] =
{
    name = "text_pivot_fear",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = pivot_red[1],
    colour_active = pivot_red[2],
    pairedwith = "text_fear",
}

editor_objlist["text_pivot_make"] =
{
    name = "text_pivot_make",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = pivot_white[1],
    colour_active = pivot_white[2],
    pairedwith = "text_make",
}

editor_objlist["text_pivot_follow"] =
{
    name = "text_pivot_follow",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = pivot_green[1],
    colour_active = pivot_green[2],
    pairedwith = "text_follow",
}

editor_objlist["text_pivot_mimic"] =
{
    name = "text_pivot_mimic",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = pivot_red[1],
    colour_active = pivot_red[2],
    pairedwith = "text_mimic",
}

editor_objlist["text_pivot_play"] =
{
    name = "text_pivot_play",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = pivot_green[1],
    colour_active = pivot_green[2],
    pairedwith = "text_play",
}

editor_objlist["text_pivot_eat"] =
{
    name = "text_pivot_eat",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_verb"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = pivot_red[1],
    colour_active = pivot_red[2],
    pairedwith = "text_eat",
}

editor_objlist["text_pivot_near"] =
{
    name = "text_pivot_near",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = pivot_white[1],
    colour_active = pivot_white[2],
    pairedwith = "text_near",
}

editor_objlist["text_pivot_on"] =
{
    name = "text_pivot_on",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = pivot_white[1],
    colour_active = pivot_white[2],
    pairedwith = "text_on",
}
editor_objlist["text_pivot_without"] =
{
    name = "text_pivot_without",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = pivot_white[1],
    colour_active = pivot_white[2],
    pairedwith = "text_without",
}
editor_objlist["text_pivot_facing"] =
{
    name = "text_pivot_facing",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = pivot_white[1],
    colour_active = pivot_white[2],
    pairedwith = "text_facing",
    argextra = {"right","up","left","down"},
}
editor_objlist["text_pivot_above"] =
{
    name = "text_pivot_above",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = {3, 2},
    colour_active = pivot_blue[2],
    pairedwith = "text_above",
}
editor_objlist["text_pivot_below"] =
{
    name = "text_pivot_below",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = {3, 2},
    colour_active = pivot_blue[2],
    pairedwith = "text_below",
}
editor_objlist["text_pivot_besideleft"] =
{
    name = "text_pivot_besideleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = {3, 2},
    colour_active = pivot_blue[2],
    pairedwith = "text_besideleft",
}
editor_objlist["text_pivot_besideright"] =
{
    name = "text_pivot_besideright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = {3, 2},
    colour_active = pivot_blue[2],
    pairedwith = "text_besideright",
}
editor_objlist["text_pivot_feeling"] =
{
    name = "text_pivot_feeling",
    sprite_in_root = false,
    unittype = "text",
    tags = {"pivot text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = pivot_white[1],
    colour_active = pivot_white[2],
    pairedwith = "text_feeling",
    argtype = {2},
}

local new_words = {
    "text_uhh",
    "text_hmm",
    "text_ellipsis",
    "text_so",
    "text_actually",
    "text_really",
    "text_well",
    "text_oh",
    "text_ok",
    "text_yknow",
    "text_like",
    "text_just",
    "text_mmm",
    "text_ah",
}

for i, word in ipairs(new_words) do
    table.insert(editor_objlist_order, word)
end

for i, word in ipairs(new_words) do
    editor_objlist[word] =
    {
        name = word,
        sprite_in_root = false,
        unittype = "text",
        tags = {"filler text", "plasma's mods", "text", "abstract"},
        tiling = -1,
        type = 11,
        layer = 20,
        colour = {0, 1},
        colour_active = {0, 3},
    }
end

table.insert(editor_objlist_order, "text_stable")

editor_objlist["text_stable"] =
{
    name = "text_stable",
    sprite_in_root = false,
    unittype = "text",
    tags = {"plasma's mods", "text", "abstract"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {3, 2},
    colour_active = {3, 3},
}

table.insert(editor_objlist_order, "text_this")
table.insert(editor_objlist_order, "text_that")
table.insert(editor_objlist_order, "text_these")
table.insert(editor_objlist_order, "text_those")
table.insert(editor_objlist_order, "text_block")
table.insert(editor_objlist_order, "text_relay")
table.insert(editor_objlist_order, "text_pass")

editor_objlist["text_this"] =
{
    name = "text_this",
    sprite_in_root = false,
    unittype = "text",
    tags = {"plasma's mods", "text", "abstract", "text_noun", "pointer nouns"},
    tiling = 0,
    type = 0,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
}
editor_objlist["text_that"] =
{
    name = "text_that",
    sprite_in_root = false,
    unittype = "text",
    tags = {"plasma's mods", "text", "abstract", "text_noun", "pointer nouns"},
    tiling = 0,
    type = 0,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
}
editor_objlist["text_these"] =
{
    name = "text_these",
    sprite_in_root = false,
    unittype = "text",
    tags = {"plasma's mods", "text", "abstract", "text_noun", "pointer nouns"},
    tiling = 0,
    type = 0,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
}
editor_objlist["text_those"] =
{
    name = "text_those",
    sprite_in_root = false,
    unittype = "text",
    tags = {"plasma's mods", "text", "abstract", "text_noun", "pointer nouns"},
    tiling = 0,
    type = 0,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
}
editor_objlist["text_block"] =
{
    name = "text_block",
    sprite_in_root = false,
    unittype = "text",
    tags = {"plasma's mods", "text", "abstract", "text_quality", "pointer nouns"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 1},
    colour_active = {2, 2},
}
editor_objlist["text_relay"] =
{
    name = "text_relay",
    sprite_in_root = false,
    unittype = "text",
    tags = {"plasma's mods", "text", "abstract", "text_quality", "pointer nouns"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 2},
    colour_active = {5, 4},
}
editor_objlist["text_pass"] =
{
    name = "text_pass",
    sprite_in_root = false,
    unittype = "text",
    tags = {"plasma's mods", "text", "abstract", "text_quality", "pointer nouns"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 3},
    colour_active = {4, 4},
}

table.insert(editor_objlist_order, "text_cut")

editor_objlist["text_cut"] =
{
    name = "text_cut",
    sprite_in_root = false,
    unittype = "text",
    tags = {"plasma's mods", "text", "abstract"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 2},
    colour_active = {5, 4},
}
table.insert(editor_objlist_order, "text_pack")

editor_objlist["text_pack"] =
{
    name = "text_pack",
    sprite_in_root = false,
    unittype = "text",
    tags = {"plasma's mods", "text", "abstract"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 2},
    colour_active = {2, 3},
}

table.insert(editor_objlist_order, "text_turning_fall")
table.insert(editor_objlist_order, "text_turning_nudge")
table.insert(editor_objlist_order, "text_turning_dir")
table.insert(editor_objlist_order, "text_turning_locked")
table.insert(editor_objlist_order, "text_turning_beside")

table.insert(editor_objlist_order, "text_youdown")
table.insert(editor_objlist_order, "text_youright")
table.insert(editor_objlist_order, "text_youup")
table.insert(editor_objlist_order, "text_youleft")
table.insert(editor_objlist_order, "text_turning_you")

table.insert(editor_objlist_order, "text_you2down")
table.insert(editor_objlist_order, "text_you2right")
table.insert(editor_objlist_order, "text_you2up")
table.insert(editor_objlist_order, "text_you2left")
table.insert(editor_objlist_order, "text_turning_you2")

table.insert(editor_objlist_order, "text_pushdown")
table.insert(editor_objlist_order, "text_pushright")
table.insert(editor_objlist_order, "text_pushup")
table.insert(editor_objlist_order, "text_pushleft")
table.insert(editor_objlist_order, "text_turning_push")

table.insert(editor_objlist_order, "text_pulldown")
table.insert(editor_objlist_order, "text_pullright")
table.insert(editor_objlist_order, "text_pullup")
table.insert(editor_objlist_order, "text_pullleft")
table.insert(editor_objlist_order, "text_turning_pull")

table.insert(editor_objlist_order, "text_swapdown")
table.insert(editor_objlist_order, "text_swapright")
table.insert(editor_objlist_order, "text_swapup")
table.insert(editor_objlist_order, "text_swapleft")
table.insert(editor_objlist_order, "text_turning_swap")

table.insert(editor_objlist_order, "text_moredown")
table.insert(editor_objlist_order, "text_moreright")
table.insert(editor_objlist_order, "text_moreup")
table.insert(editor_objlist_order, "text_moreleft")
table.insert(editor_objlist_order, "text_turning_more")

table.insert(editor_objlist_order, "text_stopdown")
table.insert(editor_objlist_order, "text_stopright")
table.insert(editor_objlist_order, "text_stopup")
table.insert(editor_objlist_order, "text_stopleft")
table.insert(editor_objlist_order, "text_turning_stop")

table.insert(editor_objlist_order, "text_shiftdown")
table.insert(editor_objlist_order, "text_shiftright")
table.insert(editor_objlist_order, "text_shiftup")
table.insert(editor_objlist_order, "text_shiftleft")
table.insert(editor_objlist_order, "text_turning_shift")

table.insert(editor_objlist_order, "text_selectdown")
table.insert(editor_objlist_order, "text_selectright")
table.insert(editor_objlist_order, "text_selectup")
table.insert(editor_objlist_order, "text_selectleft")
table.insert(editor_objlist_order, "text_turning_select")

table.insert(editor_objlist_order, "text_boomdown")
table.insert(editor_objlist_order, "text_boomright")
table.insert(editor_objlist_order, "text_boomup")
table.insert(editor_objlist_order, "text_boomleft")
table.insert(editor_objlist_order, "text_turning_boom")

table.insert(editor_objlist[editor_objlist_reference["text_fall"]].tags, "arrow properties")
table.insert(editor_objlist[editor_objlist_reference["text_fallright"]].tags, "arrow properties")
table.insert(editor_objlist[editor_objlist_reference["text_fallup"]].tags, "arrow properties")
table.insert(editor_objlist[editor_objlist_reference["text_fallleft"]].tags, "arrow properties")
table.insert(editor_objlist[editor_objlist_reference["text_lockeddown"]].tags, "arrow properties")
table.insert(editor_objlist[editor_objlist_reference["text_lockedright"]].tags, "arrow properties")
table.insert(editor_objlist[editor_objlist_reference["text_lockedup"]].tags, "arrow properties")
table.insert(editor_objlist[editor_objlist_reference["text_lockedleft"]].tags, "arrow properties")
table.insert(editor_objlist[editor_objlist_reference["text_nudgedown"]].tags, "arrow properties")
table.insert(editor_objlist[editor_objlist_reference["text_nudgeright"]].tags, "arrow properties")
table.insert(editor_objlist[editor_objlist_reference["text_nudgeup"]].tags, "arrow properties")
table.insert(editor_objlist[editor_objlist_reference["text_nudgeleft"]].tags, "arrow properties")

editor_objlist["text_turning_fall"] =
{
    name = "text_turning_fall",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "turning text", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {5, 1},
    colour_active = {5, 3},
}
editor_objlist["text_turning_nudge"] =
{
    name = "text_turning_nudge",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "turning text", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {5, 1},
    colour_active = {5, 3},
}
editor_objlist["text_turning_dir"] =
{
    name = "text_turning_dir",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "turning text", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}
editor_objlist["text_turning_locked"] =
{
    name = "text_turning_locked",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "turning text", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {4, 1},
    colour_active = {4, 2},
}

-- YOU
editor_objlist["text_youright"] =
{
    name = "text_youright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}
editor_objlist["text_youleft"] =
{
    name = "text_youleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}
editor_objlist["text_youup"] =
{
    name = "text_youup",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}
editor_objlist["text_youdown"] =
{
    name = "text_youdown",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}
editor_objlist["text_turning_you"] =
{
    name = "text_turning_you",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "turning text", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}

-- YOU2
editor_objlist["text_you2right"] =
{
    name = "text_you2right",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}
editor_objlist["text_you2left"] =
{
    name = "text_you2left",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}
editor_objlist["text_you2up"] =
{
    name = "text_you2up",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}
editor_objlist["text_you2down"] =
{
    name = "text_you2down",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}
editor_objlist["text_turning_you2"] =
{
    name = "text_turning_you2",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "turning text", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}

-- MORE
editor_objlist["text_moreright"] =
{
    name = "text_moreright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}
editor_objlist["text_moreleft"] =
{
    name = "text_moreleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}
editor_objlist["text_moreup"] =
{
    name = "text_moreup",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}
editor_objlist["text_moredown"] =
{
    name = "text_moredown",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}
editor_objlist["text_turning_more"] =
{
    name = "text_turning_more",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "turning text", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}

-- PUSH
editor_objlist["text_pushright"] =
{
    name = "text_pushright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {6, 0},
    colour_active = {6, 1},
}
editor_objlist["text_pushleft"] =
{
    name = "text_pushleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {6, 0},
    colour_active = {6, 1},
}
editor_objlist["text_pushup"] =
{
    name = "text_pushup",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {6, 0},
    colour_active = {6, 1},
}
editor_objlist["text_pushdown"] =
{
    name = "text_pushdown",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {6, 0},
    colour_active = {6, 1},
}
editor_objlist["text_turning_push"] =
{
    name = "text_turning_push",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "turning text", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {6, 0},
    colour_active = {6, 1},
}

-- PULL
editor_objlist["text_pullright"] =
{
    name = "text_pullright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {6, 1},
    colour_active = {6, 2},
}
editor_objlist["text_pullleft"] =
{
    name = "text_pullleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {6, 1},
    colour_active = {6, 2},
}
editor_objlist["text_pullup"] =
{
    name = "text_pullup",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {6, 1},
    colour_active = {6, 2},
}
editor_objlist["text_pulldown"] =
{
    name = "text_pulldown",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {6, 1},
    colour_active = {6, 2},
}
editor_objlist["text_turning_pull"] =
{
    name = "text_turning_pull",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "turning text", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {6, 1},
    colour_active = {6, 2},
}

-- SWAP
editor_objlist["text_swapright"] =
{
    name = "text_swapright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}
editor_objlist["text_swapleft"] =
{
    name = "text_swapleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}
editor_objlist["text_swapup"] =
{
    name = "text_swapup",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}
editor_objlist["text_swapdown"] =
{
    name = "text_swapdown",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}
editor_objlist["text_turning_swap"] =
{
    name = "text_turning_swap",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "turning text", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}

-- STOP
editor_objlist["text_stopright"] =
{
    name = "text_stopright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 0},
    colour_active = {5, 1},
}
editor_objlist["text_stopleft"] =
{
    name = "text_stopleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 0},
    colour_active = {5, 1},
}
editor_objlist["text_stopup"] =
{
    name = "text_stopup",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 0},
    colour_active = {5, 1},
}
editor_objlist["text_stopdown"] =
{
    name = "text_stopdown",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 0},
    colour_active = {5, 1},
}
editor_objlist["text_turning_stop"] =
{
    name = "text_turning_stop",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "turning text", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {5, 0},
    colour_active = {5, 1},
}

-- SHIFT
editor_objlist["text_shiftright"] =
{
    name = "text_shiftright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 2},
    colour_active = {1, 3},
}
editor_objlist["text_shiftleft"] =
{
    name = "text_shiftleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 2},
    colour_active = {1, 3},
}
editor_objlist["text_shiftup"] =
{
    name = "text_shiftup",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 2},
    colour_active = {1, 3},
}
editor_objlist["text_shiftdown"] =
{
    name = "text_shiftdown",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 2},
    colour_active = {1, 3},
}
editor_objlist["text_turning_shift"] =
{
    name = "text_turning_shift",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "turning text", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {1, 2},
    colour_active = {1, 3},
}

-- SELECT
editor_objlist["text_selectright"] =
{
    name = "text_selectright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 3},
    colour_active = {2, 4},
}
editor_objlist["text_selectleft"] =
{
    name = "text_selectleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 3},
    colour_active = {2, 4},
}
editor_objlist["text_selectup"] =
{
    name = "text_selectup",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 3},
    colour_active = {2, 4},
}
editor_objlist["text_selectdown"] =
{
    name = "text_selectdown",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 3},
    colour_active = {2, 4},
}
editor_objlist["text_turning_select"] =
{
    name = "text_turning_select",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "turning text", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {2, 3},
    colour_active = {2, 4},
}

-- BOOM
editor_objlist["text_boomright"] =
{
    name = "text_boomright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 1},
    colour_active = {2, 2},
}
editor_objlist["text_boomleft"] =
{
    name = "text_boomleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 1},
    colour_active = {2, 2},
}
editor_objlist["text_boomup"] =
{
    name = "text_boomup",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 1},
    colour_active = {2, 2},
}
editor_objlist["text_boomdown"] =
{
    name = "text_boomdown",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 1},
    colour_active = {2, 2},
}
editor_objlist["text_turning_boom"] =
{
    name = "text_turning_boom",
    sprite_in_root = false,
    unittype = "text",
    tags = {"arrow properties", "turning text", "plasma's mods", "text", "abstract", "text_quality"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {2, 1},
    colour_active = {2, 2},
}
editor_objlist["text_turning_beside"] =
{
    name = "text_turning_beside",
    sprite_in_root = false,
    unittype = "text",
    tags = {"turning text", "plasma's mods", "text", "abstract", "text_condition"},
    tiling = 0,
    type = 7,
    layer = 20,
    colour = {1, 2},
    colour_active = {1, 4},
}


function apply_patashu_settings(settings_dict)
    for setting_name, value in pairs(settings_dict) do
        if setting_name == "very_drunk" then
            very_drunk = value
        elseif setting_name == "float_breaks_sticky" then
            float_breaks_sticky = value
        elseif setting_name == "very_sticky" then
            very_sticky = value
        end
    end
end

table.insert(objlistdata.alltags, "patashu")

table.insert(editor_objlist_order, "text_slip")
editor_objlist["text_slip"] = {
    name = "text_slip",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}

table.insert(editor_objlist_order, "text_slide")
editor_objlist["text_slide"] = {
    name = "text_slide",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}

table.insert(editor_objlist_order, "text_hates")
editor_objlist["text_hates"] = {
    name = "text_hates",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    layer = 20,
    operatortype = "verb",
    colour = {5, 0},
    colour_active = {5, 1},
}

table.insert(editor_objlist_order, "text_likes")
editor_objlist["text_likes"] = {
    name = "text_likes",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    layer = 20,
    operatortype = "verb",
    colour = {5, 0},
    colour_active = {5, 1},
}

table.insert(editor_objlist_order, "text_sidekick")
editor_objlist["text_sidekick"] = {
    name = "text_sidekick",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {6, 0},
    colour_active = {6, 1},
}

table.insert(editor_objlist_order, "text_lazy")
editor_objlist["text_lazy"] = {
    name = "text_lazy",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {6, 1},
    colour_active = {6, 2},
}

table.insert(editor_objlist_order, "text_moonwalk")
editor_objlist["text_moonwalk"] = {
    name = "text_moonwalk",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}

table.insert(editor_objlist_order, "text_drunk")
editor_objlist["text_drunk"] = {
    name = "text_drunk",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}

table.insert(editor_objlist_order, "text_drunker")
editor_objlist["text_drunker"] = {
    name = "text_drunker",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}

table.insert(editor_objlist_order, "text_skip")
editor_objlist["text_skip"] = {
    name = "text_skip",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}

table.insert(editor_objlist_order, "text_tall")
editor_objlist["text_tall"] = {
    name = "text_tall",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {0, 0},
    colour_active = {0, 1},
}

table.insert(editor_objlist_order, "text_oneway")
editor_objlist["text_oneway"] = {
    name = "text_oneway",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}

table.insert(editor_objlist_order, "text_copy")
editor_objlist["text_copy"] = {
    name = "text_copy",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    layer = 20,
    operatortype = "verb",
    colour = {2, 1},
    colour_active = {2, 2},
}

table.insert(editor_objlist_order, "text_reset")
editor_objlist["text_reset"] = {
    name = "text_reset",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
    layer = 20,
}

table.insert(editor_objlist_order, "text_noundo")
editor_objlist["text_noundo"] = {
    name = "text_noundo",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 2},
    colour_active = {5, 3},
}

table.insert(editor_objlist_order, "text_noreset")
editor_objlist["text_noreset"] = {
    name = "text_noreset",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 2},
    colour_active = {5, 3},
}

table.insert(editor_objlist_order, "text_stops")
editor_objlist["text_stops"] = {
    name = "text_stops",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    layer = 20,
    operatortype = "verb",
    colour = {5, 0},
    colour_active = {5, 1},
}

table.insert(editor_objlist_order, "text_pushes")
editor_objlist["text_pushes"] = {
    name = "text_pushes",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    layer = 20,
    operatortype = "verb",
    colour = {6, 0},
    colour_active = {6, 1},
}

table.insert(editor_objlist_order, "text_pulls")
editor_objlist["text_pulls"] = {
    name = "text_pulls",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    layer = 20,
    operatortype = "verb",
    colour = {6, 1},
    colour_active = {6, 2},
}

table.insert(editor_objlist_order, "text_sinks")
editor_objlist["text_sinks"] = {
    name = "text_sinks",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    layer = 20,
    operatortype = "verb",
    colour = {1, 2},
    colour_active = {1, 3},
}

table.insert(editor_objlist_order, "text_defeats")
editor_objlist["text_defeats"] = {
    name = "text_defeats",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    layer = 20,
    operatortype = "verb",
    colour = {2, 0},
    colour_active = {2, 1},
}

table.insert(editor_objlist_order, "text_opens")
editor_objlist["text_opens"] = {
    name = "text_opens",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    layer = 20,
    operatortype = "verb",
    colour = {6, 1},
    colour_active = {2, 4},
}

table.insert(editor_objlist_order, "text_shifts")
editor_objlist["text_shifts"] = {
    name = "text_shifts",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    layer = 20,
    operatortype = "verb",
    colour = {1, 2},
    colour_active = {1, 3},
}

--[[table.insert(editor_objlist_order, "text_teles")
editor_objlist["text_teles"] = {
	name = "text_teles",
	sprite_in_root = false,
	unittype = "text",
	tags = {"text", "text_verb", "patashu"},
	tiling = -1,
	type = 1,
	layer = 20,
	operatortype = "verb",
	colour = {1, 2},
	colour_active = {1, 4},
}]]

table.insert(editor_objlist_order, "text_swaps")
editor_objlist["text_swaps"] = {
    name = "text_swaps",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    layer = 20,
    operatortype = "verb",
    colour = {3, 0},
    colour_active = {3, 1},
}

table.insert(editor_objlist_order, "text_melts")
editor_objlist["text_melts"] = {
    name = "text_melts",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    layer = 20,
    operatortype = "verb",
    colour = {2, 2},
    colour_active = {2, 3},
}

table.insert(editor_objlist_order, "text_topple")
editor_objlist["text_topple"] = {
    name = "text_topple",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}

table.insert(editor_objlist_order, "text_zoom")
editor_objlist["text_zoom"] = {
    name = "text_zoom",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {0, 2},
    colour_active = {0, 3},
}

table.insert(editor_objlist_order, "text_yeet")
editor_objlist["text_yeet"] = {
    name = "text_yeet",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {0, 2},
    colour_active = {0, 3},
}

table.insert(editor_objlist_order, "text_launch")
editor_objlist["text_launch"] = {
    name = "text_launch",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 2},
    colour_active = {1, 3},
}

table.insert(editor_objlist_order, "text_sticky")
editor_objlist["text_sticky"] = {
    name = "text_sticky",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "patashu"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {6, 1},
    colour_active = {2, 4},
}

table.insert(editor_objlist_order, "text_print")
editor_objlist["text_print"] = {
    name = "text_print",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    argtype = {0, 2},
    layer = 20,
    colour = {0, 2},
    colour_active = {0, 3},
}

table.insert(editor_objlist_order, "text_imprint")
editor_objlist["text_imprint"] = {
    name = "text_imprint",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    argtype = {0, 2},
    layer = 20,
    colour = {0, 2},
    colour_active = {0, 3},
}

table.insert(editor_objlist_order, "text_scribble")
editor_objlist["text_scribble"] = {
    name = "text_scribble",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    argtype = {0, 2},
    layer = 20,
    colour = {0, 2},
    colour_active = {0, 3},
}

table.insert(editor_objlist_order, "text_scrawl")
editor_objlist["text_scrawl"] = {
    name = "text_scrawl",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_verb", "patashu"},
    tiling = -1,
    type = 1,
    argtype = {0, 2},
    layer = 20,
    colour = {0, 2},
    colour_active = {0, 3},
}

table.insert(editor_objlist_order, "text_past")

-- This defines the exact data for it (note that since the sprite is specific to this levelpack, sprite_in_root must be false!)

editor_objlist["text_past"] = {
    name = "text_past",
    unittype = "text",
    sprite_in_root = false,
    tags = {"text","text_condition","text_prefix","abstract","past"},
    tiling = -1,
    type = 3,
    layer = 20,
    colour = {1, 1},
    colour_active = {3, 2},
    advanced = true,
}

table.insert(editor_objlist_order, "text_persist")
editor_objlist["text_persist"] =
{
    name = "text_persist",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "abstract", "text_quality", "persist"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
}

add_glyph_using_text("persist")

table.insert(editor_objlist_order, "text_baserule")
editor_objlist["text_baserule"] =
{
    name = "text_baserule",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "abstract", "text_quality", "persist"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
}


letters_for_stringwords = {"text_","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0","ba","ab","sharp","flat"}
--Add entries to this table if you want other 2-letter words with text type 5 to appear in starts

table.insert(editor_objlist_order, "text_starts")


editor_objlist["text_starts"] =
{
    name = "text_starts",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_condition","text_special","stringwords"},
    tiling = -1,
    type = 7,
    argtype = {0,2,8},
    customobjects = letters_for_stringwords,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
}

table.insert(editor_objlist_order, "text_contain")


editor_objlist["text_contain"] =
{
    name = "text_contain",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_condition","text_special","stringwords"},
    tiling = -1,
    type = 7,
    argtype = {0,2,8},
    customobjects = letters_for_stringwords,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
}

table.insert(editor_objlist_order, "text_ends")


editor_objlist["text_ends"] =
{
    name = "text_ends",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_condition","text_special","stringwords"},
    tiling = -1,
    type = 7,
    argtype = {0,2,8},
    customobjects = letters_for_stringwords,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
}


table.insert(editor_objlist_order, "text_ambient")
editor_objlist["text_ambient"] =
{
    name = "text_ambient",
    sprite_in_root = false,
    unittype = "text",
    tags = {"abstract", "text_special","word salad"},
    tiling = -1,
    type = 0,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}

-- Put AMBIENT in the nlists
table.insert(nlist.full, "ambient")
table.insert(nlist.short, "ambient")
table.insert(nlist.brief, "ambient")

table.insert(editor_objlist_order, "text_alive")
editor_objlist["text_alive"] =
{
    name = "text_alive",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}

table.insert(editor_objlist_order, "text_vessel")
editor_objlist["text_vessel"] =
{
    name = "text_vessel",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","movement","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 1},
    colour_active = {0, 1},
}

table.insert(editor_objlist_order, "text_vessel2")
editor_objlist["text_vessel2"] =
{
    name = "text_vessel2",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","movement","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 1},
    colour_active = {0, 1},
}

table.insert(editor_objlist_order, "text_hop")
editor_objlist["text_hop"] =
{
    name = "text_hop",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","movement","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 3},
    colour_active = {4, 4},
}

table.insert(editor_objlist_order, "text_hops")
editor_objlist["text_hops"] =
{
    name = "text_hops",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_verb","movement","word salad"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {4, 3},
    colour_active = {4, 4},
}

table.insert(editor_objlist_order, "text_karma")
editor_objlist["text_karma"] =
{
    name = "text_karma",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 1},
    colour_active = {2, 2},
}

table.insert(editor_objlist_order, "text_sinful")
editor_objlist["text_sinful"] =
{
    name = "text_sinful",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_prefix","word salad"},
    tiling = -1,
    type = 3,
    layer = 20,
    colour = {2, 1},
    colour_active = {2, 2},
}

table.insert(editor_objlist_order, "text_repent")
editor_objlist["text_repent"] =
{
    name = "text_repent",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 1},
    colour_active = {5, 2},
}

table.insert(editor_objlist_order, "text_echo")
editor_objlist["text_echo"] =
{
    name = "text_echo",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {0, 2},
    colour_active = {0, 3},
}

table.insert(editor_objlist_order, "text_enter")
editor_objlist["text_enter"] =
{
    name = "text_enter",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 3},
    colour_active = {2, 4},
}

table.insert(editor_objlist_order, "text_vehicle")
editor_objlist["text_vehicle"] =
{
    name = "text_vehicle",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","movement","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 1},
    colour_active = {0, 1},
}

table.insert(editor_objlist_order, "text_boost")
editor_objlist["text_boost"] =
{
    name = "text_boost",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","movement","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}

table.insert(editor_objlist_order, "text_boosts")
editor_objlist["text_boosts"] =
{
    name = "text_boosts",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_verb","movement","word salad"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}

table.insert(editor_objlist_order, "text_aligned")
editor_objlist["text_aligned"] =
{
    name = "text_aligned",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_prefix","word salad"},
    tiling = -1,
    type = 3,
    layer = 20,
    colour = {6, 1},
    colour_active = {6, 2},
}

table.insert(editor_objlist_order, "text_alignedx")
word_names["alignedx"] = "x-aligned"
editor_objlist["text_alignedx"] =
{
    name = "text_alignedx",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_prefix","word salad"},
    tiling = -1,
    type = 3,
    layer = 20,
    colour = {4, 1},
    colour_active = {4, 2},
}

table.insert(editor_objlist_order, "text_alignedy")
word_names["alignedy"] = "y-aligned"
editor_objlist["text_alignedy"] =
{
    name = "text_alignedy",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_prefix","word salad"},
    tiling = -1,
    type = 3,
    layer = 20,
    colour = {1, 2},
    colour_active = {1, 4},
}

formatobjlist()

table.insert(editor_objlist_order, "text_morph")
editor_objlist["text_morph"] =
{
    name = "text_morph",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 2},
    colour_active = {5, 4}
}

table.insert(editor_objlist_order, "text_trap")
editor_objlist["text_trap"] =
{
    name = "text_trap",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 0},
    colour_active = {2, 1}
}

table.insert(editor_objlist_order, "text_traps")
editor_objlist["text_traps"] =
{
    name = "text_traps",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_verb","word salad"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {2, 0},
    colour_active = {2, 1}
}

table.insert(editor_objlist_order, "text_else")
editor_objlist["text_else"] =
{
    name = "text_else",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_prefix","word salad"},
    tiling = -1,
    type = 3,
    layer = 20,
    colour = {1, 1},
    colour_active = {1, 2}
}

table.insert(editor_objlist_order, "text_perfect")
editor_objlist["text_perfect"] =
{
    name = "text_perfect",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_prefix","word salad"},
    tiling = -1,
    type = 3,
    layer = 20,
    colour = {4, 3},
    colour_active = {3, 3}
}

table.insert(editor_objlist_order, "text_missing")
editor_objlist["text_missing"] =
{
    name = "text_missing",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_condition","word salad"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3}
}

table.insert(editor_objlist_order, "text_bungee")
editor_objlist["text_bungee"] =
{
    name = "text_bungee",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","movement","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 2},
    colour_active = {2, 3}
}

table.insert(editor_objlist_order, "text_rescue")
editor_objlist["text_rescue"] =
{
    name = "text_rescue",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","movement","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 1},
    colour_active = {1, 2}
}

table.insert(editor_objlist_order, "text_bang")
editor_objlist["text_bang"] =
{
    name = "text_bang",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {2, 1},
    colour_active = {2, 2}
}

table.insert(editor_objlist_order, "text_domino")
editor_objlist["text_domino"] =
{
    name = "text_domino",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3}
}

table.insert(editor_objlist_order, "text_fill")
editor_objlist["text_fill"] =
{
    name = "text_fill",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1}
}

table.insert(editor_objlist_order, "text_filldown")
word_names["filldown"] = "fill (down)"
editor_objlist["text_filldown"] =
{
    name = "text_filldown",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1}
}

table.insert(editor_objlist_order, "text_fillright")
word_names["fillright"] = "fill (right)"
editor_objlist["text_fillright"] =
{
    name = "text_fillright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1}
}

table.insert(editor_objlist_order, "text_fillup")
word_names["fillup"] = "fill (up)"
editor_objlist["text_fillup"] =
{
    name = "text_fillup",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1}
}

table.insert(editor_objlist_order, "text_fillleft")
word_names["fillleft"] = "fill (left)"
editor_objlist["text_fillleft"] =
{
    name = "text_fillleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1}
}

table.insert(editor_objlist_order, "text_folddown")
word_names["folddown"] = "fold (down)"
editor_objlist["text_folddown"] =
{
    name = "text_folddown",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 0},
    colour_active = {5, 1}
}

table.insert(editor_objlist_order, "text_foldright")
word_names["foldright"] = "fold (right)"
editor_objlist["text_foldright"] =
{
    name = "text_foldright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 0},
    colour_active = {5, 1}
}

table.insert(editor_objlist_order, "text_foldup")
word_names["foldup"] = "fold (up)"
editor_objlist["text_foldup"] =
{
    name = "text_foldup",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 0},
    colour_active = {5, 1}
}

table.insert(editor_objlist_order, "text_foldleft")
word_names["foldleft"] = "fold (left)"
editor_objlist["text_foldleft"] =
{
    name = "text_foldleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 0},
    colour_active = {5, 1}
}

table.insert(editor_objlist_order, "text_aligndown")
word_names["aligndown"] = "align (down)"
editor_objlist["text_aligndown"] =
{
    name = "text_aligndown",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","movement","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 3},
    colour_active = {3, 3}
}

table.insert(editor_objlist_order, "text_alignright")
word_names["alignright"] = "align (right)"
editor_objlist["text_alignright"] =
{
    name = "text_alignright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","movement","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 3},
    colour_active = {3, 3}
}

table.insert(editor_objlist_order, "text_alignup")
word_names["alignup"] = "align (up)"
editor_objlist["text_alignup"] =
{
    name = "text_alignup",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","movement","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 3},
    colour_active = {3, 3}
}

table.insert(editor_objlist_order, "text_alignleft")
word_names["alignleft"] = "align (left)"
editor_objlist["text_alignleft"] =
{
    name = "text_alignleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality","movement","word salad"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {4, 3},
    colour_active = {3, 3}
}

table.insert(editor_objlist_order, "text_trash")


editor_objlist["text_trash"] =
{
    name = "text_trash",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_verb","text_special"},
    tiling = -1,
    type = 1,
    argtype = {2},
    layer = 20,
    colour = {2, 1},
    colour_active = {2, 2},
}



table.insert(editor_objlist_order, "text_waste")


editor_objlist["text_waste"] =
{
    name = "text_waste",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_verb","text_special"},
    tiling = -1,
    type = 1,
    argtype = {2},
    layer = 20,
    colour = {6, 1},
    colour_active = {2, 4},
}

table.insert(editor_objlist_order, "text_build")


editor_objlist["text_build"] =
{
    name = "text_build",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_verb","text_special"},
    tiling = -1,
    type = 1,
    argtype = {2},
    layer = 20,
    colour = {5, 2},
    colour_active = {5, 3},
}

table.insert(editor_objlist_order, "text_sensing")


editor_objlist["text_sensing"] =
{
    name = "text_sensing",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_verb","text_special"},
    tiling = -1,
    type = 7,
    argtype = {2},
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
}

local extra_word_names =
{
    spinright = "spin (right,right)",
    spinleft = "spin (right,left)",
    spinup = "spin (right,up)",
    spindown = "spin (right,down)",
    despinright = "spin (left,right)",
    despinleft = "spin (left,left)",
    despinup = "spin (left,up)",
    despindown = "spin (left,down)",
    greaterthan = "greater than",
    lessthan = "less than",
}

for k,v in ipairs(extra_word_names) do
    word_names[k] = v
end


function addtext(name,type,col,acol,customobjs,arg,root,sprite)
    local inroot = root or false
    local sprite = sprite
    if sprite == "" then
        sprite = "text_"..name
    end
    table.insert(editor_objlist_order, "text_"..name)

    editor_objlist["text_"..name] =
    {
        name = "text_"..name,
        sprite_in_root = inroot,
        unittype = "text",
        tags = {""},
        tiling = -1,
        type = type,
        argtype = arg or {},
        layer = 20,
        colour = col,
        colour_active = acol,
        customobjects = customobjs or {},
        sprite = sprite
    }
end

function addwatchpair(name,col,acol)
    table.insert(editor_objlist_order, "text_watch"..name)
    table.insert(editor_objlist_order, "text_watched"..name)

    editor_objlist["text_watch"..name] =
    {
        name = "text_watch"..name,
        sprite_in_root = false,
        unittype = "text",
        tags = {""},
        tiling = -1,
        type = 2,
        layer = 20,
        colour = col,
        colour_active = acol,
        pairedwith = "text_watched"..name,
    }
    editor_objlist["text_watched"..name] =
    {
        name = "text_watched"..name,
        sprite_in_root = false,
        unittype = "text",
        tags = {""},
        tiling = -1,
        type = 3,
        layer = 20,
        colour = col,
        colour_active = acol,
        pairedwith = "text_watch"..name
    }
end

function addobj(objname,c,ac,tiling,c2,sprite)
    local objc = c2 or ac
    local sprite = sprite or objname

    table.insert(editor_objlist_order, objname)
    table.insert(editor_objlist_order, "text_"..objname)

    editor_objlist[objname] =
    {
        name = objname,
        sprite_in_root = false,
        unittype = "object",
        tags = {""},
        tiling = tiling,
        type = 0,
        layer = 15,
        colour = objc,
        sprite = sprite
    }
    editor_objlist["text_"..objname] =
    {
        name = "text_"..objname,
        sprite_in_root = false,
        unittype = "text",
        tags = {""},
        tiling = -1,
        type = 0,
        layer = 20,
        colour = c,
        colour_active = ac,
        sprite = "text_"..sprite
    }
end

addobj("buffer",{0,1},{0,3},4)
addobj("bsod",{4,3},{3,3},-1)
addobj("fan",{4,0},{4,1},4)
addobj("puzzle",{4,0},{4,2},-1)
addobj("pyramid",{6,1},{3,4},-1)
addobj("elec",{6,1},{2,4},1)
addobj("candle",{2,2},{2,3},-1)
addobj("music",{1,2},{1,4},-1)
addobj("blabla",{4,0},{4,1},0,{0,3})
addobj("hi!",{6,1},{6,2},0,{6,2},"hi")
addobj("bye?",{1,0},{4,0},0,{4,0},"bye")
addobj("the.",{0,1},{0,2},0,{0,2},"the")

addtext("crash",2,{2,1},{2,2})
addtext("eternal",2,{1,3},{1,4})
addtext("secure",2,{1,3},{1,4})

local letters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","?",".","!","+"}

addtext("draw",1,{0,1},{0,3},letters,{8})
addtext("jot",1,{0,1},{0,3},letters,{8})
addtext("type",1,{0,1},{0,3},letters,{8})
addtext("drew",1,{0,1},{0,3},letters,{8})
addtext("jotted",1,{0,1},{0,3},letters,{8})
addtext("typed",1,{0,1},{0,3},letters,{8})
addtext("willdraw",1,{0,1},{0,3},letters,{8})
addtext("willjot",1,{0,1},{0,3},letters,{8})
addtext("willtype",1,{0,1},{0,3},letters,{8})

addwatchpair("",{2,1},{2,2})
addwatchpair("2",{2,2},{2,3})
addwatchpair("3",{6,1},{2,4})

addtext("hidden",3,{3,2},{3,3})
addtext("petted",3,{3,1},{4,2})
addtext("static",3,{2,1},{2,2})
addtext("sleepy",3,{1,3},{1,4})
addtext("shiny",3,{6,1},{2,4})
addtext("curious",3,{0,1},{0,3})

addtext("toxic",2,{5,1},{5,4})
addtext("alkali",2,{4,1},{4,2})

addtext("as",7,{0,1},{0,3},{},{0})

addtext("pastprop",2,{3,3},{4,4})
addtext("present",2,{5,1},{5,4})
addtext("future",2,{6,1},{2,4})

addtext("was",1,{0,1},{0,3},{},{0,2})
addtext("had",1,{0,1},{0,3},{},{0})
addtext("made",1,{0,1},{0,3},{},{0})
addtext("wrote",1,{0,1},{0,3},{},{0,2})
addtext("ate",1,{2,1},{2,2},{},{0})
addtext("feared",1,{2,1},{2,2},{},{0})
addtext("mimicked",1,{2,1},{2,2},{},{0})
addtext("followed",1,{5,1},{5,3},{},{0})

addtext("will",5,{0,1},{0,3})
addtext("be",5,{0,1},{0,3})
addtext("have",5,{0,1},{0,3})

addtext("willbe",1,{0,1},{0,3},{},{0,2})
addtext("willhave",1,{0,1},{0,3},{},{0})
addtext("willmake",1,{0,1},{0,3},{},{0})
addtext("willwrite",1,{0,1},{0,3},{},{0,2})
addtext("willeat",1,{2,1},{2,2},{},{0})
addtext("willfear",1,{2,1},{2,2},{},{0})
addtext("willmimic",1,{2,1},{2,2},{},{0})
addtext("willfollow",1,{5,1},{5,3},{},{0})

addtext("keep",3,{3,0},{3,1})
addtext("reload",2,{3,0},{3,1})
addtext("return",2,{3,0},{3,1})

addtext("spindown",2,{4,3},{3,2})
addtext("spinright",2,{4,3},{3,2})
addtext("spinup",2,{4,3},{3,2})
addtext("spinleft",2,{4,3},{3,2})
addtext("despindown",2,{4,3},{3,2})
addtext("despinright",2,{4,3},{3,2})
addtext("despinup",2,{4,3},{3,2})
addtext("despinleft",2,{4,3},{3,2})

addtext("act",1,{3,3},{4,4},{},{0,2})
addtext("perform",1,{3,0},{3,1},{},{0})
addtext("acted",1,{3,3},{4,4},{},{0,2})
addtext("performed",1,{3,0},{3,1},{},{0})
addtext("willact",1,{3,3},{4,4},{},{0,2})
addtext("willperform",1,{3,0},{3,1},{},{0})

addtext("infect",2,{2,1},{2,2})
addtext("virus",2,{3,3},{4,4})

addtext("you+",2,{4,0},{4,1},{},{},false,"text_youplus")
addtext("puppet",2,{3,0},{3,1})

addtext("volt",2,{6,1},{2,4})

addtext("refers",7,{0,1},{0,3},{},{0,2})

addtext("one",3,{2,1},{2,2})
addtext("two",3,{5,1},{5,3})
addtext("three",3,{3,0},{3,1})
addtext("four",3,{1,3},{1,4})
addtext("five",3,{6,1},{2,4})
addtext("equal",7,{0,1},{0,3},{},{0})
addtext("lessthan",7,{0,1},{0,3},{},{0})
addtext("greaterthan",7,{0,1},{0,3},{},{0})

addtext("!",5,{0,1},{0,3},{},{},false,"text_exclamationmark")
addtext("?",5,{0,1},{0,3},{},{},false,"text_questionmark")
addtext(".",5,{0,1},{0,3},{},{},false,"text_period")
addtext("+",5,{0,1},{0,3},{},{},false,"text_plus")

addtext("power?",2,{0,0},{0,2},{},{},false,"text_powerany")
addtext("powered?",3,{0,0},{0,2},{},{},false,"text_poweredany")

addtext("original",7,{2,2},{2,3})

addtext("triggered",3,{4,0},{4,1})

addtext("leveled",7,{1,3},{1,4})

addtext("cancel",3,{2,1},{2,2})

table.insert(editor_objlist_order, "text_north")
editor_objlist["text_north"] = {
    name = "text_north",
    sprite_in_root = false,
    unittype = "text",
    tags = {"cardinal"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = {5, 3},
    colour_active = {5, 4},
}

table.insert(editor_objlist_order, "text_south")
editor_objlist["text_south"] = {
    name = "text_south",
    sprite_in_root = false,
    unittype = "text",
    tags = {"cardinal"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = {5, 3},
    colour_active = {5, 4},
}

table.insert(editor_objlist_order, "text_east")
editor_objlist["text_east"] = {
    name = "text_east",
    sprite_in_root = false,
    unittype = "text",
    tags = {"cardinal"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = {5, 3},
    colour_active = {5, 4},
}

table.insert(editor_objlist_order, "text_west")
editor_objlist["text_west"] = {
    name = "text_west",
    sprite_in_root = false,
    unittype = "text",
    tags = {"cardinal"},
    tiling = -1,
    type = 7,
    layer = 20,
    colour = {5, 3},
    colour_active = {5, 4},
}

table.insert(editor_objlist_order, "text_delete")
word_names["delete"] = "$2,2Not"
editor_objlist["text_delete"] = {
    name = "text_delete",
    unittype = "text",
    sprite_in_root = false,
    sprite = "text_not_prop",
    tags = { "text", "text_quality" },
    tiling = -1,
    type = 2,
    layer = 20,
    colour = { 2, 1 },
    colour_active = { 2, 2 },
}


table.insert(editor_objlist_order, "text_event")
table.insert(editor_objlist_order, "text_code")
table.insert(editor_objlist_order, "text_token")

editor_objlist["text_event"] =
{
    name = "text_event",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","abstract"},
    tiling = -1,
    type = 0,
    layer = 20,
    colour = {5, 2},
    colour_active = {5, 3},
}

editor_objlist["text_code"] =
{
    name = "text_code",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","abstract"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["text_token"] =
{
    name = "text_token",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","abstract"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {5, 2},
    colour_active = {5, 3},
}


table.insert(editor_objlist_order, "text_event_")

editor_objlist["text_event_"] =
{
    name = "text_event_",
    sprite = "text_eventpre",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","abstract"},
    tiling = -1,
    type = 4,
    layer = 20,
    colour = {5, 2},
    colour_active = {5, 3},
}

local vvvvvv = {"baba", "flag", "start", "destroy", "turn", "on", "become", "move", "tile", "event", "text", "level", "all",
                "code", "keke", "you", "win", "hot", "rock", "wall", "push", "stop", "melt", "water", "lava", "sink", "make", "box", "pull",
                "be", "key", "door", "open", "shut", "skull", "defeat", "grass", "belt", "shift", "as","brick","fire","flower","have","ice","leaf","me","orb","red","blue","yellow","tree", "fungus", "fungi",
                "hedge", "still", "nop", "fofo", "jiji", "it", "more", "statue", "pillar", "fence", "square", "star",
                "lonely", "power", "powered", "when", "halt",
                "group", "eat", "near", "never", "not",
                "backslash", "then", "forward", "backward", "aroundleft", "aroundright", "up", "down", "left", "right", "repeat", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}

local fakecolors = {}
fakecolors["destroy"] = {colour = {2,1}, colour_active = {2,2}}
fakecolors["halt"] = {colour = {2,1}, colour_active = {2,2}}
fakecolors["never"] = {colour = {2,1}, colour_active = {2,2}}
fakecolors["become"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["be"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["as"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["when"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["openparen"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["closeparen"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["start"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["have"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["backslash"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["then"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["repeat"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["goto"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["tab"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["if"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["press"] = {colour = {0,2}, colour_active = {0,3}}
fakecolors["nop"] = {colour = {0,1}, colour_active = {0,2}}
fakecolors["aroundleft"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["aroundright"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["forward"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["backward"] = {colour = {1,2}, colour_active = {1,4}}


fakecolors["func"] = {colour = {2,1}, colour_active = {2,2}}
fakecolors["func2"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["func3"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["def"] = {colour = {0,1}, colour_active = {0,3}}
fakecolors["break"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["tab"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["else"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["var_x"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["var_y"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["var_z"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["equals"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["plus"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["minus"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["times"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["over"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["percent"] = {colour = {0,1}, colour_active = {0,3}}
fakecolors["way"] = {colour = {1,2}, colour_active = {1,4}}
fakecolors["parse"] = {colour = {1,2}, colour_active = {1,4}}
for i, j in ipairs(vvvvvv) do
    local eventj = "event_" .. j
    table.insert(editor_objlist_order, eventj)
    if editor_objlist_reference["text_" .. j] ~= nil then
        local eref = editor_objlist[editor_objlist_reference["text_" .. j]]
        local tags = {"events"}
        for _,v in ipairs(eref.tags) do
            table.insert(tags, v)
        end
        editor_objlist[eventj] =
        {
            name = eventj,
            sprite_in_root = false,
            unittype = "text",
            tags = tags,
            tiling = -1,
            type = eref.type,
            layer = 20,
            colour = eref.colour,
            colour_active = eref.colour_active
        }
    elseif fakecolors[j] ~= nil then
        editor_objlist[eventj] =
        {
            name = eventj,
            sprite_in_root = false,
            unittype = "text",
            tags = {"text","abstract", "events"},
            tiling = -1,
            type = 9,
            layer = 20,
            colour = fakecolors[j].colour,
            colour_active = fakecolors[j].colour_active,
        }
    else
        editor_objlist[eventj] =
        {
            name = eventj,
            sprite_in_root = false,
            unittype = "text",
            tags = {"text","abstract", "events"},
            tiling = -1,
            type = 0,
            layer = 1,
            colour = {0,1},
            colour_active = {0,2},
        }
    end
end

NODE_LEGACY_PARSING = false

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
--table.insert(nlist.brief, "node")

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

-- Nouns
add_node(true, "baba", 0, { 4, 0 }, { 4, 1 })
add_node(true, "flag", 0, { 6, 1 }, { 2, 4 })
add_node(true, "rock", 0, { 6, 0 }, { 6, 1 })
add_node(true, "wall", 0, { 1, 1 }, { 0, 1 })
add_node(true, "keke", 0, { 2, 1 }, { 2, 2 })
add_node(true, "text", 0, { 4, 0 }, { 4, 1 })
add_node(true, "node", 0, { 6, 1 }, { 2, 4 })
add_node(true, "water", 0, { 1, 2 }, { 1, 3 })
add_node(true, "key", 0, { 6, 1 }, { 2, 4 })
add_node(true, "door", 0, { 2, 1 }, { 2, 2 })
if not NODE_LEGACY_PARSING then
    add_node(true,"ice", 0, {1, 2}, {1, 3})
    add_node(true,"tile", 0, {1, 1}, {0, 1})
    add_node(true,"box", 0, {6, 0}, {6, 1})
    add_node(true,"hedge", 0, {5, 0}, {5, 1})
    add_node(true,"level", 0, {4, 0}, {4, 1})
    add_node(true,"all", 0, {0, 1}, {0, 3})
end
-- Properties
add_node(true, "you", 2, { 4, 0 }, { 4, 1 })
add_node(true, "win", 2, { 6, 1 }, { 2, 4 })
add_node(true, "push", 2, { 6, 0 }, { 6, 1 })
add_node(true, "stop", 2, { 5, 0 }, { 5, 1 })
add_node(true, "dir", 2, { 1, 3 }, { 1, 4 })
add_node(true, "break", 2, { 2, 1 }, { 2, 2 })
add_node(true, "open", 2, { 6, 1 }, { 2, 4 })
add_node(true, "shut", 2, { 2, 1 }, { 2, 2 })
add_node(true, "move", 2, { 5, 1 }, { 5, 3 })
add_node(true, "sink", 2, { 1, 2 }, { 1, 3 })
add_node(true, "shift", 2, { 1, 2 }, { 1, 3 })
if not NODE_LEGACY_PARSING then
    --add_node("shift", 2, {1, 2}, {1, 3})
    add_node(true,"melt", 2, {1, 2}, {1, 3})
    add_node(true,"hot", 2, {2, 2}, {2, 3})
    add_node(true,"bonus", 2, {4, 0}, {4, 1})
end
-- Conditions
add_node(true, "lonely", 3, { 2, 1 }, { 2, 2 })
add_node(true, "on", 7, { 0, 1 }, { 0, 3 }, { 0 })
add_node(true, "facing", 7, { 0, 1 }, { 0, 3 }, { 0 }, { "up", "down", "left", "right" })
-- Verbs

if not NODE_LEGACY_PARSING then
    add_node(true,"is", 1, {0, 1}, {0, 3}, {0, 2})
end
add_node(true,"has", 1, {0, 1}, {0, 3}, {0})
add_node(true,"eat", 1, {2, 1}, {2, 2}, {0})
add_node(true,"mimic", 1, {2, 1}, {2, 2}, {0})
-- Miscellaneous
if NODE_LEGACY_PARSING then
    add_node(true,"and", 6, {0, 1}, {0, 3})
end
add_node(true,"not", 4, {2, 1}, {2, 2})
-- Nil
add_node(true,"nil", -1, {6, 1}, {2, 4})
if not NODE_LEGACY_PARSING then
    add_node(true,"nil_perp", -1, {6, 1}, {2, 4})
    add_node(true,"nil_branch", -1, {6, 1}, {2, 4})
    add_node(true,"nil_debranch", -1, {6, 1}, {2, 4})
    add_node(true,"nil_spread", -1, {6, 1}, {2, 4})
    add_node(true,"nil_bump", -1, {6, 1}, {2, 4})
    add_node(true,"nil_bump_perp", -1, {6, 1}, {2, 4})
    add_node(true,"nil_bump_branch", -1, {6, 1}, {2, 4})
    add_node(true,"nil_bump_debranch", -1, {6, 1}, {2, 4})
    add_node(true,"nil_bump_spread", -1, {6, 1}, {2, 4})
end

dirnames.dir = {"right", "up", "left", "down"} --use insertation method to avoid overwriting

table.insert(nlist.full, "event")
table.insert(nlist.short, "event")
table.insert(nlist.objects, "event")


table.insert(editor_objlist_order, "glyph_event")
table.insert(editor_objlist_order, "glyph_metaevent")
table.insert(editor_objlist_order, "glyph_event_")
table.insert(editor_objlist_order, "text_metaevent")
table.insert(editor_objlist_order, "node_event")
table.insert(editor_objlist_order, "glyph_node")
table.insert(editor_objlist_order, "glyph_metanode")
table.insert(editor_objlist_order, "glyph_node_")
table.insert(editor_objlist_order, "text_metanode")
table.insert(editor_objlist_order, "event_node")
table.insert(editor_objlist_order, "node_glyph")
table.insert(editor_objlist_order, "node_logic")
table.insert(editor_objlist_order, "text_metanot")
table.insert(editor_objlist_order, "glyph_metanot")
--table.insert(editor_objlist_order, "text_refers")
table.insert(editor_objlist_order, "glyph_refers")
table.insert(editor_objlist_order, "event_refers")
table.insert(editor_objlist_order, "node_refers")
table.insert(editor_objlist_order, "text__NONE_")
table.insert(objlistdata.alltags, "glyph")
table.insert(objlistdata.alltags, "events")
table.insert(objlistdata.alltags, "nodes")

table.insert(editor_objlist_order, "text_class")
editor_objlist["text_class"] = {
    name = "text_class",
    sprite_in_root = false,
    unittype = "text",
    tags = {"abstract","text"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {0, 2},
    colour_active = {0, 3}
}

editor_objlist["glyph_event"] =
{
    name = "glyph_event",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 2},
    colour_active = {5, 3},
}

editor_objlist["glyph_event_"] =
{
    name = "glyph_event_",
    sprite = "glyph_eventpre",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 3},
    colour_active = {5, 3},
}



editor_objlist["glyph_metaevent"] =
{
    name = "glyph_metaevent",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 3},
    colour_active = {5, 4},
}
editor_objlist["glyph_metanot"] =
{
    name = "glyph_metanot",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 1},
    colour_active = {2, 2},
}

editor_objlist["text_metanot"] =
{
    name = "text_metanot",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "abstract"},
    tiling = -1,
    type = -1,
    layer = 20,
    colour = {2, 0},
    colour_active = {2, 1},
}

editor_objlist["text_metanode"] =
{
    name = "text_metanode",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "abstract"},
    tiling = -1,
    type = -1,
    layer = 20,
    colour = {6, 1},
    colour_active = {2, 4},
}

editor_objlist["glyph_metanode"] =
{
    name = "glyph_metanode",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 4},
    colour_active = {0, 3},
}

editor_objlist["text_metaevent"] =
{
    name = "text_metaevent",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "abstract"},
    tiling = -1,
    type = -1,
    layer = 20,
    colour = {5, 2},
    colour_active = {5, 3},
}

editor_objlist["event_node"] =
{
    name = "event_node",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","abstract", "events"},
    tiling = -1,
    type = 0,
    layer = 20,
    colour = {6, 1},
    colour_active = {2, 4},
}

editor_objlist["glyph_node"] =
{
    name = "glyph_node",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {2, 4},
}

editor_objlist["glyph_node_"] =
{
    name = "glyph_node_",
    sprite = "glyph_nodepre",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 4},
    colour_active = {2, 4},
}

editor_objlist["text_refers"] =
{
    name = "text_refers",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","abstract"},
    tiling = -1,
    type = 7,
    layer = 1,
    colour = {1, 2},
    colour_active = {1, 4},
    argtype = {0,2,-1}
}

editor_objlist["glyph_refers"] =
{
    name = "glyph_refers",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 2},
    colour_active = {1, 4},
}

editor_objlist["event_refers"] =
{
    name = "event_refers",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","abstract", "events"},
    tiling = -1,
    type = 0,
    layer = 20,
    colour = {1, 2},
    colour_active = {1, 4},
}

editor_objlist["text__NONE_"] =
{
    name = "text__NONE_",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "abstract"},
    tiling = -1,
    type = 0,
    layer = 20,
    colour = {3, 2},
    colour_active = {3, 3},
}

add_node(false, "glyph", 0, {3, 2}, {3, 3})
add_node(false, "event", 0, {5, 2}, {5, 3})
add_node(false, "logic", 0, {3, 0}, {3, 1})
add_node(false, "refers", 7, {1, 2}, {1, 4}, {0, 2})

table.insert(editor_objlist_order, "glitch")
editor_objlist["glitch"] =
{
    name = "glitch",
    sprite_in_root = false,
    unittype = "object",
    tags = {"special", "btd456creeper mods"},
    tiling = 1,
    type = 0,
    layer = 30,
    colour = {0, 3},
}


table.insert(editor_objlist_order, "text_glyph")
table.insert(editor_objlist_order, "text_inscribe")
table.insert(editor_objlist_order, "text_symbol")
table.insert(editor_objlist_order, "text_metaglyph")
table.insert(editor_objlist_order, "text_metatext")
table.insert(editor_objlist_order, "text_become")
table.insert(editor_objlist_order, "glyph_glyph")
table.insert(editor_objlist_order, "glyph_baba")
table.insert(editor_objlist_order, "glyph_flag")
table.insert(editor_objlist_order, "glyph_keke")
table.insert(editor_objlist_order, "glyph_it")
table.insert(editor_objlist_order, "glyph_text")
table.insert(editor_objlist_order, "glyph_all")
table.insert(editor_objlist_order, "glyph_wall")
table.insert(editor_objlist_order, "glyph_skull")
table.insert(editor_objlist_order, "glyph_empty")
table.insert(editor_objlist_order, "glyph_level")
table.insert(editor_objlist_order, "glyph_me")
table.insert(editor_objlist_order, "glyph_fofo")
table.insert(editor_objlist_order, "glyph_water")
table.insert(editor_objlist_order, "glyph_badbad")
table.insert(editor_objlist_order, "glyph_jiji")
table.insert(editor_objlist_order, "glyph_box")
table.insert(editor_objlist_order, "glyph_lava")
table.insert(editor_objlist_order, "glyph_bog")
table.insert(editor_objlist_order, "glyph_door")
table.insert(editor_objlist_order, "glyph_key")
table.insert(editor_objlist_order, "glyph_hedge")
table.insert(editor_objlist_order, "glyph_belt")
table.insert(editor_objlist_order, "glyph_rock")
table.insert(editor_objlist_order, "glyph_boat")
table.insert(editor_objlist_order, "glyph_toometa")
table.insert(editor_objlist_order, "glyph_line")
table.insert(editor_objlist_order, "glyph_arrow")
table.insert(editor_objlist_order, "glyph_cursor")
table.insert(editor_objlist_order, "glyph_sign")
table.insert(editor_objlist_order, "glyph_tile")
table.insert(editor_objlist_order, "glyph_grass")
table.insert(editor_objlist_order, "glyph_robot")
table.insert(editor_objlist_order, "glyph_monster")
table.insert(editor_objlist_order, "glyph_eye")
table.insert(editor_objlist_order, "glyph_jelly")
table.insert(editor_objlist_order, "glyph_cliff")
table.insert(editor_objlist_order, "glyph_love")
table.insert(editor_objlist_order, "glyph_cheese")
table.insert(editor_objlist_order, "glyph_orb")
table.insert(editor_objlist_order, "glyph_ghost")
table.insert(editor_objlist_order, "glyph_arm")
table.insert(editor_objlist_order, "glyph_hand")
table.insert(editor_objlist_order, "glyph_circle")
table.insert(editor_objlist_order, "glyph_square")
table.insert(editor_objlist_order, "glyph_donut")
table.insert(editor_objlist_order, "glyph_cake")
table.insert(editor_objlist_order, "glyph_gem")
table.insert(editor_objlist_order, "glyph_pipe")
table.insert(editor_objlist_order, "glyph_triangle")
table.insert(editor_objlist_order, "glyph_burger")
table.insert(editor_objlist_order, "glyph_foot")
table.insert(editor_objlist_order, "glyph_sun")
table.insert(editor_objlist_order, "glyph_spike")
table.insert(editor_objlist_order, "glyph_star")
table.insert(editor_objlist_order, "glyph_moon")
table.insert(editor_objlist_order, "glyph_win")
table.insert(editor_objlist_order, "glyph_not")
table.insert(editor_objlist_order, "glyph_you")
table.insert(editor_objlist_order, "glyph_bonus")
table.insert(editor_objlist_order, "glyph_defeat")
table.insert(editor_objlist_order, "glyph_stop")
table.insert(editor_objlist_order, "glyph_sink")
table.insert(editor_objlist_order, "glyph_float")
table.insert(editor_objlist_order, "glyph_push")
table.insert(editor_objlist_order, "glyph_still")
table.insert(editor_objlist_order, "glyph_you2")
table.insert(editor_objlist_order, "glyph_tele")
table.insert(editor_objlist_order, "glyph_shut")
table.insert(editor_objlist_order, "glyph_open")
table.insert(editor_objlist_order, "glyph_pull")
table.insert(editor_objlist_order, "glyph_3d")
table.insert(editor_objlist_order, "glyph_melt")
table.insert(editor_objlist_order, "glyph_hot")
table.insert(editor_objlist_order, "glyph_turn")
table.insert(editor_objlist_order, "glyph_deturn")
table.insert(editor_objlist_order, "glyph_shift")
table.insert(editor_objlist_order, "glyph_move")
table.insert(editor_objlist_order, "glyph_weak")
table.insert(editor_objlist_order, "glyph_word")
table.insert(editor_objlist_order, "glyph_swap")
table.insert(editor_objlist_order, "glyph_hide")
table.insert(editor_objlist_order, "glyph_symbol")
table.insert(editor_objlist_order, "glyph_red")
table.insert(editor_objlist_order, "glyph_select")
table.insert(editor_objlist_order, "glyph_more")
table.insert(editor_objlist_order, "glyph_chill")
table.insert(editor_objlist_order, "glyph_revert")
table.insert(editor_objlist_order, "glyph_createall")
table.insert(editor_objlist_order, "glyph_end")
table.insert(editor_objlist_order, "glyph_up")
table.insert(editor_objlist_order, "glyph_down")
table.insert(editor_objlist_order, "glyph_left")
table.insert(editor_objlist_order, "glyph_right")
table.insert(editor_objlist_order, "glyph_best")
table.insert(editor_objlist_order, "glyph_fallright")
table.insert(editor_objlist_order, "glyph_fallleft")
table.insert(editor_objlist_order, "glyph_fallup")
table.insert(editor_objlist_order, "glyph_falldown")
table.insert(editor_objlist_order, "glyph_power")
table.insert(editor_objlist_order, "glyph_auto")
table.insert(editor_objlist_order, "glyph_blue")
table.insert(editor_objlist_order, "glyph_safe")
table.insert(editor_objlist_order, "glyph_crash")
table.insert(editor_objlist_order, "glyph_lockedup")
table.insert(editor_objlist_order, "glyph_lockeddown")
table.insert(editor_objlist_order, "glyph_lockedleft")
table.insert(editor_objlist_order, "glyph_lockedright")
table.insert(editor_objlist_order, "glyph_sleep")
table.insert(editor_objlist_order, "glyph_lonely")
table.insert(editor_objlist_order, "glyph_powered")
table.insert(editor_objlist_order, "glyph_seldom")
table.insert(editor_objlist_order, "glyph_near")
table.insert(editor_objlist_order, "glyph_on")
table.insert(editor_objlist_order, "glyph_nextto")
table.insert(editor_objlist_order, "glyph_feeling")
table.insert(editor_objlist_order, "glyph_become")
table.insert(editor_objlist_order, "glyph_has")
table.insert(editor_objlist_order, "glyph_write")
table.insert(editor_objlist_order, "glyph_is")
table.insert(editor_objlist_order, "glyph_inscribe")
table.insert(editor_objlist_order, "glyph_eat")
table.insert(editor_objlist_order, "glyph_make")
table.insert(editor_objlist_order, "glyph_and")
table.insert(editor_objlist_order, "glyph_metaglyph")
table.insert(editor_objlist_order, "glyph_metatext")
table.insert(editor_objlist_order, "glyph_group")
table.insert(editor_objlist_order, "glyph_group2")
table.insert(editor_objlist_order, "glyph__NONE_")
table.insert(editor_objlist_order, "glyph_group3")
table.insert(editor_objlist_order, "toometa")
table.insert(editor_objlist_order, "text_toometa")
table.insert(editor_objlist_order, "text_glyph_")
table.insert(editor_objlist_order, "glyph_text_")
table.insert(editor_objlist_order, "glyph_glyph_")

editor_objlist["text_glyph"] =
{
    name = "text_glyph",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 20,
    colour = {3, 2},
    colour_active = {3, 3},
}

editor_objlist["text_glyph_"] =
{
    name = "text_glyph_",
    sprite = "text_glyphpre",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","abstract", "glyph"},
    tiling = -1,
    type = 4,
    layer = 20,
    colour = {3, 2},
    colour_active = {3, 3},
}

editor_objlist["glyph_text_"] =
{
    name = "glyph_text_",
    sprite = "glyph_textpre",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 1},
    colour_active = {4, 1},
}

editor_objlist["glyph_glyph_"] =
{
    name = "glyph_glyph_",
    sprite = "glyph_glyphpre",
    sprite_in_root = false,
    unittype = "object",
    tags = {"text","abstract", "glyph"},
    tiling = -1,
    type = 4,
    layer = 1,
    colour = {3, 3},
    colour_active = {3, 3},
}

editor_objlist["text_symbol"] =
{
    name = "text_symbol",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","abstract", "glyph"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 1},
    colour_active = {4, 3},
}

editor_objlist["glyph_glyph"] =
{
    name = "glyph_glyph",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 2},
    colour_active = {3, 3},
}
editor_objlist["glyph_it"] =
{
    name = "glyph_it",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 2},
    colour_active = {1, 4},
}


editor_objlist["glyph_baba"] =
{
    name = "glyph_baba",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_not"] =
{
    name = "glyph_not",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 2,
    colour = {2, 1},
    colour_active = {2, 2},
}

editor_objlist["glyph_you"] =
{
    name = "glyph_you",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 0},
    colour_active = {4, 1},
}

editor_objlist["glyph_bonus"] =
{
    name = "glyph_bonus",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 0},
    colour_active = {4, 1},
}

editor_objlist["glyph_win"] =
{
    name = "glyph_win",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {2, 4},
}


editor_objlist["glyph_flag"] =
{
    name = "glyph_flag",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {2, 4},
}

editor_objlist["glyph_text"] =
{
    name = "glyph_text",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 0},
    colour_active = {4, 1},
}

editor_objlist["glyph_keke"] =
{
    name = "glyph_keke",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 1},
    colour_active = {2, 2},
}

editor_objlist["glyph_all"] =
{
    name = "glyph_all",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_become"] =
{
    name = "glyph_become",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = 0,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_write"] =
{
    name = "glyph_write",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = 0,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_defeat"] =
{
    name = "glyph_defeat",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 0},
    colour_active = {2, 1},
}

editor_objlist["glyph_stop"] =
{
    name = "glyph_stop",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 0},
    colour_active = {2, 1},
}

editor_objlist["glyph_wall"] =
{
    name = "glyph_wall",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 1},
    colour_active = {0, 1},
}


editor_objlist["glyph_sink"] =
{
    name = "glyph_sink",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 2},
    colour_active = {1, 3},
}

editor_objlist["glyph_float"] =
{
    name = "glyph_float",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 2},
    colour_active = {1, 4},
}

editor_objlist["glyph_push"] =
{
    name = "glyph_push",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 0},
    colour_active = {6, 1},
}

editor_objlist["glyph_skull"] =
{
    name = "glyph_skull",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 0},
    colour_active = {2, 1},
    sprite = "glyph_skull"
}
editor_objlist["glyph_and"] =
{
    name = "glyph_and",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {0, 2},
    colour_active = {0, 3},
}
editor_objlist["glyph_empty"] =
{
    name = "glyph_empty",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}
editor_objlist["glyph_level"] =
{
    name = "glyph_level",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 0},
    colour_active = {4, 1},
}
editor_objlist["glyph_still"] =
{
    name = "glyph_still",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 0},
    colour_active = {2, 1},
}
editor_objlist["glyph_you2"] =
{
    name = "glyph_you2",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 0},
    colour_active = {4, 1},
}
editor_objlist["glyph_metaglyph"] =
{
    name = "glyph_metaglyph",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 3},
    colour_active = {4, 4},
}
editor_objlist["glyph_metatext"] =
{
    name = "glyph_metatext",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 1},
    colour_active = {4, 2},
}
editor_objlist["glyph_me"] =
{
    name = "glyph_me",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 0},
    colour_active = {3, 1},
}
editor_objlist["glyph_fofo"] =
{
    name = "glyph_fofo",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 1},
    colour_active = {5, 2},
}

editor_objlist["glyph_water"] =
{
    name = "glyph_water",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 2},
    colour_active = {1, 3},
}

editor_objlist["glyph_badbad"] =
{
    name = "glyph_badbad",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 3},
    colour_active = {1, 4},
}

editor_objlist["glyph_group"] =
{
    name = "glyph_group",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 2},
    colour_active = {3, 3},
}

editor_objlist["glyph_tele"] =
{
    name = "glyph_tele",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 2},
    colour_active = {1, 4},
}

editor_objlist["glyph_jiji"] =
{
    name = "glyph_jiji",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 2},
    colour_active = {2, 3},
}

editor_objlist["glyph_box"] =
{
    name = "glyph_box",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 0},
    colour_active = {6, 1},
}

editor_objlist["glyph_shut"] =
{
    name = "glyph_shut",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 1},
    colour_active = {2, 2},
}

editor_objlist["glyph_open"] =
{
    name = "glyph_open",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {2, 4},
}

editor_objlist["glyph_lava"] =
{
    name = "glyph_lava",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 2},
    colour_active = {2, 3},
}

editor_objlist["glyph_bog"] =
{
    name = "glyph_bog",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 1},
    colour_active = {5, 3},
}


editor_objlist["glyph_pull"] =
{
    name = "glyph_pull",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {6, 2},
}

editor_objlist["glyph_3d"] =
{
    name = "glyph_3d",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 0},
    colour_active = {4, 1},
}

editor_objlist["glyph_melt"] =
{
    name = "glyph_melt",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 2},
    colour_active = {1, 3},
}

editor_objlist["glyph_hot"] =
{
    name = "glyph_hot",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 2},
    colour_active = {2, 3},
}

editor_objlist["glyph_key"] =
{
    name = "glyph_key",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {2, 4},
    sprite = "glyph_key"
}

editor_objlist["glyph_door"] =
{
    name = "glyph_door",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 1},
    colour_active = {2, 2},
}

editor_objlist["glyph_hedge"] =
{
    name = "glyph_hedge",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 0},
    colour_active = {5, 1},
}

editor_objlist["glyph_lonely"] =
{
    name = "glyph_lonely",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 1},
    colour_active = {2, 2},
}

editor_objlist["glyph_near"] =
{
    name = "glyph_near",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_turn"] =
{
    name = "glyph_turn",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 2},
    colour_active = {1, 4},
}

editor_objlist["glyph_deturn"] =
{
    name = "glyph_deturn",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 2},
    colour_active = {1, 4},
}

editor_objlist["glyph_shift"] =
{
    name = "glyph_shift",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 2},
    colour_active = {1, 3},
}

editor_objlist["glyph_move"] =
{
    name = "glyph_move",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 1},
    colour_active = {5, 3},
}

editor_objlist["glyph_weak"] =
{
    name = "glyph_weak",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 1},
    colour_active = {1, 2},
}

editor_objlist["glyph_belt"] =
{
    name = "glyph_belt",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 2},
    colour_active = {1, 3},
}

-- write

editor_objlist["glyph_rock"] =
{
    name = "glyph_rock",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 0},
    colour_active = {6, 1},
}

editor_objlist["glyph_has"] =
{
    name = "glyph_has",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = 0,
    type = 0,
    layer = 1,
    colour = {6, 0},
    colour_active = {6, 1},
}

editor_objlist["glyph_word"] =
{
    name = "glyph_word",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_group2"] =
{
    name = "glyph_group2",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 1},
    colour_active = {2, 2},
}

editor_objlist["glyph_boat"] =
{
    name = "glyph_boat",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {6, 2},
}

editor_objlist["toometa"] =
{
    name = "toometa",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {0, 3},
}

editor_objlist["text_toometa"] =
{
    name = "text_toometa",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_toometa"] =
{
    name = "glyph_toometa",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_line"] =
{
    name = "glyph_line",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_arrow"] =
{
    name = "glyph_arrow",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 1},
    colour_active = {5, 2},
}

editor_objlist["glyph_cursor"] =
{
    name = "glyph_cursor",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 0},
    colour_active = {4, 2},
}

editor_objlist["glyph_sign"] =
{
    name = "glyph_sign",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {6, 2},
}

editor_objlist["glyph_tile"] =
{
    name = "glyph_tile",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 1},
    colour_active = {0, 1},
}

editor_objlist["glyph_grass"] =
{
    name = "glyph_grass",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 1},
    colour_active = {5, 3},
}

editor_objlist["glyph_robot"] =
{
    name = "glyph_robot",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 1},
    colour_active = {0, 1},
}

editor_objlist["glyph_monster"] =
{
    name = "glyph_monster",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 0},
    colour_active = {4, 1},
}

editor_objlist["glyph_eye"] =
{
    name = "glyph_eye",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 1},
    colour_active = {4, 2},
}

editor_objlist["glyph_jelly"] =
{
    name = "glyph_jelly",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 3},
    colour_active = {1, 4},
}

editor_objlist["glyph_cliff"] =
{
    name = "glyph_cliff",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 0},
    colour_active = {6, 2},
}

editor_objlist["glyph_swap"] =
{
    name = "glyph_swap",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 0},
    colour_active = {3, 1},
}

editor_objlist["glyph_hide"] =
{
    name = "glyph_hide",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 2},
    colour_active = {3, 3},
}

editor_objlist["glyph_is"] =
{
    name = "glyph_is",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = 0,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}
editor_objlist["glyph_symbol"] =
{
    name = "glyph_symbol",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 1},
    colour_active = {4, 3},
}

editor_objlist["text_inscribe"] =
{
    name = "text_inscribe",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","abstract", "glyph"},
    tiling = -1,
    type = 1,
    layer = 20,
    argtype = {0,2},
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_red"] =
{
    name = "glyph_red",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 1},
    colour_active = {2, 2},
}

editor_objlist["glyph_on"] =
{
    name = "glyph_on",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_nextto"] =
{
    name = "glyph_nextto",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_select"] =
{
    name = "glyph_select",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 3},
    colour_active = {2, 4},
}

editor_objlist["glyph_love"] =
{
    name = "glyph_love",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 1},
    colour_active = {4, 2},
}

editor_objlist["glyph_more"] =
{
    name = "glyph_more",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 0},
    colour_active = {4, 1},
}

editor_objlist["glyph_inscribe"] =
{
    name = "glyph_inscribe",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = 0,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 2},
}

editor_objlist["text_metaglyph"] =
{
    name = "text_metaglyph",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "abstract", "glyph"},
    tiling = -1,
    type = -1,
    layer = 20,
    colour = {3, 2},
    colour_active = {3, 3},
}

editor_objlist["text_metatext"] =
{
    name = "text_metatext",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "abstract", "glyph"},
    tiling = -1,
    type = -1,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}

editor_objlist["text_become"] =
{
    name = "text_become",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "abstract", "glyph"},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_feeling"] =
{
    name = "glyph_feeling",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {2, 4},
}

editor_objlist["glyph_cheese"] =
{
    name = "glyph_cheese",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {2, 4},
}

editor_objlist["glyph_eat"] =
{
    name = "glyph_eat",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = 0,
    type = 0,
    layer = 1,
    colour = {0, 0},
    colour_active = {0, 1},
}

editor_objlist["glyph_orb"] =
{
    name = "glyph_orb",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 0},
    colour_active = {4, 1},
}

editor_objlist["glyph_chill"] =
{
    name = "glyph_chill",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 2},
    colour_active = {3, 3},
}

editor_objlist["glyph_revert"] =
{
    name = "glyph_revert",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 2},
    colour_active = {2, 3},
}

editor_objlist["glyph_createall"] =
{
    name = "glyph_createall",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 20,
    colour = {2, 2},
    colour_active = {2, 3},
    sprite = "glyph_all"
}

editor_objlist["glyph__NONE_"] =
{
    name = "glyph__NONE_",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 2},
    colour_active = {3, 3},
}

editor_objlist["glyph_end"] =
{
    name = "glyph_end",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_ghost"] =
{
    name = "glyph_ghost",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 1},
    colour_active = {4, 2},
}

editor_objlist["glyph_up"] =
{
    name = "glyph_up",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 3},
    colour_active = {1, 4},
}

editor_objlist["glyph_down"] =
{
    name = "glyph_down",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 3},
    colour_active = {1, 4},
}

editor_objlist["glyph_right"] =
{
    name = "glyph_right",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 3},
    colour_active = {1, 4},
}

editor_objlist["glyph_left"] =
{
    name = "glyph_left",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 3},
    colour_active = {1, 4},
}

editor_objlist["glyph_best"] =
{
    name = "glyph_best",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 3},
    colour_active = {2, 4},
}

editor_objlist["glyph_fallright"] =
{
    name = "glyph_fallright",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 1},
    colour_active = {5, 3},
}

editor_objlist["glyph_fallleft"] =
{
    name = "glyph_fallleft",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 1},
    colour_active = {5, 3},
}

editor_objlist["glyph_fallup"] =
{
    name = "glyph_fallup",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 1},
    colour_active = {5, 3},
}

editor_objlist["glyph_falldown"] =
{
    name = "glyph_falldown",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 1},
    colour_active = {5, 3},
}

editor_objlist["glyph_make"] =
{
    name = "glyph_make",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = 0,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 2},
}

editor_objlist["glyph_power"] =
{
    name = "glyph_power",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {2, 4},
}

editor_objlist["glyph_powered"] =
{
    name = "glyph_powered",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {2, 4},
}

editor_objlist["glyph_arm"] =
{
    name = "glyph_arm",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 0},
    colour_active = {3, 1},
}

editor_objlist["glyph_hand"] =
{
    name = "glyph_hand",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 0},
    colour_active = {3, 1},
}

editor_objlist["glyph_circle"] =
{
    name = "glyph_circle",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 1},
    colour_active = {5, 3},
}

editor_objlist["glyph_square"] =
{
    name = "glyph_square",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 0},
    colour_active = {4, 1},
}

editor_objlist["glyph_donut"] =
{
    name = "glyph_donut",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 1},
    colour_active = {4, 2},
}

editor_objlist["glyph_cake"] =
{
    name = "glyph_cake",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 1},
    colour_active = {4, 2},
}

editor_objlist["glyph_group3"] =
{
    name = "glyph_group3",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {5, 2},
    colour_active = {5, 3},
}

editor_objlist["glyph_gem"] =
{
    name = "glyph_gem",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 1},
    colour_active = {4, 2},
}

editor_objlist["glyph_pipe"] =
{
    name = "glyph_pipe",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 1},
    colour_active = {0, 1},
}

editor_objlist["glyph_auto"] =
{
    name = "glyph_auto",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 0},
    colour_active = {4, 1},
}

editor_objlist["glyph_triangle"] =
{
    name = "glyph_triangle",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 2},
    colour_active = {3, 3},
}

editor_objlist["glyph_blue"] =
{
    name = "glyph_blue",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 2},
    colour_active = {3, 3},
    sprite = "glyph_red",
}

editor_objlist["glyph_safe"] =
{
    name = "glyph_safe",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {0, 1},
    colour_active = {0, 3},
}

editor_objlist["glyph_burger"] =
{
    name = "glyph_burger",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {2, 3},
}

editor_objlist["glyph_foot"] =
{
    name = "glyph_foot",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 0},
    colour_active = {3, 1},
}

editor_objlist["glyph_crash"] =
{
    name = "glyph_crash",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 0},
    colour_active = {4, 1},
}

editor_objlist["glyph_sun"] =
{
    name = "glyph_sun",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {2, 3},
    colour_active = {2, 4},
}

editor_objlist["glyph_spike"] =
{
    name = "glyph_spike",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {1, 1},
    colour_active = {0, 1},
}

editor_objlist["glyph_star"] =
{
    name = "glyph_star",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {2, 4},
}

editor_objlist["glyph_moon"] =
{
    name = "glyph_moon",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {6, 1},
    colour_active = {2, 4},
}

editor_objlist["glyph_lockedright"] =
{
    name = "glyph_lockedright",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 1},
    colour_active = {4, 2},
}

editor_objlist["glyph_lockedleft"] =
{
    name = "glyph_lockedleft",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 1},
    colour_active = {4, 2},
}

editor_objlist["glyph_lockedup"] =
{
    name = "glyph_lockedup",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 1},
    colour_active = {4, 2},
}

editor_objlist["glyph_lockeddown"] =
{
    name = "glyph_lockeddown",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 1},
    colour_active = {4, 2},
}

editor_objlist["glyph_seldom"] =
{
    name = "glyph_seldom",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 2},
    colour_active = {3, 3},
}

editor_objlist["glyph_sleep"] =
{
    name = "glyph_sleep",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {4, 3},
    colour_active = {3, 2},
}

table.insert(editor_objlist_order, "text_offline")
table.insert(editor_objlist_order, "text_router")
table.insert(editor_objlist_order, "text_local")
table.insert(editor_objlist_order, "text_channel1")
table.insert(editor_objlist_order, "text_channel2")
table.insert(editor_objlist_order, "text_channel3")
table.insert(editor_objlist_order, "text_offline1")
table.insert(editor_objlist_order, "text_offline2")
table.insert(editor_objlist_order, "text_offline3")
table.insert(editor_objlist_order, "text_local1")
table.insert(editor_objlist_order, "text_local2")
table.insert(editor_objlist_order, "text_local3")

editor_objlist["text_channel1"] =
{
    name = "text_channel1",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality", "local mod"},
    tiling = -1,
    type = 2,
    layer = 19,
    colour = {2, 0},
    colour_active = {2, 1},
}
editor_objlist["text_offline1"] =
{
    name = "text_offline1",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality", "local mod"},
    tiling = -1,
    type = 2,
    layer = 19,
    colour = {2, 0},
    colour_active = {2, 1},
}
editor_objlist["text_offline2"] =
{
    name = "text_offline2",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality", "local mod"},
    tiling = -1,
    type = 2,
    layer = 19,
    colour = {2, 3},
    colour_active = {2, 4},
}
editor_objlist["text_channel2"] =
{
    name = "text_channel2",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality", "local mod"},
    tiling = -1,
    type = 2,
    layer = 19,
    colour = {2, 3},
    colour_active = {2, 4},
}
editor_objlist["text_channel3"] =
{
    name = "text_channel3",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality", "local mod"},
    tiling = -1,
    type = 2,
    layer = 19,
    colour = {4, 3},
    colour_active = {4, 4},
}
editor_objlist["text_offline3"] =
{
    name = "text_offline3",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality", "local mod"},
    tiling = -1,
    type = 2,
    layer = 19,
    colour = {4, 3},
    colour_active = {4, 4},
}
editor_objlist["text_router"] =
{
    name = "text_router",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality", "local mod"},
    tiling = -1,
    type = 2,
    layer = 19,
    colour = {1, 2},
    colour_active = {1, 3},
}
editor_objlist["text_offline"] =
{
    name = "text_offline",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_quality", "local mod"},
    tiling = -1,
    type = 2,
    layer = 19,
    colour = {6, 1},
    colour_active = {2, 3},
}

editor_objlist["text_local"] =
{
    name = "text_local",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_condition", "local mod", "text_prefix"},
    tiling = -1,
    type = 3,
    layer = 19,
    colour = {0, 2},
    colour_active = {1, 3},
}
editor_objlist["text_local1"] =
{
    name = "text_local1",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_condition", "local mod", "text_prefix"},
    tiling = -1,
    type = 3,
    layer = 19,
    colour = {2, 0},
    colour_active = {2, 1},
}
editor_objlist["text_local2"] =
{
    name = "text_local2",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_condition", "local mod", "text_prefix"},
    tiling = -1,
    type = 3,
    layer = 19,
    colour = {2, 3},
    colour_active = {2, 4},
}
editor_objlist["text_local3"] =
{
    name = "text_local3",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text","text_condition", "local mod", "text_prefix"},
    tiling = -1,
    type = 3,
    layer = 19,
    colour = {4, 3},
    colour_active = {4, 4},
}

add_glyph_using_text("offline")
add_glyph_using_text("router")
add_glyph_using_text("local")
add_glyph_using_text("channel1")
add_glyph_using_text("channel2")
add_glyph_using_text("channel3")
add_glyph_using_text("offline1")
add_glyph_using_text("offline2")
add_glyph_using_text("offline3")
add_glyph_using_text("local1")
add_glyph_using_text("local2")
add_glyph_using_text("local3")

table.insert(objlistdata.alltags, "logics")

table.insert(editor_objlist_order, "text_logic")

editor_objlist["text_logic"] =
{
    name = "text_logic",
    sprite_in_root = false,
    unittype = "text",
    tags = {"logics","text", "abstract"},
    tiling = -1,
    type = 0,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}

add_glyph_using_text("logic")

table.insert(editor_objlist_order, "text_logic_")

editor_objlist["text_logic_"] =
{
    name = "text_logic_",
    sprite = "text_logicpre",
    sprite_in_root = false,
    unittype = "text",
    tags = {"logics","text", "abstract"},
    tiling = -1,
    type = 4,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}

table.insert(editor_objlist_order, "text_metalogic")

editor_objlist["text_metalogic"] =
{
    name = "text_metalogic",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "abstract", "glyph","logics"},
    tiling = -1,
    type = -1,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}

table.insert(editor_objlist_order, "glyph_metalogic")

editor_objlist["glyph_metalogic"] =
{
    name = "glyph_metalogic",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph", "logics"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 0},
    colour_active = {3, 1},
}

table.insert(editor_objlist_order, "glyph_logic_")

editor_objlist["glyph_logic_"] =
{
    name = "glyph_logic_",
    sprite = "glyph_logicpre",
    sprite_in_root = false,
    unittype = "object",
    tags = {"abstract", "glyph", "logics"},
    tiling = -1,
    type = 0,
    layer = 1,
    colour = {3, 0},
    colour_active = {3, 1},
}

table.insert(editor_objlist_order, "text_log")

editor_objlist["text_log"] =
{
    name = "text_log",
    sprite_in_root = false,
    unittype = "text",
    tags = {""},
    tiling = -1,
    type = 1,
    layer = 20,
    colour = {0, 1},
    colour_active = {0, 3},
    argtype = {0, 2}
}

table.insert(nlist.full, "logic")
table.insert(nlist.short, "logic")
table.insert(nlist.objects, "logic")

logic_types = {}
logic_argtypes = {}

function addlogic(name,type,col,acol,argtype,tiling)
    local logicname = "logic_"..name

    logic_types[logicname] = type
    logic_argtypes[logicname] = argtype

    table.insert(editor_objlist_order, logicname)

    editor_objlist[logicname] =
    {
        name = logicname,
        sprite_in_root = false,
        unittype = "logic",
        tags = {"logics"},
        tiling = tiling,
        type = 0,
        layer = 20,
        colour = col,
        colour_active = acol,
    }
end

--start
addlogic("start",4,{3,3},{4,4},{},0)
addlogic("omnistart",10,{3,0},{4,2},{},-1)

--connecters
addlogic("connect",-1,{0,1},{0,3},{},0)
addlogic("omniconnect",9,{0,1},{0,3},{},-1)
addlogic("longconnect",-4,{0,1},{0,3},{},0)
addlogic("omnilongconnect",13,{0,1},{0,3},{},-1)

--wireless connecters
addlogic("send",-3,{3,2},{3,3},{},-1)
addlogic("recieve",-2,{3,2},{3,3},{},-1)
addlogic("send2",-3,{2,1},{2,2},{},-1)
addlogic("recieve2",-2,{2,1},{2,2},{},-1)
addlogic("send3",-3,{5,2},{5,3},{},-1)
addlogic("recieve3",-2,{5,2},{5,3},{},-1)

--verbs
addlogic("is",1,{0,1},{0,3},{0,2},-1)
addlogic("has",1,{0,1},{0,3},{0},-1)
addlogic("eat",1,{2,1},{2,2},{0},-1)
addlogic("fear",1,{2,1},{2,2},{0},-1)
addlogic("follow",1,{5,1},{5,3},{0},-1)
addlogic("make",1,{0,1},{0,3},{0},-1)
addlogic("mimic",1,{2,1},{2,2},{0},-1)
addlogic("write",1,{0,1},{0,3},{0,2},-1)
addlogic("log",1,{0,1},{0,3},{0,2},-1)

--prefixes
addlogic("idle",6,{2,2},{2,3},{},-1)
addlogic("lonely",6,{2,1},{2,2},{},-1)
addlogic("often",6,{5,2},{5,3},{},-1)
addlogic("seldom",6,{3,2},{3,3},{},-1)
addlogic("powered",6,{6,1},{2,4},{},-1)
addlogic("powered2",6,{5,2},{5,3},{},-1)
addlogic("powered3",6,{3,2},{4,4},{},-1)

--infixes
addlogic("on",3,{0,1},{0,3},{0},-1)
addlogic("near",3,{0,1},{0,3},{0},-1)
addlogic("nextto",3,{0,1},{0,3},{0},-1)
addlogic("facing",3,{0,1},{0,3},{0},-1)
addlogic("seeing",3,{0,1},{0,3},{0},-1)
addlogic("without",3,{0,1},{0,3},{0},-1)
addlogic("feeling",3,{0,1},{0,3},{2},-1)
addlogic("above",3,{1,2},{1,4},{0},-1)
addlogic("below",3,{1,2},{1,4},{0},-1)
addlogic("besideleft",3,{1,2},{1,4},{0},-1)
addlogic("besideright",3,{1,2},{1,4},{0},-1)

--boolean
addlogic("true",5,{5,1},{5,3},{},0)
addlogic("omnitrue",8,{1,2},{1,4},{},-1)
addlogic("false",5,{2,1},{2,2},{},0)
addlogic("omnifalse",8,{2,2},{2,3},{},-1)

--not
addlogic("not",7,{2,1},{2,2},{},-1)

--halt
addlogic("halt",11,{2,0},{2,1},{},0)
addlogic("omnihalt",12,{2,1},{2,2},{},-1)

--special nouns
addlogic("logic",0,{3,0},{3,1},{},-1)
addlogic("text",0,{4,0},{4,1},{},-1)
addlogic("event",0,{5,2},{5,3},{},-1)
addlogic("node",0,{6,1},{2,4},{},-1)
addlogic("glyph",0,{3,2},{3,3},{},-1)
addlogic("all",0,{0,1},{0,3},{},-1)
addlogic("level",0,{4,0},{4,1},{},-1)
addlogic("group",0,{3,2},{3,3},{},-1)
addlogic("group2",0,{2,1},{2,2},{},-1)
addlogic("group3",0,{5,2},{5,3},{},-1)
addlogic("empty",0,{0,1},{0,3},{},-1)
addlogic("cursor",0,{2,3},{2,4},{},-1)

--normal nouns
addlogic("baba",0,{4,0},{4,1},{},-1)
addlogic("flag",0,{6,1},{2,4},{},-1)
addlogic("wall",0,{1,1},{0,1},{},-1)
addlogic("rock",0,{6,0},{6,1},{},-1)
addlogic("brick",0,{6,0},{6,1},{},-1)
addlogic("tile",0,{1,1},{0,1},{},-1)
addlogic("grass",0,{5,1},{5,3},{},-1)
addlogic("hedge",0,{5,0},{5,1},{},-1)
addlogic("water",0,{1,2},{1,3},{},-1)
addlogic("lava",0,{2,2},{2,3},{},-1)
addlogic("bog",0,{5,1},{5,3},{},-1)
addlogic("belt",0,{1,2},{1,3},{},-1)
addlogic("cog",0,{0,1},{0,2},{},-1)
addlogic("fire",0,{2,0},{2,2},{},-1)
addlogic("ice",0,{1,2},{1,3},{},-1)
addlogic("skull",0,{2,0},{2,1},{},-1)
addlogic("pipe",0,{1,1},{0,1},{},-1)
addlogic("keke",0,{2,1},{2,2},{},-1)
addlogic("me",0,{3,0},{3,1},{},-1)
addlogic("fofo",0,{5,1},{5,2},{},-1)
addlogic("it",0,{1,2},{1,4},{},-1)
addlogic("box",0,{6,0},{6,1},{},-1)
addlogic("door",0,{2,1},{2,2},{},-1)
addlogic("key",0,{6,1},{2,4},{},-1)
addlogic("square",0,{4,0},{4,1},{},-1)
addlogic("circle",0,{5,2},{5,3},{},-1)
addlogic("fruit",0,{2,1},{2,2},{},-1)
addlogic("tree",0,{5,1},{5,2},{},-1)
addlogic("trees",0,{5,1},{5,2},{},-1)
addlogic("husk",0,{6,0},{6,1},{},-1)
addlogic("husks",0,{6,1},{6,2},{},-1)
addlogic("crab",0,{2,1},{2,2},{},-1)
addlogic("bubble",0,{1,3},{1,4},{},-1)
addlogic("algae",0,{5,1},{5,2},{},-1)
addlogic("jelly",0,{1,3},{1,4},{},-1)
addlogic("cliff",0,{6,1},{6,2},{},-1)
addlogic("star",0,{6,1},{2,4},{},-1)
addlogic("moon",0,{6,1},{2,4},{},-1)
addlogic("dust",0,{6,1},{2,4},{},-1)

--props
addlogic("you",2,{4,0},{4,1},{},-1)
addlogic("you2",2,{4,0},{4,1},{},-1)
addlogic("win",2,{6,1},{2,4},{},-1)
addlogic("stop",2,{5,0},{5,1},{},-1)
addlogic("push",2,{6,0},{6,1},{},-1)
addlogic("sink",2,{1,2},{1,3},{},-1)
addlogic("defeat",2,{2,0},{2,1},{},-1)
addlogic("hot",2,{2,2},{2,3},{},-1)
addlogic("melt",2,{1,2},{1,3},{},-1)
addlogic("open",2,{6,1},{2,4},{},-1)
addlogic("shut",2,{2,1},{2,2},{},-1)
addlogic("move",2,{5,1},{5,3},{},-1)
addlogic("shift",2,{1,2},{1,3},{},-1)
addlogic("float",2,{1,2},{1,4},{},-1)
addlogic("tele",2,{1,2},{1,4},{},-1)
addlogic("pull",2,{6,1},{6,2},{},-1)
addlogic("weak",2,{1,1},{1,2},{},-1)
addlogic("boom",2,{2,1},{2,2},{},-1)
addlogic("safe",2,{0,1},{0,3},{},-1)
addlogic("phantom",2,{1,1},{0,1},{},-1)
addlogic("swap",2,{3,0},{3,1},{},-1)
addlogic("right",2,{1,2},{1,4},{},-1)
addlogic("up",2,{1,2},{1,4},{},-1)
addlogic("left",2,{1,2},{1,4},{},-1)
addlogic("down",2,{1,2},{1,4},{},-1)
addlogic("bonus",2,{4,0},{4,1},{},-1)
addlogic("red",2,{2,1},{2,2},{},-1)
addlogic("blue",2,{3,2},{3,3},{},-1)
addlogic("fall",2,{5,1},{5,3},{},-1)
addlogic("fallright",2,{5,1},{5,3},{},-1)
addlogic("fallup",2,{5,1},{5,3},{},-1)
addlogic("fallleft",2,{5,1},{5,3},{},-1)
addlogic("nudgedown",2,{5,1},{5,3},{},-1)
addlogic("nudgeright",2,{5,1},{5,3},{},-1)
addlogic("nudgeup",2,{5,1},{5,3},{},-1)
addlogic("nudgeleft",2,{5,1},{5,3},{},-1)
addlogic("lockeddown",2,{4,1},{4,2},{},-1)
addlogic("lockedright",2,{4,1},{4,2},{},-1)
addlogic("lockedup",2,{4,1},{4,2},{},-1)
addlogic("lockedleft",2,{4,1},{4,2},{},-1)
addlogic("turn",2,{1,2},{1,4},{},-1)
addlogic("deturn",2,{1,2},{1,4},{},-1)
addlogic("power",2,{6,1},{2,4},{},-1)
addlogic("power2",2,{5,2},{5,3},{},-1)
addlogic("power3",2,{3,2},{4,4},{},-1)
addlogic("refers",3,{0,1},{0,3},{0,2},-1)

table.insert(editor_objlist_order,"text_meta")
table.insert(editor_objlist_order,"text_unmeta")
table.insert(editor_objlist_order,"text_mega")
table.insert(editor_objlist_order,"text_unmega")
table.insert(editor_objlist_order,"text_meea")
table.insert(editor_objlist_order,"text_unmeea")
table.insert(editor_objlist_order,"text_mena")
table.insert(editor_objlist_order,"text_unmena")
table.insert(editor_objlist_order,"text_mela")
table.insert(editor_objlist_order,"text_unmela")
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
editor_objlist["text_mela"] = {
    name = "text_mela",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text_quality","text_special", "metatext"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}
editor_objlist["text_unmela"] = {
    name = "text_unmela",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text_quality","text_special", "metatext"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 2},
    colour_active = {1, 3},
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
add_glyph_using_text("mena")
add_glyph_using_text("unmena")
add_glyph_using_text("meea")
add_glyph_using_text("unmeea")
add_glyph_using_text("mela")
add_glyph_using_text("unmela")
add_glyph_using_text("unmexa")

table.insert(editor_objlist_order,"text_text_")
editor_objlist["text_text_"] = {
    name = "text_text_",
    sprite_in_root = false,
    sprite = "text_textpre",
    unittype = "text",
    tags = {"text_special","abstract", "metatext"},
    tiling = -1,
    type = 4,
    layer = 20,
    colour = {4, 0},
    colour_active = {4, 1},
}

table.insert(editor_objlist_order, "text_nuhuhright")
table.insert(editor_objlist_order, "text_nuhuhup")
table.insert(editor_objlist_order, "text_nuhuhleft")
table.insert(editor_objlist_order, "text_nuhuhdown")

editor_objlist["text_nuhuhright"] =
{
    name = "text_nuhuhright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "btd456creeper mods"},
    tiling = -1,
    type = 8,
    layer = 20,
    colour = {2, 2},
    colour_active = {2, 2},
}
editor_objlist["text_nuhuhup"] =
{
    name = "text_nuhuhup",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "btd456creeper mods"},
    tiling = -1,
    type = 8,
    layer = 20,
    colour = {2, 2},
    colour_active = {2, 2},
}
editor_objlist["text_nuhuhleft"] =
{
    name = "text_nuhuhleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "btd456creeper mods"},
    tiling = -1,
    type = 8,
    layer = 20,
    colour = {2, 2},
    colour_active = {2, 2},
}
editor_objlist["text_nuhuhdown"] =
{
    name = "text_nuhuhdown",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "btd456creeper mods"},
    tiling = -1,
    type = 8,
    layer = 20,
    colour = {2, 2},
    colour_active = {2, 2},
}

--@Merge(nuhuh x plasma) add support for turning nuhuh
table.insert(editor_objlist_order, "text_turning_nuhuh")
editor_objlist["text_turning_nuhuh"] =
{
    name = "text_turning_nuhuh",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "btd456creeper mods", "turning text"},
    tiling = 0,
    type = 8,
    layer = 20,
    colour = {2, 2},
    colour_active = {2, 2},
}

table.insert(editor_objlist_order, "text_offsetdown")
editor_objlist["text_offsetdown"] =
{
    name = "text_offsetdown",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "btd456creeper mods", "arrow properties"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}

table.insert(editor_objlist_order, "text_offsetright")
editor_objlist["text_offsetright"] =
{
    name = "text_offsetright",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "btd456creeper mods", "arrow properties"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}

table.insert(editor_objlist_order, "text_offsetup")
editor_objlist["text_offsetup"] =
{
    name = "text_offsetup",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "btd456creeper mods", "arrow properties"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}

table.insert(editor_objlist_order, "text_offsetleft")
editor_objlist["text_offsetleft"] =
{
    name = "text_offsetleft",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "btd456creeper mods", "arrow properties"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}

--@Merge (offset x plasma): add turning offset
table.insert(editor_objlist_order, "text_turning_offset")
editor_objlist["text_turning_offset"] =
{
    name = "text_turning_offset",
    sprite_in_root = false,
    unittype = "text",
    tags = {"turning text", "text", "btd456creeper mods", "arrow properties"},
    tiling = 0,
    type = 2,
    layer = 20,
    colour = {1, 3},
    colour_active = {1, 4},
}


table.insert(editor_objlist_order, "text_throw")
editor_objlist["text_throw"] = {
    name = "text_throw",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "movement", "shrugsimontiger"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}

table.insert(editor_objlist_order, "text_unstack")
editor_objlist["text_unstack"] = {
    name = "text_unstack",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "text_quality", "movement", "shrugsimontiger"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {3, 0},
    colour_active = {3, 1},
}

table.insert(editor_objlist_order, "text_visit")

editor_objlist["text_visit"] =
{
    name = "text_visit",
    sprite_in_root = false,
    unittype = "text",
    tags = {"text", "btd456creeper mods"},
    tiling = -1,
    type = 2,
    layer = 20,
    colour = {0, 2},
    colour_active = {0, 3},
}

local layers = 1
local meta_objs = {}
for num = 1, layers do
    table.insert(objlistdata.alltags, "metatext (" .. num .. ")")
    for i, v in pairs(editor_objlist_order) do
        if string.sub(v, 1, 5) == "text_" then
            local data = editor_objlist_reference[v]
            if data ~= nil then
                v = editor_objlist[data]
                local thissprite = nil
                if v.sprite == nil then v.sprite = v.name end
                if v.sprite ~= nil then
                    thissprite = v.sprite
                    if MF_findsprite(string.rep("text_", num) .. v.sprite .. "_0_1.png", false) then
                        thissprite = string.rep("text_", num) .. v.sprite
                    end
                end
                local new = {
                    name = string.rep("text_", num) .. v.name,
                    sprite = thissprite,
                    sprite_in_root = false,
                    unittype = "text",
                    tags = { "text", "abstract", "metatext (" .. num .. ")" },
                    tiling = v.tiling,
                    type = 0,
                    layer = v.layer,
                    colour = v.colour,
                    colour_active = v.colour_active,
                }
                table.insert(meta_objs, new)
            end
        end
    end
end

for i, v in ipairs(meta_objs) do
    table.insert(editor_objlist_order, v.name)
    editor_objlist[v.name] = v
end

formatobjlist()