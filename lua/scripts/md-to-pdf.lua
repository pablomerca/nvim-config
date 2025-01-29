-- ~/.config/nvim/lua/markdown_to_pdf.lua

-- Function to compile Markdown to PDF using Pandoc
function compile_markdown_to_pdf()
	local current_file = vim.fn.expand("%") -- Get the current file name
	local output_file = vim.fn.expand("%:r") .. ".pdf" -- Create PDF file name

	-- Command to compile Markdown to PDF using Pandoc
	local pandoc_cmd = string.format('pandoc "%s" -o "%s"', current_file, output_file)

	-- Execute the Pandoc command
	local handle = io.popen(pandoc_cmd)
	local result = handle:read("*a")
	handle:close()

	-- Check if the compilation was successful
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_err_writeln("Pandoc compilation failed: " .. result)
		return false
	end

	-- Notify the user that the PDF has been compiled
	vim.api.nvim_echo({ { "PDF compiled: " .. output_file, "None" } }, true, {})
	return true
end

-- Function to render the PDF in Zathura
function render_pdf_in_zathura()
	local output_file = vim.fn.expand("%:r") .. ".pdf" -- Create PDF file name

	-- Command to open the PDF in Zathura
	local zathura_cmd = string.format('zathura "%s" &', output_file)

	-- Execute the Zathura command
	os.execute(zathura_cmd)

	-- Notify the user that the PDF has been opened
	vim.api.nvim_echo({ { "PDF opened in Zathura: " .. output_file, "None" } }, true, {})
end

-- Define the :MdCompile command
vim.api.nvim_create_user_command("MdCompile", function()
	compile_markdown_to_pdf()
end, {
	desc = "Compile the current Markdown file to PDF using Pandoc",
})

-- Define the :MdRender command
vim.api.nvim_create_user_command("MdRender", function()
	render_pdf_in_zathura()
end, {
	desc = "Open the compiled PDF in Zathura",
})
