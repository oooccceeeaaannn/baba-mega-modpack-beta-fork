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

formatobjlist()

-- Support for glossary, yay!!
if keys.IS_WORD_GLOSSARY_PRESENT then
    keys.WORD_GLOSSARY_FUNCS.register_author("Huebird", {2,1})
    keys.WORD_GLOSSARY_FUNCS.add_entries_to_word_glossary({
        {
            base_obj = "text_alive",
            author = "Huebird",
            description = "Makes an object respond to YOU-related interactions (Ex: WIN, DEFEAT). However, the object cannot be controlled by the player.",
        },
        {
            base_obj = "text_vessel",
            author = "Huebird",
            display_name = "Vessel/Vessel2",
            description =
            [[Makes an object controllable as if the object is YOU. However, the object cannot interact with YOU-related properties (Ex: WIN, DEFEAT).

            Vessel2 is the same but uses YOU2 controls.]],
            display_sprites = {"text_vessel", "text_vessel2"}
        },
        {
            base_obj = "text_hop",
            author = "Huebird",
            display_name = "Hop/Hops",
            description = [[When a "$4,4HOP$0,3" object runs into an obstacle, the "$4,4HOP$0,3" object jumps over.

- "$4,4HOPS$0,3" is similar but only allows the hopper to hop over a specific object type.

- You can hop outside the level border as well.]],
            display_sprites = {"text_hop", "text_hops"}
        },
        {
            base_obj = "text_karma",
            author = "Huebird",
            description = [[If an object that is "$2,2KARMA$0,3" has destroyed something in the past, the "$2,2KARMA$0,3" object will be destroyed in response.]],
        },
        {
            base_obj = "text_sinful",
            author = "Huebird",
            description = "Activates if the targeted object has destroyed something in the past.",
        },
        {
            base_obj = "text_repent",
            author = "Huebird",
            description = "Clears the object's history of destroying other objects, preventing the effects of $2,2KARMA$0,3 and $2,2SINFUL$0,3.",
        },
        {
            base_obj = "text_echo",
            author = "Huebird",
            description = [[If an "ECHO" object overlaps a text, "ECHO" objects of the same type will take the meaning of the overlapped text, allowing the "ECHO" objects to be used in rules.

Ex: If "ROCK IS ECHO" and there are 2 rocks, one rock can have an "IS" on top of it, and the other rock can be used "BABA (rock) YOU" to make "BABA IS YOU".]],
        },
        {
            base_obj = "text_enter",
            author = "Huebird",
            description = [[Makes an object able to select levels like a cursor object or a "$2,4SELECT$0,3" object. However, "$2,4ENTER$0,3" objects cannot move on paths.]],
        },
        {
            base_obj = "text_vehicle",
            author = "Huebird",
            description = [[Makes an object able to move on paths like a cursor object or a "$2,4SELECT$0,3" object. However, "$0,1VEHICLE$0,3" objects cannot select levels to enter.]],
        },
        {
            base_obj = "text_boost",
            author = "Huebird",
            display_sprites = {"text_boost", "text_boosts"},
            display_name = "Boost/Boosts",
            description = [[Similar to SHIFT, but objects are moved in the direction they're already facing.
- "$3,1BOOSTS$0,3" is similar but makes an object boost with only one specific object type.]],
        },
        {
            base_obj = "text_ambient",
            author = "Huebird",
            description = [[Special noun that refers to what the outer level is currently transformed to.
For example, if the outer level was transformed into Baba, then "$4,1AMBIENT$0,3" behaves like "BABA" within that level.]],
        },
        {
            base_obj = "text_aligned",
            author = "Huebird",
            display_sprites = {"text_aligned", "text_alignedx", "text_alignedy"},
            description = [[True if all objects of that type are in the same row or column.

- Includes $4,2row-only$0,3 and $1,4column-only$0,3 variants.]],
        },
        {
            base_obj = "text_morph",
            author = "Huebird",
            description = [[When a "$5,4MORPH$0,3" object stops touching something, it transforms into that thing.

Ex: if "BLOB IS MORPH", when a Baba moves onto a blob, then leaves, that blob will transform into a Baba.]],
        },
        {
            base_obj = "text_trap",
            author = "Huebird",
            display_sprites = {"text_trap", "text_traps"},
            display_name = "Trap/Traps",
            description = [[Anything that steps on a "$2,1TRAP$0,3" object becomes trapped. Trapped objects are destroyed once they're no longer on a "$2,1TRAP$0,3" object.

- "$2,1TRAPS$0,3" is similar, but only the specified object type will become trapped.]],
        },
        {
            base_obj = "text_bungee",
            author = "Huebird",
            description = [[When an object becomes "$2,3BUNGEE$0,3", it stores its current position. When it stops being "$2,3BUNGEE$0,3", it teleports back to that position.]],
        },
        {
            base_obj = "text_rescue",
            author = "Huebird",
            description = [[If an object ends out of bounds, it teleports to a random "$1,2RESCUE$0,3" object instead of being destroyed.]],
        },
        {
            base_obj = "text_else",
            author = "Huebird",
            display_sprites = {"text_else", "text_perfect"},
            display_name = "Else/Perfect",
            description = [["$1,2ELSE$0,3" is true if the object doesn't meet the conditions of any other rule.
"$3,3PERFECT$0,3" is true if the object meets the conditions of any other rule.

- Rules without conditions are considered true, crossed-out rules are considered false.
- Baserules and rules containing "$1,2ELSE$0,3" or "$3,3PERFECT$0,3" are ignored.]],
        },
        {
            base_obj = "text_missing",
            author = "Huebird",
            description = [[True if an object of the given type was destroyed before.
For example, "BABA MISSING ROCK IS YOU" is true if a rock was destroyed (by any means).]],
        },
        {
            base_obj = "text_bang",
            author = "Huebird",
            description = [[Objects that are "$2,2BANG$0,3" shoot the first object in their line of sight and on the same float level.

- "SAFE" objects can be used as shields.
- Can be stacked to destroy multiple things at once.]],
        },
        {
            base_obj = "text_domino",
            author = "Huebird",
            description = [[If a "DOMINO" object is destroyed, adjacent "DOMINO" objects on the same float level are destroyed as well.]],
        },
        {
            thumbnail = "text_fillright",
            display_name = "Fill",
            text_type = 2,
            author = "Huebird",
            display_sprites = {"text_fill", "text_fillup", "text_filldown", "text_fillright", "text_fillleft"},
            description = [[- The directional "$4,1FILL$0,3"s create as many copies of the object as possible in the given direction, with the same logic as "$4,1MORE$0,3".

- The non-directional "$4,1FILL$0,3" acts like an instantaneous "$4,1MORE$0,3", filling all the possible tiles at once.]]
        },
        {
            thumbnail = "text_foldright",
            display_name = "fold",
            text_type = 2,
            author = "Huebird",
            display_sprites = {"text_foldup", "text_foldright", "text_foldleft", "text_folddown"},
            description = [[Destroys the object if there's one of the same type in the given direction.

Ex: if there's a row of walls, forming "WALL IS FOLD (RIGHT)" will destroy all walls except the rightmost one.]]
        },
        {
            thumbnail = "text_alignright",
            display_name = "align",
            text_type = 2,
            author = "Huebird",
            display_sprites = {"text_alignup", "text_alignright", "text_alignleft", "text_aligndown"},
            description = [[Teleports the object so that it's aligned with the furthest object of that type in the given direction.

- Having opposite directions at once will make the objects oscillate.]]
        }

    })

end