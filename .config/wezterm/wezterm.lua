local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		{ family = "JetBrainsMono Nerd Font", weight = "Regular" },
		{ family = "MesloLGM Nerd Font" },
		"Noto Color Emoji",
	}),
	term = "wezterm",
	warn_about_missing_glyphs = false,
	font_size = 10,
	bold_brightens_ansi_colors = true,
	-- color_scheme = "nightfox",
	color_scheme = "tokyonight",
	window_decorations = "NONE",
	enable_wayland = false,
	enable_tab_bar = false,
	enable_kitty_keyboard = true,
	automatically_reload_config = true,
	window_background_opacity = 0.8,
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 8,
		right = 8,
		top = 8,
		bottom = 8,
	},
}
