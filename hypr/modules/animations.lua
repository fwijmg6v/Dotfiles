-- ==========================================
-- ANIMATION TREE
-- ==========================================
-- Depends on curves defined in modules/curves.lua (loaded first in hyprland.lua)

hl.animation({ leaf = "global", enabled = true, speed = 6, spring = "cloud_pop" })

-- WINDOWS
hl.animation({ leaf = "windows",           enabled = true, speed = 6.0,  spring = "cloud_pop" })
hl.animation({ leaf = "windowsIn",         enabled = true, speed = 6.0,  spring = "cloud_pop",   style = "popin 50%" })
-- Speed 18 + instant_out: the curve's control points both sit at y=1.0, so the
-- window visually reaches its final (invisible) state almost immediately regardless
-- of the nominal duration. No snail-speed exit.
hl.animation({ leaf = "windowsOut",        enabled = true, speed = 18.0, bezier = "instant_out", style = "popin 80%" })
hl.animation({ leaf = "windowsMove",       enabled = true, speed = 5.5,  spring = "cloud_glide" })

-- LAYERS
hl.animation({ leaf = "layers",            enabled = true, speed = 6.0,  spring = "cloud_pop" })
hl.animation({ leaf = "layersIn",          enabled = true, speed = 6.0,  spring = "cloud_pop",   style = "fade" })
hl.animation({ leaf = "layersOut",         enabled = true, speed = 16.0, bezier = "instant_out", style = "fade" })

-- FADES
hl.animation({ leaf = "fade",              enabled = true, speed = 6.0,  spring = "cloud_pop" })
hl.animation({ leaf = "fadeIn",            enabled = true, speed = 6.0,  spring = "cloud_pop" })
hl.animation({ leaf = "fadeOut",           enabled = true, speed = 8.0,  bezier = "instant_out" })
hl.animation({ leaf = "fadeSwitch",        enabled = true, speed = 6.0,  spring = "cloud_pop" })
hl.animation({ leaf = "fadeShadow",        enabled = true, speed = 6.0,  spring = "cloud_pop" })
hl.animation({ leaf = "fadeGlow",          enabled = true, speed = 6.0,  spring = "cloud_pop" })
hl.animation({ leaf = "fadeDim",           enabled = true, speed = 6.0,  spring = "cloud_pop" })
hl.animation({ leaf = "fadeLayers",        enabled = true, speed = 6.0,  spring = "cloud_pop" })
hl.animation({ leaf = "fadeLayersIn",      enabled = true, speed = 6.0,  spring = "cloud_pop" })
hl.animation({ leaf = "fadeLayersOut",     enabled = true, speed = 16.0, bezier = "instant_out" })
hl.animation({ leaf = "fadePopups",        enabled = true, speed = 6.0,  spring = "cloud_pop" })
hl.animation({ leaf = "fadePopupsIn",      enabled = true, speed = 6.0,  spring = "cloud_pop" })
hl.animation({ leaf = "fadePopupsOut",     enabled = true, speed = 16.0, bezier = "instant_out" })
hl.animation({ leaf = "fadeDpms",          enabled = true, speed = 6.0,  spring = "cloud_pop" })

-- BORDERS & EFFECTS
hl.animation({ leaf = "border",            enabled = true, speed = 3.0,  spring = "cloud_slide" })
hl.animation({ leaf = "borderangle",       enabled = true, speed = 30,   bezier = "linear", style = "loop" })
hl.animation({ leaf = "shadowangle",       enabled = true, speed = 30,   bezier = "linear", style = "loop" })
hl.animation({ leaf = "glowangle",         enabled = true, speed = 30,   bezier = "linear", style = "loop" })

-- WORKSPACES
hl.animation({ leaf = "workspaces",         enabled = true, speed = 5.0,  spring = "cloud_slide", style = "slidefade 30%" })
hl.animation({ leaf = "specialWorkspace",   enabled = true, speed = 5.0,  spring = "cloud_slide", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 5.0,  spring = "cloud_slide", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceOut",enabled = true, speed = 16.0, bezier = "instant_out", style = "slidevert" })

-- ZOOM & MONITORS
hl.animation({ leaf = "zoomFactor",   enabled = true, speed = 6.0, spring = "cloud_pop" })
hl.animation({ leaf = "monitorAdded", enabled = true, speed = 6.0, spring = "cloud_pop" })
