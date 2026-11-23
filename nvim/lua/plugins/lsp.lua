-- ~/.config/nvim/lua/plugins/lsp.lua
-- Uses the native vim.lsp.config()/vim.lsp.enable() API (Neovim 0.11+),
-- which is now the recommended approach over nvim-lspconfig's own .setup().

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				-- LSPs
				"rust-analyzer",
				"basedpyright",
				"ruff",
				"lua-language-server",
				"taplo",
				"yaml-language-server",
				"json-lsp",
				"openscad-lsp",
				-- formatters (used by conform.lua)
				"stylua",
			},
		},
	},
	{
		"neovim/nvim-lspconfig", -- still used for its bundled default configs, not its .setup()
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local servers = {
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							check = { command = "clippy" },
							cargo = { allFeatures = true },
						},
					},
				},
				basedpyright = {
					settings = {
						basedpyright = {
							analysis = { typeCheckingMode = "standard" },
						},
					},
				},
				ruff = {}, -- linting + formatting for python, runs alongside basedpyright's type checking
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { checkThirdParty = false },
						},
					},
				},
				taplo = {}, -- TOML
				yamlls = {}, -- YAML
				jsonls = {}, -- JSON
				openscad_lsp = {}, -- kept from the original config
			}

			for name, cfg in pairs(servers) do
				cfg.capabilities = vim.tbl_deep_extend("force", {}, capabilities, cfg.capabilities or {})
				vim.lsp.config(name, cfg)
				vim.lsp.enable(name)
			end
		end,
	},
}
