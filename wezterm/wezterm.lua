local font_with_fallback = function(name, params)
	local names = { name, "FiraCode Nerd Font Mono", "Blobmoji" }
	return require("wezterm").font_with_fallback(names, params)
end

local scheme = require("utils").get_scheme()
local gpu = require("wezterm").gui.enumerate_gpus()[1]

local config = {
	-- OpenGL for GPU acceleration, Software for CPU
	-- front_end = "OpenGL",
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",
	webgpu_preferred_adapter = gpu,

	-- No updates, bleeding edge only
	check_for_updates = false,

	window_decorations = "RESIZE",

	-- Font Stuff
	font = font_with_fallback "JetBrainsMono Nerd Font",
	font_rules = {
		{
			font = font_with_fallback "JetBrainsMono Nerd Font",
		},
		{
			intensity = "Bold",
			font = font_with_fallback("JetBrainsMono Nerd Font", { bold = true }),
		},
		{
			intensity = "Bold",
			font = font_with_fallback("JetBrainsMono Nerd Font", { bold = true }),
		},
		{ intensity = "Half", font = font_with_fallback "JetBrainsMono Nerd Font" },
	},
	font_size = 13,
	dpi = 144.0, -- macos dpi
	font_shaper = "Harfbuzz",
	harfbuzz_features = {
		"cv06=1",
		"cv14=1",
		"cv32=1",
		"ss04=1",
		"ss07=1",
		"ss09=1",
	},

	line_height = 1,
	audible_bell = "Disabled",
	freetype_load_target = "Mono",
	freetype_render_target = "Normal",
	animation_fps = 120,
	max_fps = 120,

	-- Cursor style
	default_cursor_style = "SteadyBlock",

	-- X Bad
	enable_wayland = false,

	native_macos_fullscreen_mode = true,
	prefer_egl = false,

	-- Pretty Colors
	bold_brightens_ansi_colors = true,

	-- Get rid of close prompt
	window_close_confirmation = "NeverPrompt",

	-- Padding
	-- Top is offsetted for titlebar
	initial_rows = 60,
	initial_cols = 160,

	-- default apps to tmux
	default_prog = { "zsh", "-l" },

	-- No opacity

	color_scheme = require("utils").get_colorscheme_name(),
	colors = {
		tab_bar = {
			background = scheme.background,
			new_tab = { bg_color = scheme.background, fg_color = scheme.ansi[8], intensity = "Bold" },
			new_tab_hover = { bg_color = scheme.ansi[1], fg_color = scheme.brights[8], intensity = "Bold" },
		},
	},

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

-- Merge everything and return
return require("extensions.stdlib").merge_all(
	config,
	require("configuration").tabs,
	require("configuration").keybinding
)
