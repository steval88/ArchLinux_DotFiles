-- ~/.config/hypr/input.lua
-- ============================================================================
-- Keyboard, touchpad, gestures.
-- Reference: https://wiki.hypr.land/Configuring/Basics/Variables/#input
-- ============================================================================

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0,   -- -1.0 .. 1.0, 0 = no change

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- 3-finger horizontal swipe to switch workspaces (your gesture)
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Example per-device tweak. Find names with `hyprctl devices`, then uncomment:
-- hl.device({ name = "your-mouse-name", sensitivity = -0.5 })
