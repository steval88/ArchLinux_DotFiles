-- ~/.config/hypr/monitors.lua
-- ============================================================================
-- Displays.  See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Keeps your original auto-detect setup (one preferred display, auto layout).
-- ============================================================================

hl.monitor({
    output   = "",          -- "" = applies to every output
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- To pin a specific monitor, copy the block above and fill it in, e.g.:
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })
-- Find your outputs + modes with:  hyprctl monitors
