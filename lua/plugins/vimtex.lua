return {
	"lervag/vimtex",
    lazy = false,

	ft = "tex", -- Load vimtex only for .tex files
	config = function()
		-- Disable some live inline preview of math equations (improves performance)
		vim.g.vimtex_syntax_conceal = {
			enabled = 1, -- Enable conceal
			accents = 1, -- Conceal accents
			cites = 1, -- Conceal citations
			fancy = 1, -- Conceal fancy symbols
			greek = 0, -- Disable Greek letter conceal
			math_bounds = 0, -- Disable math delimiter conceal
			math_delimiters = 0, -- Disable math delimiter conceal
			math_fracs = 0, -- Disable fraction conceal
			math_super_sub = 0, -- Disable superscript/subscript conceal
			math_symbols = 0, -- Disable math symbol conceal
			sections = 1, -- Conceal section markers
			styles = 1, -- Conceal font styles
		}

		-- Set PDF viewer (adjust for your OS)
		vim.g.vimtex_view_method = "zathura" -- Linux
		-- vim.g.vimtex_view_method = "skim"  -- macOS
		-- vim.g.vimtex_view_method = "sioyek"  -- Windows/WSL

		-- Configure latexmk as the compiler
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_latexmk = {
			build_dir = "build", -- Output directory for compiled files
			options = {
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
			},
		}

		-- Enable folding for sections and environments
		vim.g.vimtex_fold_enabled = 1

		-- Quickfix settings
		vim.g.vimtex_quickfix_enabled = 1 -- Enable quickfix for errors
		vim.g.vimtex_quickfix_mode = 0 -- Auto-open quickfix only for errors

		-- Disable syntax conceal for math (improves performance)
		-- vim.g.vimtex_syntax_conceal_disable = 1

		-- Keybindings
		vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", { desc = "Compile LaTeX document" })
		vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "View PDF" })
		vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<CR>", { desc = "Clean auxiliary files" })
		vim.keymap.set("n", "<leader>lq", "<cmd>VimtexToggleMain<CR>", { desc = "Toggle quickfix window" })
		vim.keymap.set("n", "<leader>ld", "<cmd>VimtexDocPackage<CR>", { desc = "Show LaTeX package documentation" })
	end,
}
