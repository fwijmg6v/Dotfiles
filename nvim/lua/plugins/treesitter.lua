-- ~/.config/nvim/lua/plugins/treesitter.lua
-- Uses nvim-treesitter's 'main' branch API (install()/vim.treesitter.start()),
-- which replaced the older .setup({ensure_installed=...}) pattern.

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local parsers = {
            "rust", "python", "sql", "lua", "luadoc",
            "toml", "yaml", "json", "openscad",
            "bash", "markdown", "markdown_inline",
            "diff", "vim", "vimdoc", "query",
        }
        require("nvim-treesitter").install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if not lang then return end
                if not vim.tbl_contains(parsers, lang) then return end
                if not pcall(vim.treesitter.language.add, lang) then return end
                vim.treesitter.start(args.buf, lang)
                vim.wo.foldmethod = "expr"
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo.foldenable = false -- start unfolded
            end,
        })
    end,
}
