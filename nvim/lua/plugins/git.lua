-- ~/.config/nvim/lua/plugins/git.lua

return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add          = { text = "│" },
            change       = { text = "│" },
            delete       = { text = "_" },
            topdelete    = { text = "‾" },
            changedelete = { text = "~" },
            untracked    = { text = "┆" },
        },
        current_line_blame = true,
        current_line_blame_opts = { delay = 500, virt_text_pos = "eol" },
        on_attach = function(bufnr)
            local gs = require("gitsigns")
            local map = vim.keymap.set
            map("n", "]h", gs.next_hunk, { buffer = bufnr, desc = "Next git hunk" })
            map("n", "[h", gs.prev_hunk, { buffer = bufnr, desc = "Previous git hunk" })
            map("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
            map("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
            map("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
        end,
    },
}
