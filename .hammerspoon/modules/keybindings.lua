-- keybindings.lua
local log = hs.logger.new("Keybindings", "info")
local keybindings = {}

function keybindings.bindKeys(spaces, windows)
	-- Bind keys to move windows to different spaces
	for i = 1, 5 do
		hs.hotkey.bind({ "cmd", "shift" }, tostring(i), function()
			log.i("Hotkey pressed: alt + shift + " .. i)
			spaces.moveFocusedWindowToSpace(i)
		end)
	end

	-- Bind key to cycle through windows in the current space
	hs.hotkey.bind({ "ctrl" }, "`", windows.cycleFocusOnCurrentSpace)
end

return keybindings
