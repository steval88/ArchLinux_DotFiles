-- ~/.config/hypr/theme.lua
-- ============================================================================
-- Catppuccin Mocha — the SINGLE place colors live.
-- These are the exact values your Waybar style.css already uses, so once
-- Hyprland reads from here, the borders and the bar finally match.
--
-- Want a different look later? Change the hex values here (or swap this whole
-- file for another palette) and everything that references it updates at once.
-- ============================================================================

return {
    -- base + surfaces
    base     = "rgb(1e1e2e)",
    mantle   = "rgb(181825)",
    crust    = "rgb(11111b)",
    surface0 = "rgb(313244)",
    surface1 = "rgb(45475a)",
    surface2 = "rgb(585b70)",

    -- text
    text     = "rgb(cdd6f4)",
    subtext  = "rgb(a6adc8)",

    -- accents
    blue     = "rgb(89b4fa)",
    lavender = "rgb(b4befe)",
    sapphire = "rgb(74c7ec)",
    sky      = "rgb(89dceb)",
    teal     = "rgb(94e2d5)",
    green    = "rgb(a6e3a1)",
    yellow   = "rgb(f9e2af)",
    peach    = "rgb(fab387)",
    maroon   = "rgb(eba0ac)",
    red      = "rgb(f38ba8)",
    mauve    = "rgb(cba6f7)",
    pink     = "rgb(f5c2e7)",

    -- pre-baked special forms Hyprland wants
    inactive = "rgba(45475aaa)", -- inactive border: surface1 @ ~67% alpha (RRGGBBAA)
    shadow   = 0xee11111b,        -- drop shadow: crust @ ~93% alpha (AARRGGBB int)
}
