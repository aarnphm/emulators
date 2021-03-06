local wezterm = require("wezterm")
local tables = require("extensions.stdlib")
local configuration = require("configuration")
local catppuccin = require("colors.catppuccin").setup({
  sync_flavour = {
    light = "latte",
    dark = "frappe",
  },
  flavour = "frappe",
})

local font_with_fallback = function(name, params)
  local names = { name, "FiraCode Nerd Font Mono", "Blobmoji" }
  return wezterm.font_with_fallback(names, params)
end

local cfg_misc = {
  -- OpenGL for GPU acceleration, Software for CPU
  front_end = "OpenGL",

  -- No updates, bleeding edge only
  check_for_updates = true,

  window_decorations = "RESIZE",

  -- Font Stuff
  font = font_with_fallback("JetBrainsMono Nerd Font"),
  font_rules = {
    {
      italic = true,
      font = font_with_fallback("JetBrainsMono Nerd Font", { italic = true }),
    },
    {
      italic = true,
      intensity = "Bold",
      font = font_with_fallback("JetBrainsMono Nerd Font", { bold = true, italic = true }),
    },
    {
      intensity = "Bold",
      font = font_with_fallback("JetBrainsMono Nerd Font", { bold = true }),
    },
    { intensity = "Half", font = font_with_fallback("JetBrainsMono Nerd Font") },
  },
  font_size = 15,
  font_shaper = "Harfbuzz",
  line_height = 1.0,
  audible_bell = "Disabled",
  freetype_load_target = "HorizontalLcd",
  freetype_render_target = "HorizontalLcd",

  -- Cursor style
  default_cursor_style = "BlinkingBlock",

  -- X Bad
  enable_wayland = false,

  native_macos_fullscreen_mode = true,

  -- Pretty Colors
  bold_brightens_ansi_colors = true,

  -- Get rid of close prompt
  window_close_confirmation = "NeverPrompt",

  -- Padding
  -- Top is offsetted for titlebar
  initial_rows = 60,
  initial_cols = 160,

  -- default apps to tmux
  default_prog = { "/bin/zsh", "-l", "-c", "tmux" },

  -- No opacity
  inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },

  -- color_scheme = "rose-pine",
  colors = catppuccin,
}

-- Tab Style (like shape)
local cfg_tab_bar = configuration.tabs

-- Keys
local cfg_keys = configuration.keys

-- Merge everything and return
return tables.merge_all(cfg_misc, cfg_tab_bar, cfg_keys)
