-- ~/.config/nvim/lua/plugins/dadbod.lua
-- Kept exactly as it was in the original config -- this setup is genuinely
-- solid for real DB-aware SQL work, no reason to replace it.

return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        { "tpope/vim-dadbod", lazy = true },
        { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    init = function()
        vim.g.db_ui_use_nerd_fonts = 1
    end,
}
