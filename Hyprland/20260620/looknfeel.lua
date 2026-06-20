-- ~/.config/hypr/looknfeel.lua
-- ============================================================================
-- General, decoration, layout, misc.
-- Colors come from theme.lua so this file never hard-codes a hex value.
-- Reference: https://wiki.hypr.land/Configuring/Basics/Variables/
-- ============================================================================

local c = require("theme")

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,
        border_size = 2,

        col = {
            -- Active border mirrors your Waybar active-workspace gradient
            -- (blue -> lavender), so focus reads the same in both places.
            active_border   = { colors = { c.blue, c.lavender }, angle = 45 },
            inactive_border = c.inactive,
        },

        resize_on_border = true,   -- you had this enabled
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = c.shadow,
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },
})

-- Dwindle layout (yours).
-- NOTE: dwindle.pseudotile was REMOVED upstream, so it's intentionally absent.
-- Pseudotiling still works — it's bound to SUPER + P in keybinds.lua.
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    misc = {
        force_default_wallpaper = 0,     -- you use hyprpaper, so kill the mascot wallpaper
        disable_hyprland_logo   = true,  -- and the logo overlay
    },
})
