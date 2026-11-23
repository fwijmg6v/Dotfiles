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
			size = 6, -- was 3; Apple materials blur the backdrop heavily
			passes = 3, -- 3-4 passes gives that silky, diffused frosted glass look
			new_optimizations = true,

			-- Variant (try others live with ../scripts/blur-try)
			variant = "acrylic",
			-- Apple-style glass: mostly frosted, a thin lens at the edges that
			-- bends the backdrop, a barely visible colour fringe, faint ice tint
			acrylic = {
				clarity = 0.3, -- share of sharp backdrop; default 0.82 is nearly clear glass
				bulb = 24, -- width of the curved edge in px (default 48)
				refraction = 14, -- how far the edge bends the backdrop in px (default 24)
				aberration = 0.01, -- colour fringe at the edge (default 0.025)
				tint = "rgba(E6F0FA14)", -- $fg at 8%; alpha = how much it tints
			},
			haze = {
				intensity = 0,
				iridescence = 0,
			},
			-- Softening & Color Balance (was vibrancy 1, brightness 0.4, contrast 2, noise 0.03)
			vibrancy = 0.3, -- Apple saturates the blur a little so colours glow through
			vibrancy_darkness = 0.0,
			brightness = 0.8, -- dark material, but the backdrop still shows
			contrast = 1.0, -- neutral; the bar/menu tint in eww does the darkening
			noise = 0.02, -- Micro-grain to prevent color banding on dark gradients

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
