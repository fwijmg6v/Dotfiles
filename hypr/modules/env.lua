-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Default editor for everything started in the session (sh scripts, git, sudoedit,
-- crontab), not just interactive fish.
hl.env("EDITOR", "nvim")
hl.env("VISUAL", "nvim")
