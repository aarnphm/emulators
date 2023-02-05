local action = require("wezterm").action
local M = {}

M.disable_default_key_bindings = true
M.leader = { key = "a", mods = "SUPER", timeout_milliseconds = 1000 }
M.keys = {
  {
    mods = "LEADER",
    key = [[-]],
    action = action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
  },
  {
    mods = "LEADER",
    key = [[\]],
    action = action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
  },

  { key = "c", mods = "LEADER", action = action({ SpawnTab = "CurrentPaneDomain" }) },
  { key = "x", mods = "LEADER", action = action({ CloseCurrentTab = { confirm = false } }) },
  { mods = "LEADER", key = "n", action = action({ ActivateTabRelative = 1 }) },
  { mods = "LEADER", key = "p", action = action({ ActivateTabRelative = -1 }) },
  { mods = "LEADER", key = "l", action = action({ MoveTabRelative = -1 }) },
  { mods = "SUPER", key = "Enter", action = action.ToggleFullScreen },

  -- standard copy/paste bindings
  { mods = "ALT", key = "h", action = action({ ActivatePaneDirection = "Left" }) },
  { mods = "ALT", key = "l", action = action({ ActivatePaneDirection = "Right" }) },
  { mods = "ALT", key = "j", action = action({ ActivatePaneDirection = "Down" }) },
  { mods = "ALT", key = "k", action = action({ ActivatePaneDirection = "Up" }) },
  { key = "h", mods = "SUPER", action = action({ AdjustPaneSize = { "Left", 10 } }) },
  { key = "l", mods = "SUPER", action = action({ AdjustPaneSize = { "Right", 10 } }) },
  { key = "k", mods = "SUPER", action = action({ AdjustPaneSize = { "Up", 10 } }) },
  { key = "j", mods = "SUPER", action = action({ AdjustPaneSize = { "Down", 10 } }) },
  { mods = "SHIFT|ALT", key = "F12", action = action.ShowDebugOverlay },

  -- default keybind
  { key = "c", mods = "SUPER", action = action({ CopyTo = "Clipboard" }) },
  { key = "c", mods = "CTRL|SHIFT", action = action({ CopyTo = "Clipboard" }) },
  { key = "v", mods = "SUPER", action = action({ PasteFrom = "Clipboard" }) },
  { key = "v", mods = "CTRL|SHIFT", action = action({ PasteFrom = "Clipboard" }) },
  { key = "=", mods = "LEADER", action = "ResetFontSize" },
  { key = "=", mods = "SUPER", action = "IncreaseFontSize" },
  { key = "-", mods = "SUPER", action = "DecreaseFontSize" },
  { key = "x", mods = "CTRL|SHIFT", action = action.ActivateCopyMode },
  { key = "e", mods = "CTRL|SHIFT", action = action({ ScrollByPage = -1 }) },
  { key = "y", mods = "CTRL|SHIFT", action = action({ ScrollByPage = 1 }) },
  { key = "1", mods = "SUPER", action = action({ ActivateTab = 0 }) },
  { key = "2", mods = "SUPER", action = action({ ActivateTab = 1 }) },
  { key = "3", mods = "SUPER", action = action({ ActivateTab = 2 }) },
  { key = "4", mods = "SUPER", action = action({ ActivateTab = 3 }) },
  { key = "5", mods = "SUPER", action = action({ ActivateTab = 4 }) },
  { key = "6", mods = "SUPER", action = action({ ActivateTab = 5 }) },
  { key = "7", mods = "SUPER", action = action({ ActivateTab = 6 }) },
  { key = "8", mods = "SUPER", action = action({ ActivateTab = 7 }) },
  { key = "9", mods = "SUPER", action = action({ ActivateTab = 8 }) },
  { key = "q", mods = "SUPER", action = action({ CloseCurrentPane = { confirm = false } }) },
}

return M
