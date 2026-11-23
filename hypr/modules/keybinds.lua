---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Kanata sends Graphite letters; non-movement binds use the Graphite letter at
-- the old QWERTY position (comment = QWERTY key) to keep muscle memory.
-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(Programs.terminal)) -- Q
local closeWindowBind = hl.bind(mainMod .. " + M", hl.dsp.window.close()) -- C
-- closeWindowBind:set_enabled(false)
hl.bind(
	mainMod .. " + P", -- M
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(Programs.fileManager)) -- E
hl.bind(mainMod .. " + C", hl.dsp.window.float({ action = "toggle" })) -- V
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(Programs.menu))
hl.bind(mainMod .. " + J", hl.dsp.window.pseudo()) -- P
hl.bind(mainMod .. " + G", hl.dsp.layout("togglesplit")) -- G (same in Graphite), dwindle only

-- Move focus with mainMod + y h a e (QWERTY hjkl positions, vim order: left down up right)
hl.bind(mainMod .. " + y", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + a", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + e", hl.dsp.focus({ direction = "right" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + R", hl.dsp.workspace.toggle_special("magic")) -- S
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.window.move({ workspace = "special:magic" })) -- S

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshots to the clipboard (grim + slurp + wl-clipboard)
-- mainMod + S: drag a region (Esc cancels without touching the clipboard)
-- mainMod + SHIFT + S: the whole monitor under focus
hl.bind(
	mainMod .. " + S",
	hl.dsp.exec_cmd([[g=$(slurp -b '#090A0F66' -c '#BCE3FF' -w 2) && grim -g "$g" - | wl-copy --type image/png]])
)
hl.bind(
	mainMod .. " + SHIFT + S",
	hl.dsp.exec_cmd([[grim -o "$(hyprctl -j monitors | jq -r '.[] | select(.focused) | .name')" - | wl-copy --type image/png]])
)
