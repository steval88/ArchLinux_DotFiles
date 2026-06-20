-- ~/.config/hypr/conf/workspaces.lua
-- ============================================================================
--  Workspace rules.  https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- ============================================================================

local opt = require("conf.options")

-- "Smart gaps" / "no gaps when only one": when a workspace holds a single
-- tiled window, drop its gaps + rounding for an edge-to-edge look.
-- Toggle with options.smart_gaps.
if opt.smart_gaps then
    hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
    hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
    hl.window_rule({ name = "smartgap-wtv1", match = { float = false, workspace = "w[tv1]" }, border_size = 0, rounding = 0 })
    hl.window_rule({ name = "smartgap-f1",   match = { float = false, workspace = "f[1]" },   border_size = 0, rounding = 0 })
end

-- Pin workspaces to specific monitors (uncomment + edit; see `hyprctl monitors`):
-- hl.workspace_rule({ workspace = "1", monitor = "DP-2", default = true })
-- hl.workspace_rule({ workspace = "2", monitor = "DP-2" })
-- hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1" })
