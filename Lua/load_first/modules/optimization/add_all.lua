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

formatobjlist()