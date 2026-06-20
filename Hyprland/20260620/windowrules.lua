-- ~/.config/hypr/windowrules.lua
-- ============================================================================
-- Window + workspace rules.
-- Reference: https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- ============================================================================

-- Ignore maximize requests from all apps (you had this — most people want it)
hl.window_rule({
    name  = "suppress-maximize",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix XWayland drag/focus quirks (recommended upstream default)
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- A few handy additions: float common tool/dialog windows
hl.window_rule({ name = "float-pavucontrol", match = { class = "^(pavucontrol)$" },         float = true })
hl.window_rule({ name = "float-nm-editor",   match = { class = "^(nm-connection-editor)$" }, float = true })
hl.window_rule({ name = "float-portal",      match = { class = "^(xdg-desktop-portal-gtk)$" }, float = true })

-- More props exist (size, move/center, opacity, per-workspace assignment, blur, etc.).
-- See the Window-Rules page above for the full prop list before adding them.
