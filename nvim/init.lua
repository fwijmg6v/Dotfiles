-- ~/.config/nvim/init.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.opt.clipboard = "unnamedplus"
-- Core config (order matters: options sets the colorscheme, so load it first)
require("config.options")
require("config.autocmds")
require("config.keymaps")

-- Plugins: everything under lua/plugins/ is auto-loaded by lazy.nvim
require("lazy").setup({
	spec = { { import = "plugins" } },
	checker = { enabled = true, notify = false }, -- silently check for plugin updates
	performance = {
		rtp = {
			disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" },
		},
	},
})
