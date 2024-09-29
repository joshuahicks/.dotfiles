-- spaces.lua
local log = hs.logger.new("Spaces", "info")
local spaces = {}

-- Function to get the space ID by name
function spaces.getSpaceIdByName(spaceName)
	local spaceNames = hs.spaces.missionControlSpaceNames()
	for uuid, desktops in pairs(spaceNames) do
		for index, name in pairs(desktops) do
			if name == spaceName then
				log.i("Found spaceId for " .. spaceName .. ": " .. index)
				return index
			end
		end
	end
	log.w("Space not found: " .. spaceName)
	return nil
end

-- Function to move the focused window to a specified space and switch to that space
function spaces.moveFocusedWindowToSpace(spaceNumber)
	local spaceName = "Desktop " .. spaceNumber
	local spaceId = spaces.getSpaceIdByName(spaceName)
	if spaceId then
		local focusedWindow = hs.window.focusedWindow()
		if focusedWindow then
			log.i("Moving window " .. focusedWindow:title() .. " to spaceId " .. spaceId)
			hs.spaces.moveWindowToSpace(focusedWindow:id(), spaceId)

			-- Now switch to the new space
			log.i("Switching to space " .. spaceId)
			hs.spaces.gotoSpace(spaceId)
		else
			log.w("No focused window")
			hs.alert.show("No focused window")
		end
	else
		log.w("Space not found: " .. spaceName)
		hs.alert.show("Space not found: " .. spaceName)
	end
end

return spaces
