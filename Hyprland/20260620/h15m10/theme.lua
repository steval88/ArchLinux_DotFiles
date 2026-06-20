-- ~/.config/hypr/conf/theme.lua
-- ============================================================================
--  Catppuccin Mocha — the single source of truth for color.
--  Two tiers:
--    palette = raw named colors (don't reference these directly elsewhere)
--    roles   = semantic names the rest of the config actually uses
--  Re-skin by repointing the roles (or swapping the whole palette) right here.
--  These hex values match your Waybar style.css, so bar + borders stay in sync.
-- ============================================================================

local palette = {
    base     = "rgb(1e1e2e)",
    mantle   = "rgb(181825)",
    crust    = "rgb(11111b)",
    surface0 = "rgb(313244)",
    surface1 = "rgb(45475a)",
    surface2 = "rgb(585b70)",

    text     = "rgb(cdd6f4)",
    subtext  = "rgb(a6adc8)",

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
}

return {
    palette = palette,

    -- semantic roles — referenced by the modules
    border_active   = { colors = { palette.blue, palette.lavender }, angle = 45 },
    border_inactive = "rgba(45475aaa)", -- surface1 @ ~67% alpha (RRGGBBAA)
    shadow          = 0xee11111b,        -- crust @ ~93% alpha (AARRGGBB int)
    accent          = palette.blue,
    urgent          = palette.red,
}
