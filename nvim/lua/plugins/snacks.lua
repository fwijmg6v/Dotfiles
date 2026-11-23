-- ~/.config/nvim/lua/plugins/snacks.lua

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        picker = { enabled = true },
        notifier = { enabled = true, timeout = 3000 },
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true }, -- auto-highlight references under cursor
        dashboard = {
            enabled = true,
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "recent_files", limit = 8, padding = 1 },
                { section = "startup" },
            },
        },
    },
}
