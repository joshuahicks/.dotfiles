-- SOURCE: https://konradstaniszewski.com/blog/windows-between-spaces

-- Load modules
local spaces = require("modules.spaces")
local windows = require("modules.windows")
local keybindings = require("modules.keybindings")

-- Set up keybindings
keybindings.bindKeys(spaces, windows)

-- Start Hammerspoon config
hs.alert.show("Hammerspoon config loaded")
