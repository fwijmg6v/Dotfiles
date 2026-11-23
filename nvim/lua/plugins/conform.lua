-- ~/.config/nvim/lua/plugins/conform.lua

return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            rust = { "rustfmt" },
            python = { "ruff_format", "ruff_organize_imports" },
            lua = { "stylua" },
            toml = { "taplo" },
            yaml = { "yamlfmt" },
            json = { "jq" },
            sql = { "sql_formatter" },
        },
        format_on_save = {
            timeout_ms = 1500,
            lsp_format = "fallback", -- fall back to the LSP's own formatter if no conform formatter matches
        },
    },
}
