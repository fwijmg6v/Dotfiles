--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Frosted glass behind the eww windows (eww/eww.yuck sets the eww-bar, eww-dock,
-- eww-cc, eww-power and eww-go namespaces). ignore_alpha skips the fully transparent
-- margins and shadows around the dock pill and the popups.
hl.layer_rule({
	name = "eww-blur",
	match = { namespace = "eww-.*" }, -- rule regexes must match the whole name
	blur = true,
	ignore_alpha = 0.3,
})

-- Same frosted glass behind fuzzel (its layer namespace is "launcher").
hl.layer_rule({
	name = "fuzzel-blur",
	match = { namespace = "launcher" },
	blur = true,
	ignore_alpha = 0.3,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
-- Force tearing window_rule
hl.window_rule({
	match = {
		class = "^(steam_app_1422450)$",
	},
	immediate = true,
})

-- yazi file picker from xdg-desktop-portal-termfilechooser (class set in its config)
hl.window_rule({
	name = "filechooser",
	match = { class = "ghostty\\.filechooser" },
	float = true,
	size = { "monitor_w * 0.6", "monitor_h * 0.6" },
	center = true,
})
