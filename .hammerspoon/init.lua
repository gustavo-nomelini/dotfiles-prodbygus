-- Move mouse cursor to the next monitor and left-click (Cmd + Ctrl + Right)
hs.hotkey.bind({ "cmd", "ctrl" }, "right", function()
	moveMouseToScreenAndClick(hs.screen.mainScreen():next())
end)

-- Move mouse cursor to the previous monitor and left-click (Cmd + Ctrl + Left)
hs.hotkey.bind({ "cmd", "ctrl" }, "left", function()
	moveMouseToScreenAndClick(hs.screen.mainScreen():previous())
end)

-- Function to move the mouse to the center of the specified screen and perform a left-click
function moveMouseToScreenAndClick(screen)
	if not screen then
		return
	end

	local rect = screen:fullFrame() -- Get the screen's bounds
	local center = hs.geometry.rectMidPoint(rect) -- Calculate the center

	hs.mouse.absolutePosition(center) -- Move the mouse cursor to the center

	-- Perform a left-click at the current mouse position
	hs.eventtap.leftClick(center)
end

-- Show a notification when Hammerspoon config is loaded
hs.alert.show("Mouse Switching with Click Enabled 🚀")
