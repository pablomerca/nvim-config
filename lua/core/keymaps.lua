-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Fast vertical and horizontal movement
vim.keymap.set({ "n", "v" }, "J", "4j", { silent = true })
vim.keymap.set({ "n", "v" }, "K", "4k", { silent = true })

-- join lines
vim.keymap.set("n", "<leader>j", "J", { silent = true })

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "L", ":bnext<CR>", opts)
vim.keymap.set("n", "H", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", { noremap = true, desc = "close all buffers but current" })

-- Window manageme
vim.keymap.set("n", "<leader>|", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>_", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { noremap = true, desc = "close current (split) window" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>wd", ":close<CR>", { noremap = true, desc = "close current (split) window" }) -- close current split window
vim.keymap.set("n", "<leader>wo", ":only<CR>", { noremap = true, desc = "close all windws but this one" })

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { noremap = true, desc = "toggle line wrapping" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Pasting last yanked
vim.keymap.set("n", "<leader>p", '"0p', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- easy comment lines
vim.keymap.set({ "n", "v" }, "<C-_>", ":norm gcc<CR>", { noremap = true, desc = "Comment line" })

-- indentation
vim.keymap.set({ "n" }, "<Tab>", ">>", { desc = "Indent current line" }) -- ojo, <C-i> se interpreta como <Tab>
vim.keymap.set({ "n", "i" }, "<S-Tab>", "<<", { desc = "Unindent current line" })

vim.keymap.set({ "v" }, "<Tab>", ">gv", { desc = "Indent current line" })
vim.keymap.set({ "v" }, "<S-Tab>", "<gv", { desc = "Unindent current line" })

-- formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { noremap = true, silent = true, desc = "format current buffer" })
vim.keymap.set("v", "<leader>f", function()
	vim.lsp.buf.format({
		range = {
			["start"] = vim.fn.getpos("'<"),
			["end"] = vim.fn.getpos("'>"),
		},
	})
end, { noremap = true, silent = true, desc = "format selected code" })


-- remap next position jump list
vim.keymap.set('n', '<C-y>', '<C-i>', { noremap = false, desc = 'jump to newer position in jump list' })

