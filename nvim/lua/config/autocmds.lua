-- ~/.config/nvim/lua/config/autocmds.lua

-- Recognize .scad files as openscad (kept from original config)
vim.filetype.add({
    extension = {
        scad = "openscad",
    },
})

-- Highlight on yank, small but nice
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Trim trailing whitespace on save, skip in diff/dadbod query buffers
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Trim trailing whitespace on save",
    group = vim.api.nvim_create_augroup("trim-whitespace", { clear = true }),
    callback = function()
        if vim.bo.filetype == "diff" then return end
        local view = vim.fn.winsaveview()
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.fn.winrestview(view)
    end,
})
