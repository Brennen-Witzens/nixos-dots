-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- NOTE: Find a few other fonts to use ^_^
config.font = wezterm.font("JetBrains Mono")
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- TODO: Should probably pick one and 'edit' it
-- config.color_scheme = "Tokyo Night Storm"
-- config.color_scheme = "Catppuccin Macchiato"
-- config.color_scheme = "Arthur"
config.color_scheme = "nord"
config.disable_default_key_bindings = true

-- should have some amount of key binds setup for the windows side...
-- Probably worth activinging the Command Palatte at the very minimum
-- TODO: Work on moving key config to a different file
-- TODO: Possibly add a 'Leader' key modification - https://wezterm.org/config/keys.html#leader-key
config.keys = {
	{
		key = "P",
		mods = "CTRL",
		action = wezterm.action.ActivateCommandPalette,
	},
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "'",
		mods = "CTRL",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "x",
		mods = "CTRL",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "h",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "t",
		mods = "CTRL",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "x",
		mods = "ALT",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	-- Tab Navigation
	-- TODO: Move Tab navigation to function/for loop to make it easier
	{
		key = "1",
		mods = "ALT",
		action = wezterm.action.ActivateTab(0),
	},
	{
		key = "2",
		mods = "ALT",
		action = wezterm.action.ActivateTab(1),
	},
	{
		key = "3",
		mods = "ALT",
		action = wezterm.action.ActivateTab(2),
	},
	{
		key = "4",
		mods = "ALT",
		action = wezterm.action.ActivateTab(3),
	},
	{
		key = "5",
		mods = "ALT",
		action = wezterm.action.ActivateTab(4),
	},
}

-- and finally, return the configuration to wezterm
return config
