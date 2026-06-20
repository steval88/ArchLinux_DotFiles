-- ~/.config/hypr/conf/windowrules.lua
-- ============================================================================
--  Window rules.  https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- ============================================================================

-- Ignore maximize requests from all apps
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

-- Float common tool/dialog windows
hl.window_rule({ name = "float-pavucontrol", match = { class = "^(pavucontrol)$" },           float = true })
hl.window_rule({ name = "float-nm-editor",   match = { class = "^(nm-connection-editor)$" },   float = true })
hl.window_rule({ name = "float-portal",      match = { class = "^(xdg-desktop-portal-gtk)$" }, float = true })

-- More props (size, move/center, opacity, blur, etc.) exist — see the wiki
-- page above for the full list before adding them.
