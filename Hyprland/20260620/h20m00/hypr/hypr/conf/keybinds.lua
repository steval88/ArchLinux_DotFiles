-- ~/.config/hypr/conf/keybinds.lua
-- ============================================================================
--  Keybindings.
--  Binds:       https://wiki.hypr.land/Configuring/Basics/Binds/
--  Dispatchers: https://wiki.hypr.land/Configuring/Basics/Dispatchers/
-- ============================================================================

local opt = require("conf.options")

local mainMod     = opt.mainMod
local terminal    = opt.terminal
local fileManager = opt.fileManager
local menu        = opt.menu

------------------------------------------------------------------- launchers
hl.bind(mainMod .. " + Q",      hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("CTRL + ALT + T",       hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R",      hl.dsp.exec_cmd(menu))

------------------------------------------------------------------- session
hl.bind(mainMod .. " + L",      hl.dsp.exec_cmd("loginctl lock-session"))   -- lock (via hypridle/hyprlock)
hl.bind(mainMod .. " + M",      hl.dsp.exit())                              -- exit Hyprland
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd("wlogout -p layer-shell"))
-- uwsm users: swap the exit dispatcher for hl.dsp.exec_cmd("uwsm stop").

------------------------------------------------------------------- windows
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())          -- dwindle pseudotile
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle split

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

------------------------------------------------------------------- workspaces
-- SUPER + [1..0]         -> switch
-- SUPER + SHIFT + [1..0] -> move focused window
for i = 1, 10 do
    local key = i % 10  -- 10 maps to the "0" key
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- scratchpad
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- scroll workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- mouse move / resize (hold SUPER)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

------------------------------------------------------------------- screenshots  (pkg: grim, slurp, wl-clipboard)
hl.bind("Print",               hl.dsp.exec_cmd("grim - | wl-copy"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
hl.bind("SHIFT + Print",       hl.dsp.exec_cmd('grim ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png'))

------------------------------------------------------------------- clipboard history  (pkg: cliphist)
hl.bind(mainMod .. " + SHIFT + V",
        hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))

------------------------------------------------------------------- multimedia (locked + key-repeat)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),       { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),       { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                    { locked = true, repeating = true })

------------------------------------------------------------------- media transport (locked)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
