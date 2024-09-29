local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.window_decorations = "RESIZE"
config.color_scheme = "Modus-Vivendi"
config.font_size = 12.0
config.font = wezterm.font_with_fallback({
  "JetBrains Mono NL",
  "MesloLGS NF",
  "Noto Color Emoji",
})

return config
