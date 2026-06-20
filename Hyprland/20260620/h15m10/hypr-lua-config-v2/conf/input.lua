-- ~/.config/hypr/conf/input.lua
-- ============================================================================
--  Keyboard / touchpad / gestures.
--  https://wiki.hypr.land/Configuring/Basics/Variables/#input
-- ============================================================================

local opt = require("conf.options")

hl.config({
    input = {
        kb_layout  = opt.kb_layout,
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = opt.follow_mouse,
        sensitivity  = 0,

        touchpad = {
            natural_scroll = opt.natural_scroll,
        },
    },
})

-- 3-finger horizontal swipe = switch workspace
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Per-device override (find names with `hyprctl devices`):
-- hl.device({ name = "your-device", sensitivity = -0.5 })
