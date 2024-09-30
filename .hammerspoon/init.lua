-- SOURCE: https://konradstaniszewski.com/blog/windows-between-spaces

local spaces = require("modules.spaces")
local windows = require("modules.windows")
local keybindings = require("modules.keybindings")

keybindings.bindKeys(spaces, windows)

hs.alert.show("Hammerspoon config loaded")
