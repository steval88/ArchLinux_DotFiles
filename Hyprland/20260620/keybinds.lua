-- ~/.config/hypr/keybinds.lua
-- ============================================================================
-- Keybindings.  Reference: https://wiki.hypr.land/Configuring/Basics/Binds/
-- Dispatcher list:        https://wiki.hypr.land/Configuring/Basics/Dispatchers/
-- ============================================================================

local mainMod = "SUPER"

-- Programs (kept from your config)
local terminal    = "alacritty"
local fileManager = "dolphin"
local menu        = "wofi --show drun"

------------------------------------------------------------------ launchers
hl.bind(mainMod .. " + Q",      hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("CTRL + ALT + T",       hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R",      hl.dsp.exec_cmd(menu))

------------------------------------------------------------------ session
hl.bind(mainMod .. " + M",      hl.dsp.exit())                              -- exit Hyprland
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd("wlogout -p layer-shell"))
-- uwsm users: replace the exit dispatcher above with
--   hl.dsp.exec_cmd("uwsm stop")
-- for a graceful shutdown.

------------------------------------------------------------------ windows
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())          -- dwindle pseudotile
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle split direction

-- Move focus with arrows
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

------------------------------------------------------------------ workspaces
-- One loop replaces your 20 hand-written workspace lines.
-- SUPER + [1..0]         -> switch to workspace
-- SUPER + SHIFT + [1..0] -> move focused window to workspace
for i = 1, 10 do
    local key = i % 10  -- 10 maps to the "0" key
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scratchpad (a hidden "special" workspace you can summon over anything)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces with SUPER + wheel
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move / resize floating windows with SUPER + LMB / RMB drag
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

------------------------------------------------------------------ screenshots (NEW)
-- Requires: grim, slurp, wl-clipboard
hl.bind("Print",               hl.dsp.exec_cmd("grim - | wl-copy"))                 -- whole screen -> clipboard
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))    -- region -> clipboard
hl.bind("SHIFT + Print",       hl.dsp.exec_cmd('grim ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png')) -- whole screen -> file

------------------------------------------------------------------ clipboard history (NEW)
-- Requires: cliphist (uses your wofi as the picker)
hl.bind(mainMod .. " + SHIFT + V",
        hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))

------------------------------------------------------------------ multimedia (locked + key-repeat)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),       { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),       { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                    { locked = true, repeating = true })

------------------------------------------------------------------ media transport (locked)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
