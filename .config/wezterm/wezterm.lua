local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'Gruvbox Material (Gogh)'
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.initial_rows = 40
config.initial_cols = 175
config.font_size = 14
config.window_close_confirmation = 'NeverPrompt'
config.colors = {
    cursor_fg = 'black',
}
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
    {
        key = 'a',
        mods = 'CTRL',
        action = wezterm.action.ShowTabNavigator
    },
    {
        key = 'E',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(function(window, pane, line)
                -- line will be `nil` if they hit escape without entering anything
                -- An empty string if they just hit enter
                -- Or the actual line of text they wrote
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        },
    },
}

-- config.window_frame = {
--     border_left_width = '0.4cell',
--     border_right_width = '0.4cell',
--     border_bottom_height = '0.20cell',
--     border_top_height = '0.20cell',
--     border_left_color = '#a9b665',
--     border_right_color = '#a9b665',
--     border_bottom_color = '#a9b665',
--     border_top_color = '#a9b665',
-- }

return config
