-- windows.lua
local log = hs.logger.new("Windows", "info")
local windows = {}

-- Function to cycle focus through windows in the current space
function windows.cycleFocusOnCurrentSpace()
	local currentWindows = hs.window.filter
		.new()
		:setCurrentSpace(true)
		:setDefaultFilter({ visible = true, currentSpace = true })
		:getWindows()
	local currentFocusedWindow = hs.window.focusedWindow()

	for i, win in ipairs(currentWindows) do
		if win == currentFocusedWindow then
			local nextIndex = (i % #currentWindows) + 1
			log.i("Cycling focus to window: " .. currentWindows[nextIndex]:title())
			currentWindows[nextIndex]:focus()
			currentWindows[nextIndex]:raise()
			break
		end
	end
end

return windows
