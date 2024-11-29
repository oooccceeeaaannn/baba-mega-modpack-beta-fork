if keys.IS_WORD_GLOSSARY_PRESENT then

    local randnumthings = {
        {"event_1", "event_2", "event_3", "event_4"},
        {"event_1", "event_2", "event_4", "event_8"},
        {"event_2", "event_7", "event_6", "event_3"},
        {"event_2", "event_4", "event_7", "event_4"},
        {"event_1", "event_9", "event_8", "event_4"},
        {"event_2", "event_0", "event_4", "event_8"},
        {"event_2", "event_0", "event_2", "event_4"},
        {"event_7", "event_8", "event_9"},
        {"event_1", "event_0", "event_0"},
        {"event_6", "event_4"},
        {"event_5", "event_7"},
        {"event_0", "event_0", "event_0", "event_0", "event_0", "event_0", "event_0", "event_0", "event_0", "event_0", "event_0", "event_0", "event_0", "event_0", "event_0", "event_0"},
        {"event_1", "event_2", "event_3", "event_4", "event_5", "event_6", "event_7", "event_8", "event_9"},
        {"event_0", "event_1", "event_2", "event_3", "event_5", "event_4", "event_6", "event_2", "text_what"},
    }

    local randnums = randnumthings[fixedrandom(1, 14)]
    keys.WORD_GLOSSARY_FUNCS.add_entries_to_word_glossary({

        {
            base_obj = "text_event",
            author = "Wrecking Games",
            description = [[An alternate parsing form to text.
      Place events in a downwards line, emitting from a beginning event.
      Each event will get complied into a rule, depending on what you've placed.
      Read each individual text type's entries for more details.

      As for this as a noun, it just refers to all events.
      ]]
        },

        {
            thumbnail = "event_baba",
            display_name = "event nouns",
            display_sprites = {"event_baba","event_flag","event_wall","event_rock"},
            custom_type = "Verb",
            author = "Wrecking Games",
            text_type = 0,
            description = [[Used as nouns for events. Can only be used as arguments.]],
            group = "events"
        },

        {
            thumbnail = "event_you",
            display_name = "event properties",
            display_sprites = {"event_you","event_push","event_stop","event_win"},
            text_type = 2,
            author = "Wrecking Games",
            description = [[Used as properties for events.
      Can be used as arguments to specific words, but also can be used as their own line!
      When used for their own line, makes the subject have the property.]],
            group = "events"
        },

        {
            thumbnail = "event_eat",
            display_name = "event properties",
            display_sprites = {"event_become","event_have","event_eat","event_make"},
            custom_type = "Verb",
            text_type = 1,
            author = "Wrecking Games",
            description = [[I think you get it now
      Can be used as their own line, and as an argument to specific words.
      Note that verbs must have an argument attached to them.]],
            group = "events"
        },

        {
            thumbnail = "event_on",
            display_name = "event conditions",
            display_sprites = {"event_on","event_near"},
            custom_type = "Condition",
            author = "Wrecking Games",
            text_type = 7,
            description = [[Works as a conditional operator.
      Can be used as their own line, but currently not used as arguments for anything yet.
      Adds this condition to each subsequent compiled rule.]],
            group = "events"
        },

        {
            thumbnail = "event_lonely",
            display_name = "event prefixes",
            custom_type = "Prefix Condition",
            text_type = 3,
            display_sprites = {"event_lonely","event_powered"},
            author = "Wrecking Games",
            description = [[Only used as arguments for "when".]],
            group = "events"
        },

        {
            thumbnail = "event_not",
            display_name = "event_not",
            custom_type = "Modifier Prefix",
            display_sprites = {"event_not"},
            author = "Wrecking Games",
            description = [[Can be used before conditions and nouns to prefix "not" to them.]],
            group = "events"
        },

        {
            thumbnail = "event_never",
            display_name = "event_never",
            custom_type = "Line modifier",
            display_sprites = {"event_never"},
            author = "Wrecking Games",
            description = [[Used as a standalone line.

      Inverses the effect of the property, makes the object never allowed to do that action.
      If there is no inverse effect, it will negate that rule instead.
      Example: Making baba "never: push" will make baba no longer able to push anything.

      If you specifically want to make "X IS $2,2NOT$0,3 Y", Use "$2,2NEVER:$0,3 BE: Y"
      ]],
            group = "events"
        },

        {
            thumbnail = "event_start",
            display_name = "event_start",
            custom_type = "Beginning",
            display_sprites = {"event_start"},
            author = "Wrecking Games",
            description = [[Starts an event block. Requires a noun as an argument. When used, makes that noun the subject of the sentence.]],
            group = "events"
        },

        {
            thumbnail = "event_destroy",
            display_name = "event_destroy",
            text_type = 2,
            display_sprites = {"event_destroy"},
            author = "Wrecking Games",
            description = [[Destroys the object.

      "Never: Destroy" acts as Safe.]],
            group = "events"
        },

        {
            thumbnail = "event_move",
            display_name = "event_move",
            text_type = 1,
            author = "Wrecking Games",
            display_sprites = {"event_move"},
            description = [[A verb which only accepts directions. Makes an object move WITHOUT turning.]],
            group = "events"
        },

        {
            thumbnail = "event_turn",
            display_name = "event_turn",
            text_type = 1,
            display_sprites = {"event_turn"},
            author = "Wrecking Games",
            description = [[A verb which only accepts directions. Makes an object turn in that direction.]],
            group = "events"
        },

        {
            thumbnail = "event_right",
            display_name = "event directions",
            custom_type = "direction",
            display_sprites = {"event_up","event_right","event_left","event_down"},
            author = "Wrecking Games",
            description = [[Events that are used as arguments to direction-specific verbs and conditions.
      Cannot be used as a property. If you wanted to use it as a property, use $1,4TURN:$0,3.]],
            group = "events"
        },

        {
            thumbnail = "event_forward",
            display_name = "event relative directions",
            custom_type = "direction",
            display_sprites = {"event_forward","event_aroundright","event_aroundleft","event_backward"},
            author = "Wrecking Games",
            description = [[Events that are used as arguments to direction-specific verbs and conditions.
      $1,4Forward$0,3 refers to the direction the subject is facing. $1,4Backward$0,3 is that but flipped, and $1,4around$0,3 is that but rotated 90 degrees.
      ]],
            group = "events"
        },

        {
            base_obj = "text_code",
            author = "Wrecking Games",
            description = [[Acts as WRITE, but makes an event instead of a text.]]
        },

        {
            thumbnail = "event_group",
            display_name = "event_group",
            custom_type = "nounjective",
            author = "Wrecking Games",
            display_sprites = {"event_group"},
            description = [[Works as both a noun and a property.]],
            group = "events"
        },

        {
            thumbnail = "event_as",
            display_name = "event_as",
            custom_type = "Action",
            author = "Wrecking Games",
            display_sprites = {"event_as"},
            description = [[Changes the event subject to the specified argument. Currently only accepts nouns.]],
            group = "events"
        },

        {
            thumbnail = "event_be",
            display_name = "event_be",
            text_type = 1,
            author = "Wrecking Games",
            display_sprites = {"event_be"},
            description = [[Acts as IS.]],
            group = "events"
        },

        {
            thumbnail = "event_have",
            display_name = "event_have",
            text_type = 1,
            author = "Wrecking Games",
            display_sprites = {"event_have"},
            description = [[Acts as HAS.]],
            group = "events"
        },
        --[[
            {
              thumbnail = "event_press",
              display_name = "event_press",
              custom_type = "Condition",
              author = "Wrecking Games",
              display_sprites = {"event_press"},
              description = [[When Used with When, Returns true when pressing that specific direction or key.
              As a normal verb, it causes a key press with that input to happen.]]--[[,
      group = "events"
    },
]]
        {
            thumbnail = "event_when",
            display_name = "event_when",
            custom_type = "Condition",
            author = "Wrecking Games",
            display_sprites = {"event_when"},
            description = [[Accepts properties and prefix conditions.
      - For properties, Acts as FEELING.
      - For prefixes, returns tre if the object matches that prefix.]],
            group = "events"
        },

        {
            thumbnail = "event_halt",
            display_name = "event_halt",
            custom_type = "Action",
            author = "Wrecking Games",
            display_sprites = {"event_halt"},
            description = [[Stops an event script. If has a condition, then it does not apply future rules if that condition is true.]],
            group = "events"
        },

        {
            thumbnail = "event_then",
            display_name = "event_then",
            custom_type = "Action",
            author = "Wrecking Games",
            display_sprites = {"event_then"},
            description = [[Ends a code block. Current code block events are Conditions, As, and Repeat.]],
            group = "events"
        },

        {
            thumbnail = "event_nop",
            display_name = "event_nop",
            custom_type = "Action",
            author = "Wrecking Games",
            display_sprites = {"event_nop"},
            description = [[No operation.]],
            group = "events"
        },
        --[[
            {
              thumbnail = "event_goto",
              display_name = "event_goto",
              custom_type = "Verb",
              author = "Wrecking Games",
              display_sprites = {"event_goto"},
              description = [[Makes an object go to a certain position.
              When the argument is a noun, makes the object go to the closest instance of that object.
              Special cases: Goto: Origin makes an object go back to where it was on level start,
              Goto: 2, 3 makes an object go to X position 2 Y position 3, and
              Goto: center makes an object go to the center of the level.]]--[[,
      group = "events"
    },
]]
        {
            thumbnail = "event_1",
            display_name = "event numbers",
            custom_type = "Numbers",
            display_sprites = randnums,
            author = "Wrecking Games",
            description = [[Acts as, well, numbers.
      Can be used as arguments for Repeat. Can also be suffixes for Group, Power, and Powered.]],
            group = "events"
        },

        {
            thumbnail = "event_repeat",
            display_name = "event_repeat",
            custom_type = "Action",
            display_sprites = {"event_repeat"},
            author = "Wrecking Games",
            description = [[Repeats the following code block the number of times as the argument.]], --removed line: Can be broken with BREAK.
            group = "events"
        },
        --[[
            {
              thumbnail = "event_way",
              display_name = "event_way",
              custom_type = "Direction",
              author = "Wrecking Games",
              display_sprites = {"event_way"},
              description = [[Acts as the direction it is facing.]]--[[,
      group = "events"
    },

    {
      thumbnail = "event_tab",
      display_name = "event_tab",
      custom_type = "Filler",
      display_sprites = {"event_tab"},
      author = "Wrecking Games",
      description = [[Filler. Only goes at the start of a line.]]--[[,
      group = "events"
    },
]]
        {
            thumbnail = "event_backslash",
            display_name = "event_backslash",
            custom_type = "Interpreter",
            author = "Wrecking Games",
            display_sprites = {"event_backslash"},
            description = [[Interprets a piece of $4,1TEXT$0,3 after it as if it was an event.]],
            group = "events"
        },
        --[[
            {
              thumbnail = "event_if",
              display_name = "event_if",
              custom_type = "Condition",
              author = "Wrecking Games",
              display_sprites = {"event_if"},
              description = [[A very special condition, returns true if something is met.
              Uses:
              - IF: BABA IS YOU returns true if, well, the rule "baba is you" is active.
              - IF: BOX HAS KEY Is the above, but for has and not is. Any other verb would be suffixed with "s", like "makes".]]--[[,
      group = "events"
    },
]]





    })
end
