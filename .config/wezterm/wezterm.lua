local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'GruvboxDark'
config.initial_rows = 40
config.initial_cols = 175
config.font_size = 14
config.window_close_confirmation = 'NeverPrompt'
config.keys = {
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
        key = 'k',
        mods = 'CMD',
        action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
    },
}

return config
