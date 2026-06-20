-- ~/.config/hypr/autostart.lua
-- ============================================================================
-- Things to launch ONCE when the session starts.
-- Using hl.on("hyprland.start", ...) instead of a bare exec means these do NOT
-- re-spawn every time you save/reload the config (no duplicate Waybars).
-- Reference: https://wiki.hypr.land/Configuring/Basics/Autostart/
-- ============================================================================

hl.on("hyprland.start", function()
    -- Wayland / dbus session environment
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Essentials (yours)
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("nm-applet --indicator")

    -- NEW: notification daemon  (install: mako)
    hl.exec_cmd("mako")

    -- NEW: clipboard history     (install: cliphist, wl-clipboard)
    hl.exec_cmd("wl-paste --type text  --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- NEW: make sure the screenshots folder exists
    hl.exec_cmd("mkdir -p ~/Pictures/Screenshots")

    -- Fun: your matrix terminal. Delete this line if you don't want it each login.
    hl.exec_cmd("alacritty -e cmatrix")
end)
