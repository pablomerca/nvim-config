return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
	    "kevinhwang91/promise-async",
	},
	config = function()
	    -- Fold options
	    vim.o.foldcolumn = '1'
	    vim.o.foldlevel = 99
	    vim.o.foldlevelstart = 99
	    vim.o.foldenable = true
	
	    -- Keymaps
	    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
	    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
	
	    -- Configure LSP capabilities for folding
	    local capabilities = vim.lsp.protocol.make_client_capabilities()
	    capabilities.textDocument.foldingRange = {
	        dynamicRegistration = false,
	        lineFoldingOnly = true
	    }
	
	    -- Setup UFO
	    require('ufo').setup({
	        provider_selector = function(bufnr, filetype, buftype)
	            return {'treesitter', 'indent'}
	        end
	    })
	end,
	event = "BufReadPost", -- Load the plugin after buffer is read
}
