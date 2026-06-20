-- ~/.config/hypr/conf/options.lua
-- ============================================================================
--  YOUR CONTROL PANEL.
--  This is the one file you edit for day-to-day tweaks. Every other module
--  reads from here, so you rarely have to touch the wiring.
-- ============================================================================

return {
    ---- programs -----------------------------------------------------------
    terminal    = "alacritty",
    fileManager = "dolphin",
    menu        = "wofi --show drun",

    ---- modifier -----------------------------------------------------------
    mainMod = "SUPER",

    ---- layout & decoration ------------------------------------------------
    gaps_in     = 5,
    gaps_out    = 20,
    border_size = 2,
    rounding    = 10,
    resize_on_border = true,
    allow_tearing    = false,   -- see the Tearing wiki page before enabling

    ---- effects ------------------------------------------------------------
    animations_enabled = true,
    blur_enabled       = true,
    smart_gaps         = false, -- true = no gaps/rounding when only one tiled window

    ---- input --------------------------------------------------------------
    kb_layout      = "us",
    follow_mouse   = 1,
    natural_scroll = false,
}
