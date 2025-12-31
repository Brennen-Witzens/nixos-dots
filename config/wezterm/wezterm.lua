local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder() then
	config = wezterm.config_builder()
end

config.font = wezterm.font("JetBrains Mono")
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.color_scheme = "nord"

return config
