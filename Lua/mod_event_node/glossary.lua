if keys.IS_WORD_GLOSSARY_PRESENT then -- Written by @theopol
    keys.WORD_GLOSSARY_FUNCS.register_author("DizzyAndy", {1,4} )
    keys.WORD_GLOSSARY_FUNCS.add_entries_to_word_glossary({
        {
            name = "the objs",
            thumbnail_obj = "obj_baba",
            display_sprites = {"obj_baba","obj_flag","obj_wall","obj_rock"},
            author = "DizzyAndy",
            description =
            [[OBJs are similar to $4,1TEXT$0,3 or $3,3GLYPHS$0,3 in that they correspond to other objects. However, they do not parse rules. This gives them a few notable features...
            - There is no TEXT for any given OBJ. "TEXT_OBJ" refers to all of them.
            - OBJs are not included in ALL, and do not have baserules.
            - There are OBJs that refer to other special nouns, including their own kind!]],
        },
        {
            name = "obj",
            author = "DizzyAndy",
            description =
            [[TEXT_OBJ refers to all OBJs. They do not have individual names!
            - "LAHE NEAR OBJ" returns true if Lahe is near even one OBJ.
            - When "OBJ IS WORD", all OBJs will function as TEXT_OBJ.
            - When "THITHI IS OBJ", THITHI becomes OBJ_THITHI.]],
        },
        {
            name = "_",
            author = "DizzyAndy",
            description =
            [[If "TEXT IS UNDERSCORE", all TEXT becomes TEXT_TEXT... except it doesn't, because it only works on objects and OBJs.]],
        },
        {
            name = "object",
            author = "DizzyAndy",
            description =
            [[If "ROCKER IS OBJECT", Rocker will put on a facade of being an OBJ when parsing rules. It works like Word, except without all the jank.]],
        },
        {
            name = "deobj",
            author = "DizzyAndy",
            description =
            [[Remove the first 4 letters of an OBJ's name. Very niche.
            - If "OBJ IS DE-OBJ", OBJ_BABA will become BABA.]],
        },
        {
            name = "becobj",
            author = "DizzyAndy",
            description =
            [[If "WEH WRITE TIKO" turn WEH into OBJ_TIKO. Works like WRITE.]],
        },
        {
            name = "ect",
            author = "DizzyAndy",
            description =
            [[ECT is unique in that it can parse both at the start and end of sentences, as well as parsing immediately after an infix such as ON. This allows you to apply properties to it.
            - "ECT IS FALL" will cause ECT to instantaneously move as far as it can downwards, stopping at barriers such as units that are PUSH or STOP.
            - "SPROUT EAT ECT" will cause all units named SPROUT to destroy any units named ECT on contact or overlap.]],
        }
    })
end