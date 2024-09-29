-- SOURCE: https://konradstaniszewski.com/blog/windows-between-spaces

local log = hs.logger.new("WindowMover", "info")

function getSpaceIdByName(spaceName)
	local spaceNames = hs.spaces.missionControlSpaceNames()
	for uuid, desktops in pairs(spaceNames) do
		log.i("UUID: " .. uuid)
		for index, name in pairs(desktops) do
			log.i("Index: " .. index .. ", Name: " .. tostring(name)) -- Log the index and name
			if name == spaceName then
				log.i("Found spaceId for " .. spaceName .. ": " .. index)
				return index
			end
		end
	end
	log.w("Space not found: " .. spaceName)
	return nil
end

function moveFocusedWindowToSpace(spaceNumber)
	local spaceName = "Desktop " .. spaceNumber
	log.i("Attempting to move window to " .. spaceName)
	local spaceId = getSpaceIdByName(spaceName)
	if spaceId then
		local focusedWindow = hs.window.focusedWindow()
		if focusedWindow then
			log.i("Moving window " .. focusedWindow:title() .. " to spaceId " .. spaceId)
			hs.spaces.moveWindowToSpace(focusedWindow:id(), spaceId)
		else
			log.w("No focused window")
			hs.alert.show("No focused window")
		end
	else
		log.w("Space not found: " .. spaceName)
		hs.alert.show("Space not found: " .. spaceName)
	end
end

function cycleFocusOnCurrentSpace()
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

-- Change the window to a new workspace
for i = 1, 5 do
	hs.hotkey.bind({ "alt", "shift" }, tostring(i), function()
		log.i("Hotkey pressed: alt + shift + " .. i)
		moveFocusedWindowToSpace(i)
	end)
end

-- Change window focus in the current workspace
hs.hotkey.bind({ "ctrl" }, "`", cycleFocusOnCurrentSpace)
