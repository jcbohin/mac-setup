-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.default_prog = { "/opt/homebrew/bin/fish" }

-- Import our new module (put this near the top of your wezterm.lua)
-- local appearance = require("appearance")

-- Use it!
-- if appearance.is_dark() then
config.color_scheme = "Tokyo Night"
-- else
--	config.color_scheme = "Tokyo Night Day"
--end

-- Choose your favourite font, make sure it's installed on your machine
config.font = wezterm.font({ family = "FiraCode Nerd Font Mono" })
-- And a font size that won't have you squinting
config.font_size = 12

-- Slightly transparent and blurred background
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30
-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = "RESIZE"
-- Sets the font for the window frame (tab bar)
config.window_frame = {
	-- Berkeley Mono for me again, though an idea could be to try a
	-- serif font here instead of monospace for a nicer look?
	font = wezterm.font({ family = "FiraCode Nerd Font", weight = "Bold" }),
	font_size = 10,
}

-- and finally, return the configuration to wezterm
return config
