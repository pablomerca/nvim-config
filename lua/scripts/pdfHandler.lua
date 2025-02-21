-- PDF handler configuration
vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = "*.pdf",
  callback = function()
    -- Open PDF with zathura
    vim.fn.jobstart({"zathura", vim.fn.expand("%:p")}, {detach = true})
    -- Close the buffer since we don't want to edit PDFs in nvim
    vim.cmd('bdelete')
  end,
})

