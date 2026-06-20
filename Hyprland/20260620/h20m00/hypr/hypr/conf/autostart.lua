-- ~/.config/hypr/conf/autostart.lua
-- ============================================================================
--  Launch-once processes. hl.on("hyprland.start", ...) means these don't
--  re-spawn on every config reload (no duplicate Waybars).
--  https://wiki.hypr.land/Configuring/Basics/Autostart/
-- ============================================================================

hl.on("hyprland.start", function()
    -- session environment
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- essentials
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("nm-applet --indicator")

    -- notifications        (pkg: mako)
    hl.exec_cmd("mako")

    -- idle / lock daemon   (pkg: hypridle; uses hyprlock.conf for the lock screen)
    hl.exec_cmd("hypridle")

    -- clipboard history    (pkg: cliphist, wl-clipboard)
    hl.exec_cmd("wl-paste --type text  --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- screenshots folder
    hl.exec_cmd("mkdir -p ~/Pictures/Screenshots")

    -- fun: matrix terminal (delete if you don't want it each login)
    hl.exec_cmd("alacritty -e cmatrix")
end)
