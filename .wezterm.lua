-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.default_prog = { "/opt/homebrew/bin/fish" }

-- and finally, return the configuration to wezterm
return config
