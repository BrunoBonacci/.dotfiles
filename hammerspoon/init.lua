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

-- HALF
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad0", function()
  part(2,1)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad.", function()
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

-- RESIZING

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



-- MOVE

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


-- LAYOUTS

hs.hotkey.bind({}, "f2", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

    local windowLayout = {
        {"Google Chrome",  nil, screen, hs.geometry.rect(0, 0, 0.15, 1), nil, nil},
        {"Emacs",   nil, screen, hs.geometry.rect(0.15, 0, 0.70, 1), nil, nil},
        {"iTerm2",  nil, screen, hs.geometry.rect(0.85, 0, 0.15, 1), nil, nil},
    }
    hs.layout.apply(windowLayout)
    hs.alert.show("Emacs DEV Layout applied!")
end)



-- INFO and HELP
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
    local help = [[
    Hammerspoon keymap
    -------------------------------------------
     [ctrl+opt+cmd] + 0, .          : Halves
     [ctrl+opt+cmd] + 1, 2, 3       : Thirds
     [ctrl+opt+cmd] + 4, 5, 6, +    : Quarters
     [ctrl+opt+cmd] + 7, 8, 9, -,*  : Fifths

     [ctrl+opt+cmd] + ⬆, ⬇, ⬅, ➡    : Resize half/double
    [alt+opt+shift] + ⬆, ⬇, ⬅, ➡    : Move to next/prev slot

     [ctrl+opt+cmd] + R             : Reload config
     [ctrl+opt+cmd] + H             : This help
    -------------------------------------------
]]
    hs.alert.show(help, hs.alert.defaultStyle, hs.screen.mainScreen(), 5)
end)


-- RELOAD

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded!")