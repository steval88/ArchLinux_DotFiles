# Hyprland — modular Lua config (0.55+)

A clean, modular rewrite of your `hyprland.conf` in the new **Lua** config format,
themed end-to-end with **Catppuccin Mocha** so Hyprland's borders finally match
your Waybar.

## File map

```
~/.config/hypr/
├── hyprland.lua      # entry point — requires the modules below
├── theme.lua         # ← the ONLY place colors live (Catppuccin Mocha)
├── monitors.lua      # displays
├── looknfeel.lua     # general / decoration / layout  (reads theme.lua)
├── animations.lua    # curves + animation timings
├── input.lua         # keyboard / touchpad / 3-finger gesture
├── autostart.lua     # launched once at session start
├── keybinds.lua      # all keybindings
├── windowrules.lua   # window rules
└── hyprpaper.conf    # unchanged (hyprpaper still uses the classic syntax)
```

To re-theme the whole desktop later, edit `theme.lua` alone.

## 0. Requirement: Hyprland 0.55 or newer

Lua config is ignored on older versions. Check first:

```bash
hyprctl version          # need 0.55.x or newer
sudo pacman -Syu         # update if you're behind
```

If you're still on 0.53/0.54, the `.lua` file simply won't load and your old
`.conf` keeps working — no harm, but the migration won't take effect until you update.

## 1. Extra packages this config expects

You already run alacritty, wofi, dolphin, waybar, hyprpaper, wlogout, polkit-gnome,
nm-applet, brightnessctl, playerctl and wireplumber. New bits used here:

```bash
sudo pacman -S grim slurp wl-clipboard cliphist mako
```

(`grim`+`slurp`+`wl-clipboard` = screenshots, `cliphist` = clipboard history,
`mako` = notifications. Drop any you don't want and remove the matching lines.)

## 2. Install — the safe way

**Do not delete your old config yet.** On 0.55+, if `hyprland.lua` exists it is
loaded *instead of* `hyprland.conf`, so your `.conf` stays as a perfect fallback.

```bash
cd ~/.config/hypr
cp hyprland.conf hyprland.conf.bak     # keep a backup (if you still have one)

# copy the new files in (from wherever you unzipped them)
cp /path/to/new/*.lua  ~/.config/hypr/
```

Then reload **without logging out** so you can't get locked out:

```bash
hyprctl reload
```

If something's wrong, Hyprland pops an error notification but keeps running, and
guarantees emergency binds: **SUPER+Q** (terminal), **SUPER+R** (menu),
**SUPER+M** (exit). Fix the file, save, and it reloads instantly.

**Full fallback:** to go back to the old config, just move the Lua file aside and
restart Hyprland:

```bash
mv ~/.config/hypr/hyprland.lua ~/.config/hypr/hyprland.lua.off
```

## 3. What changed vs your old config

- **Theme coherence** — Hyprland's active border is now the same blue→lavender
  gradient as your Waybar active workspace; inactive border + shadow pulled into
  the Catppuccin surfaces. All from `theme.lua`.
- **Modular** — one 330-line file became eight focused modules. Each `require()`
  is error-isolated, so a typo in one won't kill the others.
- **Workspaces via a loop** — your 20 hand-written workspace binds are now a
  single `for i = 1, 10` loop.
- **Removed upstream bits handled** — `dwindle.pseudotile` (deleted upstream) is
  gone; `togglesplit` is now `hl.dsp.layout("togglesplit")`. Pseudotile still
  works on **SUPER+P**.
- **Autostart runs once** — moved into `hl.on("hyprland.start", ...)`, so saving
  the config no longer spawns duplicate Waybars.
- **New workflow binds** (see below).

## 4. New keybinds

| Keys | Action |
|------|--------|
| `Print` | Screenshot whole screen → clipboard |
| `SUPER + Print` | Screenshot a region → clipboard |
| `SHIFT + Print` | Screenshot whole screen → `~/Pictures/Screenshots/` |
| `SUPER + SHIFT + V` | Clipboard history picker (via wofi) |
| `SUPER + S` | Toggle scratchpad (special workspace) |
| `SUPER + SHIFT + S` | Send window to scratchpad |

Everything you already had (launchers, focus, workspaces, mouse move/resize,
volume/brightness/media keys) is preserved.

## 5. Notes

- The Lua config format is new (Hyprland 0.55, ~May 2026). Every construct here
  was translated against Hyprland's official `example/hyprland.lua`, so the core
  is solid. A couple of "nice to have" window-rule props (size/center/opacity)
  were intentionally left out — add them from the Window-Rules wiki page once
  you've confirmed the base loads.
- `hyprpaper.conf` still points at `/usr/share/wallpapers/Mountain/...`; change
  `preload`/`wallpaper` there to use your own image.
- Stray `~/.config/waybar/config.backup` in your dotfiles isn't read by Waybar —
  fine to delete; I left your Waybar config untouched.
