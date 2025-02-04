local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("Berkeley Mono")

config.font_size = 15.0
config.line_height = 1.3

config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}
config.native_macos_fullscreen_mode = true
config.window_background_opacity = 1
-- config.macos_window_background_blur = 20
config.hide_tab_bar_if_only_one_tab = true
-- config.window_decorations = "NONE"
config.enable_scroll_bar = false
config.color_scheme = "Tokyo Night"

return config
