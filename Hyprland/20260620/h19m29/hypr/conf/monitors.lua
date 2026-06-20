-- ~/.config/hypr/conf/monitors.lua
-- ============================================================================
--  Displays.  https://wiki.hypr.land/Configuring/Basics/Monitors/
-- ============================================================================

-- Built-in laptop panel — 1920x1080 @ ~60Hz, 100% scale.
-- "preferred" auto-selects the panel's native mode, so there's no Hz to hardcode.
hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "0x0",
    scale    = 1,
})

-- Plugging in an external display later? Copy the block above and fill in its
-- values (get them from `hyprctl monitors` once you're inside Hyprland), e.g.:
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "1920x0", scale = 1 })

-- Optional catch-all for any output you haven't written a rule for yet:
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
