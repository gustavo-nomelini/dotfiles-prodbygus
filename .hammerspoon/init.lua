-- Move mouse cursor to the next monitor and left-click (Cmd + Ctrl + Right)
hs.hotkey.bind({ "cmd", "ctrl" }, "right", function()
    moveMouseToScreenAndClick(hs.mouse.getCurrentScreen():next())
end)

-- Move mouse cursor to the previous monitor and left-click (Cmd + Ctrl + Left)
hs.hotkey.bind({ "cmd", "ctrl" }, "left", function()
    moveMouseToScreenAndClick(hs.mouse.getCurrentScreen():previous())
end)

-- Function to move the mouse to the center of the specified screen and perform a left-click
function moveMouseToScreenAndClick(screen)
    if not screen then
        hs.alert.show("No next/previous screen available 🚫")
        return
    end

    local rect = screen:fullFrame() -- Get the screen's bounds
    local center = hs.geometry.rectMidPoint(rect) -- Calculate the center

    -- Move mouse smoothly to the center of the new screen
    hs.mouse.setAbsolutePosition(center)

    -- Perform a left-click at the new position
    hs.eventtap.leftClick(center)

    -- Show alert with the screen name
    hs.alert.show("Switched to " .. screen:name() .. " 🖥️")
end

-- Show a notification when Hammerspoon config is loaded
hs.alert.show("Mouse Switching with Smooth Click Enabled 🚀")
