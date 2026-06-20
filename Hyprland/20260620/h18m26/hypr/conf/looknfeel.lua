-- ~/.config/hypr/conf/looknfeel.lua
-- ============================================================================
--  General + decoration + layout. Pulls numbers from options.lua and colors
--  from theme.lua, so this file holds structure, not values.
--  https://wiki.hypr.land/Configuring/Basics/Variables/
-- ============================================================================

local opt = require("conf.options")
local th  = require("conf.theme")

hl.config({
    general = {
        gaps_in     = opt.gaps_in,
        gaps_out    = opt.gaps_out,
        border_size = opt.border_size,

        col = {
            active_border   = th.border_active,
            inactive_border = th.border_inactive,
        },

        resize_on_border = opt.resize_on_border,
        allow_tearing    = opt.allow_tearing,
        layout           = "dwindle",
    },

    decoration = {
        rounding       = opt.rounding,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = th.shadow,
        },

        blur = {
            enabled  = opt.blur_enabled,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },
})

-- Dwindle layout. (dwindle.pseudotile was removed upstream — pseudotiling is
-- still available on the SUPER+P bind in keybinds.lua.)
hl.config({ dwindle = { preserve_split = true } })

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- you use hyprpaper
        disable_hyprland_logo   = true,
    },
})
