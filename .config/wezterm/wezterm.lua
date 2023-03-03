local wezterm = require 'wezterm'

return {
    color_scheme              = 'Gruvbox Dark',
    initial_cols              = 175,
    initial_rows              = 40,
    font_size                 = 15,
    window_close_confirmation = 'NeverPrompt',
    keys                      = {
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
    },
}
