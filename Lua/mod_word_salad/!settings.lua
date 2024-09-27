-------- COSMETIC SETTINGS --------
-- If true, the music will still play when there are only vessels on the level
MUSIC_WHEN_ONLY_VESSELS = true
-- If true, objects that are HOP will spawn some particles after a successful jump
DO_HOP_PARTICLES = true
-- If true, objects will spawn some particles when they become trapped/stop being trapped
WS_SHOW_TRAP_PARTICLES = true
-- If true, hovering with the mouse over a unit shows its stored bungee position
WS_DISPLAY_BUNGEE_POSITION = true
-- If true, hovering the mouse cursor on AMBIENT text shows the ambient current value
WS_DISPLAY_AMBIENT_VALUE = true
-- If true, hovering the mouse cursor on MISSING text shows the current list of objects destroyed
WS_DISPLAY_MISSING_TABLE = true


-------- GAMEPLAY SETTINGS --------
-- If true, keeps the sinful status of a level upon entering
WS_KEEP_LEVEL_KARMA = true
-- If true, "LEVEL IS ENTER" behavior also applies to any "X IS ENTER" if X has valid level data
WS_CAN_ENTER_ANY = true
-- If true, ECHO units can echo WORD units
WS_CAN_ECHO_WORD_UNITS = true
-- If true, units destroyed by the 6 stack limit count towards MISSING
WS_STACK_LIMIT_TRIGGERS_MISSING = false

-------- DEBUG SETTINGS --------
-- If true, hovering with the mouse over a unit shows its karma status
WS_DISPLAY_KARMA_DEBUG = false
-- If true, hovering with the mouse over a unit shows its trapped status
WS_DISPLAY_TRAPPED_DEBUG = false

function apply_word_salad_settings(settings_dict)
    for setting_name, value in pairs(settings_dict) do
        if setting_name == "music_when_only_vessels" then
            MUSIC_WHEN_ONLY_VESSELS = value
        elseif setting_name == "do_hop_particles" then
            DO_HOP_PARTICLES = value
        elseif setting_name == "keep_level_karma" then
            WS_KEEP_LEVEL_KARMA = value
        elseif setting_name == "can_enter_any" then
            WS_CAN_ENTER_ANY = value
        elseif setting_name == "echo_word_units" then
            WS_CAN_ECHO_WORD_UNITS = value
        end
    end
end