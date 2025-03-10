local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

config.font = wezterm.font("JetBrains Mono")
config.font_size = 13.0
config.pane_focus_follows_mouse = true
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.use_dead_keys = true
config.adjust_window_size_when_changing_font_size = false
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Kanagawa (Gogh)"
	else
		return "Catppuccin Latte"
	end
end

config.color_scheme = scheme_for_appearance(get_appearance())

return config
