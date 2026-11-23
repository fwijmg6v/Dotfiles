-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 12,
		border_size = 2,

		col = {
			active_border = { colors = { "rgba(E6F0FAff)", "rgba(BCE3FFff)" }, angle = 45 },
			inactive_border = { colors = { "rgba(090A0Fff)", "rgba(161B22ff)" }, angle = 45 },
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = true,

		layout = "dwindle",
		snap = {
			enabled = false,
			window_gap = 10,
			monitor_gap = 10,
			border_overlap = true,
			respect_gaps = true,
		},
	},

	decoration = {
		rounding = 8, -- integer, pixel radius
		rounding_power = 2, -- float, flattens the curve into a squircle (2 = perfect circle)

		-- Change transparency of focused and unfocused windows
		active_opacity = 0.96,
		inactive_opacity = 0.86,

		shadow = {
			enabled = true,
			range = 25,
			render_power = 4,
			color = "rgba(090a0f77)",
			color_inactive = "rgba(00000055)",
		},

		blur = {
			enabled = true,
			size = 3, -- bumped from 1: actually visible frosted-glass now
			passes = 3, -- 3-4 passes gives that silky, diffused frosted glass look
			new_optimizations = true,

			-- Variant
			variant = "haze",
			haze = {

				intensity = 0,
				iridescence = 0,
			},
			-- Softening & Color Balance
			vibrancy = 1, -- Keeps colors natural without oversaturating
			vibrancy_darkness = 0.0,
			brightness = 0.4, -- Keeps light blue highlights clean
			contrast = 2, -- Prevents harsh, clipped contrast
			noise = 0.03, -- Micro-grain to prevent color banding on dark gradients

			-- UI & Depth enhancements
			popups = true, -- Blurs context menus and tooltips
			popups_ignorealpha = 0.6,
			ignore_opacity = true, -- Applies blur behind transparent window regions
		},
		motion_blur = {
			enabled = false,
			samples = 30,
		},
	},

	animations = {
		enabled = true,
	},
})
