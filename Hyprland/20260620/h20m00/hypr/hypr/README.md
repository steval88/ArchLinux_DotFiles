# Hyprland Dotfiles — Catppuccin Mocha (Lua)

A clean, **modular Hyprland configuration** written in the new **Lua config format**
(Hyprland 0.55+), themed end to end with **Catppuccin Mocha**. Built to be readable,
easy to re-skin, and safe to iterate on.

![Hyprland](https://img.shields.io/badge/Hyprland-0.55%2B-89b4fa)
![Config](https://img.shields.io/badge/config-Lua-blue)
![Theme](https://img.shields.io/badge/theme-Catppuccin%20Mocha-f5c2e7)
![Distro](https://img.shields.io/badge/Arch%20Linux-1793D1?logo=archlinux&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-a6e3a1)

---

## Highlights

- **Modular by design** — one monolithic `hyprland.conf` split into small, focused
  modules under `conf/`. Each is loaded via `require()`, which Hyprland runs in its
  own error-isolated scope, so a typo in one file won't take down the session.
- **One control panel** — programs, modifier key, gaps, rounding, and effect/input
  toggles all live in `conf/options.lua`. The other modules read from it.
- **Two-tier theming** — `conf/theme.lua` holds a raw Catppuccin palette plus
  *semantic roles* (`border_active`, `accent`, `urgent`, …). Re-skin by repointing
  the roles, not by hunting hex codes across files.
- **Coherent look** — Hyprland borders use the same blue→lavender gradient as the
  Waybar active workspace, so the bar and the compositor read as one desktop.
- **Workflow built in** — screenshots, clipboard history, a scratchpad, and
  notifications are wired up out of the box.
- **Safe to roll out** — keeps your old `.conf` as a fallback; uses guaranteed
  emergency keybinds if a first start ever errors.

## Screenshots

> Add your own — drop images in `assets/` and reference them here.

```
![Desktop](assets/desktop.png)
![Workspaces](assets/workspaces.png)
```

## Stack

| Role | Tool |
|------|------|
| Compositor | Hyprland (Lua config, 0.55+) |
| Bar | Waybar |
| Wallpaper | hyprpaper |
| Launcher | wofi |
| Terminal | Alacritty |
| File manager | Dolphin |
| Notifications | mako |
| Lock screen | hyprlock |
| Idle / suspend | hypridle |
| Clipboard history | cliphist |
| Screenshots | grim + slurp + wl-clipboard |
| Logout menu | wlogout |

## Repository structure

```
hypr/
├── hyprland.lua          # entry point: sets the require path, loads conf/* in order
├── hyprpaper.conf        # wallpaper (classic syntax — hyprpaper isn't Lua yet)
├── hyprlock.conf         # lock screen (classic syntax)
├── hypridle.conf         # idle / suspend daemon (classic syntax)
└── conf/
    ├── options.lua       # ← control panel: programs, modifier, gaps, toggles
    ├── theme.lua         # ← colors: Catppuccin Mocha palette + semantic roles
    ├── env.lua           # environment variables
    ├── monitors.lua      # displays
    ├── looknfeel.lua     # general + decoration   (reads options + theme)
    ├── animations.lua    # curves + timings       (reads options)
    ├── input.lua         # keyboard / touchpad / gesture (reads options)
    ├── autostart.lua     # launch-once processes
    ├── keybinds.lua      # keybindings            (reads options)
    ├── windowrules.lua   # window rules
    └── workspaces.lua    # workspace rules + smart gaps (reads options)
```

**Design rule:** values live in `options.lua` and `theme.lua`; every other module
just wires them up.

## Requirements

- **Hyprland 0.55 or newer** (Lua config is ignored on older versions). Check with:
  ```bash
  pacman -Q hyprland
  ```
- Packages used by this config:
  ```bash
  sudo pacman -S hyprland waybar hyprpaper wofi alacritty dolphin \
                 mako cliphist wl-clipboard grim slurp wlogout \
                 hyprlock hypridle \
                 polkit-gnome network-manager-applet \
                 brightnessctl playerctl wireplumber
  ```
  Drop anything you don't want and remove the matching lines in `autostart.lua` /
  `keybinds.lua`.

## Installation

> On 0.55+, if `hyprland.lua` exists it is loaded **instead of** `hyprland.conf`.
> Keep your old `.conf` in place as a fallback during the first switch.

```bash
# 1. Clone
git clone https://github.com/<you>/<repo>.git
cd <repo>

# 2. Back up any existing Hyprland config
cp -r ~/.config/hypr ~/.config/hypr.bak 2>/dev/null || true

# 3. Install the config (copy, or symlink if you prefer)
mkdir -p ~/.config/hypr
cp -r hypr/* ~/.config/hypr/
```

Hyprland chooses `.conf` vs `.lua` **once, at startup** — so the first time you
switch, start a fresh Hyprland session (log out and log back into Hyprland from
your display manager). After that first Lua start, `hyprctl reload` applies live
edits normally.

If a module ever errors on start, Hyprland keeps running and guarantees emergency
binds — **SUPER+Q** (terminal), **SUPER+R** (menu), **SUPER+M** (exit) — so you can
open a shell, fix it, and reload. To revert entirely:

```bash
mv ~/.config/hypr/hyprland.lua ~/.config/hypr/hyprland.lua.off
# then restart Hyprland — it falls back to hyprland.conf
```

## Customization

- **Behavior** → edit `conf/options.lua` (your terminal, launcher, modifier, gaps,
  rounding, blur/animations on/off, smart-gaps, keyboard layout…).
- **Keyboard layout** → `kb_layout` in `conf/options.lua`. This defaults to `it`;
  **non-US users should set this first** (e.g. `"us"`, `"de"`, `"fr"`) — a wrong
  layout makes the keybinds appear "dead" because the keys land on other characters.
- **Colors** → edit `conf/theme.lua`. Change the palette values, or repoint the
  semantic roles, and everything updates at once. (One exception: `hyprlock.conf`
  can't read Lua, so its accent colors are written inline — mirror them there if
  you re-skin.)
- **Lock / idle timeouts** → edit `hypridle.conf` (seconds): when to lock, when to
  blank the screen, when to suspend.
- **Displays** → edit `conf/monitors.lua`. Find your outputs and modes with
  `hyprctl monitors`, then add an `hl.monitor({ ... })` block per screen.

## Keybindings

`SUPER` is the modifier.

| Keys | Action |
|------|--------|
| `SUPER + Q` / `SUPER + RETURN` | Terminal |
| `SUPER + E` | File manager |
| `SUPER + R` | App launcher |
| `SUPER + C` | Close window |
| `SUPER + V` | Toggle floating |
| `SUPER + P` | Pseudotile (dwindle) |
| `SUPER + J` | Toggle split (dwindle) |
| `SUPER + ←/→/↑/↓` | Move focus |
| `SUPER + [1–0]` | Switch workspace |
| `SUPER + SHIFT + [1–0]` | Move window to workspace |
| `SUPER + S` / `SUPER + SHIFT + S` | Scratchpad: toggle / send window |
| `SUPER + drag (LMB/RMB)` | Move / resize window |
| `Print` / `SUPER + Print` / `SHIFT + Print` | Screenshot: screen→clip / region→clip / screen→file |
| `SUPER + SHIFT + V` | Clipboard history |
| `SUPER + L` | Lock screen |
| `SUPER + ESCAPE` | Logout menu |
| `SUPER + M` | Exit Hyprland |
| Media / volume / brightness keys | Standard (work while locked) |

## Notes

- Lua is the current, supported config format as of Hyprland **0.55** (May 2026).
  The classic `hyprland.conf` (hyprlang) syntax still loads but is **deprecated** and
  slated for removal in a future release — this repo is the forward-looking setup.
- Every module was translated against Hyprland's official `example/hyprland.lua`
  and parse-checked, so the base is solid. A few advanced window-rule properties are
  intentionally left out — add them from the wiki as you need them.
- `hyprpaper`, `hyprlock`, and similar `hypr*` tools still use the classic syntax;
  only the compositor itself moved to Lua.

## Credits

- [Hyprland](https://github.com/hyprwm/Hyprland) and its official Lua example config
- [Catppuccin](https://github.com/catppuccin/catppuccin) for the Mocha palette
- The maintainers of Waybar, wofi, mako, cliphist, grim, and slurp

## License

MIT — see [`LICENSE`](LICENSE). Change it to whatever you prefer, and add a `LICENSE`
file if you haven't yet.
