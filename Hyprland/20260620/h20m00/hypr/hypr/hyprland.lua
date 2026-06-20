-- ~/.config/hypr/hyprland.lua
-- ============================================================================
--  Hyprland — modular Lua config (0.55+)
--  Entry point only. Real config lives in ./conf/*.lua
--
--  Load order:  options + theme  ->  everything else reads from them.
--  Each require() is its own error-isolated scope, so one bad module won't
--  bring down the rest of the session.
--  Reference: https://wiki.hypr.land/Configuring/Start/
-- ============================================================================

-- Make require() find both ~/.config/hypr/*.lua and ~/.config/hypr/conf/*.lua,
-- so "conf.theme" and bare "theme" both resolve. pcall'd so a locked-down path
-- can't error out the whole config (Hyprland's own resolver is the fallback).
pcall(function()
    local cfg = os.getenv("XDG_CONFIG_HOME") or ((os.getenv("HOME") or "") .. "/.config")
    package.path = cfg .. "/hypr/?.lua;"
                .. cfg .. "/hypr/conf/?.lua;"
                .. package.path
end)

-- Shared tables first (literal data — these basically can't fail, but loading
-- them up top means any typo surfaces with a clear source).
require("conf.options")   -- your knobs
require("conf.theme")     -- your colors

-- Modules, in a sensible order.
require("conf.env")          -- environment variables
require("conf.monitors")     -- displays
require("conf.looknfeel")    -- general / decoration
require("conf.animations")   -- curves + timings
require("conf.input")        -- keyboard / touchpad / gestures
require("conf.autostart")    -- launch-once processes
require("conf.keybinds")     -- keybindings
require("conf.windowrules")  -- window rules
require("conf.workspaces")   -- workspace rules + smart gaps
