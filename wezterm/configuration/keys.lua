local wezterm = require("wezterm")
local keys = {}

keys.disable_default_key_bindings = false

keys.keys = {
  {
    mods = "CTRL",
    key = [[|]],
    action = wezterm.action({
      SplitVertical = { domain = "CurrentPaneDomain" },
    }),
  },
  {
    mods = "CTRL",
    key = [[\]],
    action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain", args = { "zsh" } } }),
  }, -- browser-like bindings for tabbing
  {
    key = "t",
    mods = "CTRL",
    action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
  },
  {
    key = "q",
    mods = "CTRL",
    action = wezterm.action({ CloseCurrentTab = { confirm = true } }),
  },
  {
    mods = "CTRL",
    key = "Tab",
    action = wezterm.action({ ActivateTabRelative = 1 }),
  },
  {
    mods = "CTRL|SHIFT",
    key = "Tab",
    action = wezterm.action({ ActivateTabRelative = -1 }),
  }, -- standard copy/paste bindings
}

return keys
