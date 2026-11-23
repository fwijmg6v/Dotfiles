------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({ output = "DP-2", mode = "2560x1440@180", position = "0x0", scale = "1" })
hl.monitor({ output = "DP-1", mode = "2560x1440@180", position = "2560x0", scale = "1", bitdepth = 8 })
hl.monitor({ output = "HDMI-A-1", mode = "2560x1600@120", position = "2560x1440", scale = "1.6" })
-- Xwayland
hl.config({ xwayland = { force_zero_scaling = true } })
-- toolkit-specific scale
hl.env("GDK_SCALE", "1.6")
hl.env("STEAM_FORCE_DESKTOPUI_SCALING", "1.6") -- doesn't work

-- Workspaces pinned to monitors and always present (the eww dock shows a dot
-- for each). The first of each range is that monitor's default workspace.
local workspacesPerMonitor = {
	{ monitor = "DP-2", from = 1, to = 4 },
	{ monitor = "DP-1", from = 5, to = 8 },
	{ monitor = "HDMI-A-1", from = 9, to = 10 },
}
for _, m in ipairs(workspacesPerMonitor) do
	for ws = m.from, m.to do
		hl.workspace_rule({
			workspace = tostring(ws),
			monitor = m.monitor,
			default = ws == m.from,
			persistent = true,
		})
	end
end
