local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.automatically_reload_config = true

config.scrollback_lines = 5000

config.native_macos_fullscreen_mode = true

config.use_ime = true

-- appearance{{{
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = 'Builtin Tango Dark'
config.window_background_opacity = 0.7
config.text_background_opacity = 0.6
config.macos_window_background_blur = 16

config.font = wezterm.font 'Ricty Nerd Font'
config.font_size = 14
-- }}}

-- keys {{{
config.keys = {
    {
      key = "¥",
      mods = "ALT",
      action = wezterm.action.SendKey({ key = "\\" }),
    },
    {
      key = 'f',
      mods = 'CTRL|CMD',
      action = wezterm.action.ToggleFullScreen,
    },

    {
      key = '^',
      mods = 'CTRL',
      action = wezterm.action.DisableDefaultAssignment,
    },
    {
      key = '^',
      mods = 'SHIFT|CTRL',
      action = wezterm.action.DisableDefaultAssignment,
    },

    {
      key = 'LeftArrow',
      mods = 'SHIFT|CTRL',
      action = wezterm.action.DisableDefaultAssignment,
    },
    {
      key = 'RightArrow',
      mods = 'SHIFT|CTRL',
      action = wezterm.action.DisableDefaultAssignment,
    },
}
-- }}}

return config

-- vim: fdm=marker
