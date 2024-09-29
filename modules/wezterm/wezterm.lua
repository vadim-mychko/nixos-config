local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local _, _, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.color_scheme = "Modus Vivendi"
config.font_size = 14.0
config.font = wezterm.font_with_fallback({
  "JetBrains Mono NL",
  "MesloLGS NF",
  "Noto Color Emoji",
})

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  { key = "n",          mods = "CTRL",         action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
  { key = ";",          mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
  { key = "'",          mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
  { key = "z",          mods = "LEADER",       action="TogglePaneZoomState"},
  { key = "v",          mods = "LEADER",       action=wezterm.action.ActivateCopyMode},
  { key = ":",          mods = "LEADER|SHIFT", action=wezterm.action.ActivateCommandPalette},
  { key = "1",          mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
  { key = "2",          mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
  { key = "3",          mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
  { key = "4",          mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
  { key = "5",          mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
  { key = "6",          mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
  { key = "7",          mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
  { key = "8",          mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
  { key = "9",          mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
  { key = "LeftArrow",  mods = "ALT",          action=wezterm.action{ActivatePaneDirection="Left"}},
  { key = "DownArrow",  mods = "ALT",          action=wezterm.action{ActivatePaneDirection="Down"}},
  { key = "UpArrow",    mods = "ALT",          action=wezterm.action{ActivatePaneDirection="Up"}},
  { key = "RightArrow", mods = "ALT",          action=wezterm.action{ActivatePaneDirection="Right"}},
  { key = "LeftArrow",  mods = "SHIFT",        action=wezterm.action{ActivateTabRelative=-1}},
  { key = "RightArrow", mods = "SHIFT",        action=wezterm.action{ActivateTabRelative=1}},
}

return config
