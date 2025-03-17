-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Create the configuration
local config = wezterm.config_builder()

-- Colorscheme
config.color_schemes = {
	["Dracula"] = {
		foreground = "#F8F8F2",
		background = "#282A36",
		cursor_bg = "#F8F8F2",
		cursor_fg = "#282A36",
		cursor_border = "#F8F8F2",
		selection_fg = "#44475A",
		selection_bg = "#BD93F9",
		scrollbar_thumb = "#44475A",
		split = "#44475A",
		ansi = {
			"#000000",
			"#FF5555",
			--> "#50FA7B",
			"#FF79C6",
			"#F1FA8C",
			"#BD93F9",
			"#FF79C6",
			"#8BE9FD",
			"#BFBFBF",
		},
		brights = {
			"#4D4D4D",
			"#FF6E6E",
			"#69FF94",
			"#FFFFA5",
			"#D6ACFF",
			"#FF92DF",
			"#A4FFFF",
			"#FFFFFF",
		},
	},
}

-- Set the active color scheme
config.color_scheme = "Dracula"

-- Font settings
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 24

-- Tab bar and window settings
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.80
config.macos_window_background_blur = 10

-- Return the configuration
return config
