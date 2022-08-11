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

  default_prog = { "zsh", "-l" },

  -- No updates, bleeding edge only
  check_for_updates = true,

  window_decorations = "RESIZE",

  -- Font Stuff
  font = font_with_fallback("JetBrainsMono Nerd Font"),
  font_rules = {
    {
      font = font_with_fallback("JetBrainsMono Nerd Font"),
    },
    {
      intensity = "Bold",
      font = font_with_fallback("JetBrainsMono Nerd Font", { bold = true }),
    },
    {
      intensity = "Bold",
      font = font_with_fallback("JetBrainsMono Nerd Font", { bold = true }),
    },
    { intensity = "Half", font = font_with_fallback("JetBrainsMono Nerd Font") },
  },
  font_size = 14,
  font_shaper = "Harfbuzz",
  line_height = 1.0,
  audible_bell = "Disabled",
  freetype_load_target = "HorizontalLcd",
  freetype_render_target = "HorizontalLcd",

  -- Cursor style
  default_cursor_style = "SteadyBlock",

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
  -- default_prog = { "/bin/zsh", "-l", "-c", "tmux" },

  -- No opacity
  inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },

  -- color_scheme = "rose-pine",
  colors = catppuccin,
  hyperlink_rules = {
    -- Linkify things that look like URLs and the host has a TLD name.
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
      format = "$0",
    },

    -- linkify email addresses
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
      format = "mailto:$0",
    },

    -- file:// URI
    -- Compiled-in default. Used if you don't specify any hyperlink_rules.
    {
      regex = [[\bfile://\S*\b]],
      format = "$0",
    },

    -- Linkify things that look like URLs with numeric addresses as hosts.
    -- E.g. http://127.0.0.1:8000 for a local development server,
    -- or http://192.168.1.1 for the web interface of many routers.
    {
      regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
      format = "$0",
    },

    -- Make task numbers clickable
    -- The first matched regex group is captured in $1.
    {
      regex = [[\b[tT](\d+)\b]],
      format = "https://example.com/tasks/?t=$1",
    },

    -- Make username/project paths clickable. This implies paths like the following are for GitHub.
    -- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
    -- As long as a full URL hyperlink regex exists above this it should not match a full URL to
    -- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
    {
      regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
      format = "https://www.github.com/$1/$3",
    },
  },
}

-- Tab Style (like shape)
local cfg_tab_bar = configuration.tabs

-- Keys
local cfg_keys = configuration.keys

-- Merge everything and return
return tables.merge_all(cfg_misc, cfg_tab_bar, cfg_keys)
