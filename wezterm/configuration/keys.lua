local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

config.keys = {
  {
    mods = "CTRL",
    key = [[-]],
    action = act({
      SplitVertical = { domain = "CurrentPaneDomain" },
    }),
  },
  {
    mods = "CTRL",
    key = [[\]],
    action = act({ SplitHorizontal = { domain = "CurrentPaneDomain", args = { "zsh", "-l" } } }),
  }, -- browser-like bindings for tabbing
  {
    key = "t",
    mods = "CTRL",
    action = act({ SpawnTab = "CurrentPaneDomain" }),
  },
  {
    key = "q",
    mods = "CTRL",
    action = act({ CloseCurrentTab = { confirm = true } }),
  },
  {
    mods = "CTRL",
    key = "Tab",
    action = act({ ActivateTabRelative = 1 }),
  },
  {
    mods = "CTRL|SHIFT",
    key = "Tab",
    action = act({ ActivateTabRelative = -1 }),
  }, -- standard copy/paste bindings
  {
    mods = "ALT|SHIFT",
    key = "H",
    action = act({ ActivatePaneDirection = "Left" }),
  },
  {
    mods = "ALT|SHIFT",
    key = "L",
    action = act({ ActivatePaneDirection = "Right" }),
  },
  {
    mods = "ALT|SHIFT",
    key = "J",
    action = act({ ActivatePaneDirection = "Down" }),
  },
  {
    mods = "ALT|SHIFT",
    key = "K",
    action = act({ ActivatePaneDirection = "Up" }),
  },
  { key = "LeftArrow", mods = "ALT|SHIFT", action = act({ AdjustPaneSize = { "Left", 10 } }) },
  { key = "RightArrow", mods = "ALT|SHIFT", action = act({ AdjustPaneSize = { "Right", 10 } }) },
  { key = "UpArrow", mods = "ALT|SHIFT", action = act({ AdjustPaneSize = { "Up", 10 } }) },
  { key = "DownArrow", mods = "ALT|SHIFT", action = act({ AdjustPaneSize = { "Down", 10 } }) },
  {
    mods = "SHIFT|ALT",
    key = "F12",
    action = act.ShowDebugOverlay,
  },
  -- default keybind
  { key = "c", mods = "SUPER", action = act({ CopyTo = "Clipboard" }) },
  { key = "c", mods = "CTRL|SHIFT", action = act({ CopyTo = "Clipboard" }) },
  { key = "v", mods = "SUPER", action = act({ PasteFrom = "Clipboard" }) },
  { key = "v", mods = "CTRL|SHIFT", action = act({ PasteFrom = "Clipboard" }) },
  { key = "Insert", mods = "SHIFT", action = act({ PasteFrom = "PrimarySelection" }) },
  { key = "=", mods = "CTRL", action = "ResetFontSize" },
  { key = "+", mods = "CTRL", action = "IncreaseFontSize" },
  { key = "-", mods = "CTRL", action = "DecreaseFontSize" },
  { key = "x", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },
  { key = "PageUp", mods = "ALT", action = act({ ScrollByPage = -1 }) },
  { key = "PageDown", mods = "ALT", action = act({ ScrollByPage = 1 }) },
  { key = "z", mods = "ALT", action = "ReloadConfiguration" },
  { key = "1", mods = "ALT", action = act({ ActivateTab = 0 }) },
  { key = "2", mods = "ALT", action = act({ ActivateTab = 1 }) },
  { key = "3", mods = "ALT", action = act({ ActivateTab = 2 }) },
  { key = "4", mods = "ALT", action = act({ ActivateTab = 3 }) },
  { key = "5", mods = "ALT", action = act({ ActivateTab = 4 }) },
  { key = "6", mods = "ALT", action = act({ ActivateTab = 5 }) },
  { key = "7", mods = "ALT", action = act({ ActivateTab = 6 }) },
  { key = "8", mods = "ALT", action = act({ ActivateTab = 7 }) },
  { key = "9", mods = "ALT", action = act({ ActivateTab = 8 }) },
  { key = "q", mods = "ALT", action = act({ CloseCurrentPane = { confirm = false } }) },
  { key = "x", mods = "ALT", action = act({ CloseCurrentPane = { confirm = false } }) },
}

config.disable_default_key_bindings = true

return config
