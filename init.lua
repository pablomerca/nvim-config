require("core.keymaps")
require("core.options")

-- install plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

-- setup plugin manager
require("lazy").setup({
	-- todos los plugins que ponemos aca se instalan.
	require("plugins.neotree"),
	require("plugins.bufferline"),
    require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.colorscheme"),
	require("plugins.none-ls"),
	require("plugins.mason"),
	require("plugins.nvim-autopairs"),
	require("plugins.nvim-cmp"),
	require("plugins.nvim-lspconfig"),
	require("plugins.whichkey"),
	require("plugins.leap"),
	require("plugins.avante"),
	require("plugins.liveserver"),
	require("plugins.snacks"),
	require("plugins.copilot"),
})
