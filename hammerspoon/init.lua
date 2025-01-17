--------------------------------------------------------------------------------
-- Window layout management
--------------------------------------------------------------------------------
function part(parts, part)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + ((max.w / parts) * (part - 1))
  f.y = max.y
  f.w = max.w / parts
  f.h = max.h
  win:setFrame(f)
end

-- FULL SCREEN
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "f", function()
  part(1,1)
end)


-- HALF
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad0", function()
  part(2,1)
end)

-- alternative binding for built-in keyboard
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "-", function()
  part(2,1)
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad.", function()
  part(2,2)
end)

-- alternative binding for built-in keyboard
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "=", function()
  part(2,2)
end)

-- THIRD
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad1", function()
  part(3,1)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad2", function()
  part(3,2)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad3", function()
  part(3,3)
end)

-- QUARTER
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad4", function()
  part(4,1)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad5", function()
  part(4,2)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad6", function()
  part(4,3)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad+", function()
  part(4,4)
end)

-- FIFTH
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad7", function()
  part(5,1)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad8", function()
  part(5,2)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad9", function()
  part(5,3)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad-", function()
  part(5,4)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad*", function()
  part(5,5)
end)


-- SIXTH
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "T", function()
  part(6,1)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Y", function()
  part(6,2)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function()
  part(6,3)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "I", function()
  part(6,4)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "O", function()
  part(6,5)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "P", function()
  part(6,6)
end)


--------------------------------------------------------------------------------
-- RESIZING
--------------------------------------------------------------------------------

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.h = f.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.h = f.h * 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.w = f.w / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.w = f.w * 2
  win:setFrame(f)
end)



--------------------------------------------------------------------------------
-- MOVE
--------------------------------------------------------------------------------

hs.hotkey.bind({"alt", "ctrl", "shift"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.y = f.y - f.h
  win:setFrame(f)
end)

hs.hotkey.bind({"alt", "ctrl", "shift"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.y = f.y + f.h
  win:setFrame(f)
end)

hs.hotkey.bind({"alt", "ctrl", "shift"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.x = f.x - f.w
  win:setFrame(f)
end)

hs.hotkey.bind({"alt", "ctrl", "shift"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.x = f.x + f.w
  win:setFrame(f)
end)


--------------------------------------------------------------------------------
-- LAYOUTS presets
--------------------------------------------------------------------------------

hs.hotkey.bind({}, "f2", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

    local windowLayout = {
        {"Google Chrome",  nil, screen, hs.geometry.rect(0, 0, 0.166, 1), nil, nil},
        {"Emacs",   nil, screen, hs.geometry.rect(0.166, 0, 0.668, 1), nil, nil},
        {"kitty",  nil, screen, hs.geometry.rect(0.834, 0, 0.166, 1), nil, nil},
    }
    hs.layout.apply(windowLayout)
    hs.alert.show("Emacs DEV Layout applied!")
end)



--------------------------------------------------------------------------------
-- INFO and HELP
--------------------------------------------------------------------------------
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
    local help = [[
    Hammerspoon keymap
    ----------------------------------------------
     [ctrl+opt+cmd] + f             : full screen
     [ctrl+opt+cmd] + 0, . | -, =   : 1/2
     [ctrl+opt+cmd] + 1, 2, 3       : 1/3
     [ctrl+opt+cmd] + 4, 5, 6, +    : 1/4
     [ctrl+opt+cmd] + 7, 8, 9, -,*  : 1/5
     [ctrl+opt+cmd] + T .. P        : 1/6

     [ctrl+opt+cmd] + ⬆, ⬇, ⬅, ➡    : Resize half/double
    [alt+opt+shift] + ⬆, ⬇, ⬅, ➡    : Move to next/prev slot

     Layouts:
     ---------
     [f2]                           : Emacs Dev

     [ctrl+opt+cmd] + R             : Reload config
     [ctrl+opt+cmd] + H             : This help
    ----------------------------------------------
]]
    hs.alert.show(help, hs.alert.defaultStyle, hs.screen.mainScreen(), 5)
end)


--------------------------------------------------------------------------------
-- LAUNCH new terminal window
--------------------------------------------------------------------------------

hs.hotkey.bind({"cmd", "shift"}, "T", function()
  -- hs.application.open("kitty")

  local t = hs.task.new("/Applications/kitty.app/Contents/MacOS/kitty",
    nil,
    function() return false end,
    { "--single-instance"})
  t:start()
end)



--------------------------------------------------------------------------------
-- CAFFEINATE (stop screen to go to sleep)
--------------------------------------------------------------------------------

caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        -- awake
        caffeine:setTitle("😳")
    else
        -- sleepy
        caffeine:setTitle("💤")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end


-- DEFEATING PASTE BLOCKING

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "V", function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)


--------------------------------------------------------------------------------
-- Move window to workspace
--------------------------------------------------------------------------------

function MoveWindowToSpace(sp)
    local win = hs.window.focusedWindow()       -- current window
    local screenID = hs.screen.mainScreen():getUUID()   -- current screen
    local all_spaces=hs.spaces.allSpaces()
    local spaceID = all_spaces[screenID][sp]
    hs.spaces.moveWindowToSpace(win:id(), spaceID) -- move window to new space
    hs.spaces.gotoSpace(spaceID)                   -- follow window to new space
end

hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, '1', function()
  MoveWindowToSpace(1)
end)

hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, '2', function()
  MoveWindowToSpace(2)
end)

hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, '3', function()
  MoveWindowToSpace(3)
end)

hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, '4', function()
  MoveWindowToSpace(4)
end)

hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, '5', function()
  MoveWindowToSpace(5)
end)

--------------------------------------------------------------------------------
-- RELOAD
--------------------------------------------------------------------------------

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded!")
