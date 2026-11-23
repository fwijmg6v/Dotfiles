-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
	hl.exec_cmd(Programs.terminal)
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("awww img ~/Pictures/Wallpapers/macos-sonoma-radial-blue.jpg")
	-- eww bar + workspace dock on every monitor (also starts the eww daemon)
	hl.exec_cmd("~/.config/eww/scripts/launch")
	hl.exec_cmd("kanata --cfg ~/Documents/Graphite.kbd")
	-- One shell so the steps run in order (separate exec_cmds run in parallel);
	-- wait for NetworkManager to report the network up before reconnecting.
	hl.exec_cmd("sh -c 'nm-online -q -t 30; mullvad disconnect; sleep 1; mullvad connect'")
end)
