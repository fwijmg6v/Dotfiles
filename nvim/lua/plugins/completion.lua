-- ~/.config/nvim/lua/plugins/completion.lua

return {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = {
        "rafamadriz/friendly-snippets",
        { "saghen/blink.compat", version = "*", lazy = true, opts = {} }, -- bridges nvim-cmp sources into blink
    },
    version = "v0.*", -- use a pre-built release binary (Rust matcher) instead of building from source
    opts = {
        keymap = { preset = "default" }, -- Ctrl-y accept, Ctrl-n/p or arrows navigate, Ctrl-Space open
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 200 },
            menu = {
                border = "single",
                draw = {
                    columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
                },
            },
        },
        signature = { enabled = true, window = { border = "single" } },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            -- vim-dadbod-completion supplies live DB-schema-aware completion in SQL buffers,
            -- bridged through blink.compat since it's an nvim-cmp source
            per_filetype = {
                sql = { "dadbod", "lsp", "buffer" },
                mysql = { "dadbod", "lsp", "buffer" },
                plsql = { "dadbod", "lsp", "buffer" },
            },
            providers = {
                dadbod = {
                    name = "vim-dadbod-completion", -- must match the name the plugin registers, exactly
                    module = "blink.compat.source",
                },
            },
        },
    },
    opts_extend = { "sources.default" },
}
