---------------------
---- MY PROGRAMS ----
---------------------

-- NOTE: these must be a global table, not `local` vars.
-- Each require()'d file is its own Lua scope, so a plain
-- `local terminal = "ghostty"` here would be invisible in
-- modules/autostart.lua or modules/keybinds.lua.

Programs = {
	terminal = "ghostty",
	fileManager = "ghostty -e yazi",
	menu = "fuzzel",
}
