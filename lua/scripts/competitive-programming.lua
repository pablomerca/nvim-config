
local function compile_cp()
	local current_file = vim.fn.expand("%:t") -- Get the current file name
	local file_base = vim.fn.fnamemodify(current_file, ":r") -- Get the filename without extension
	local file_type = vim.bo.filetype -- Get the file type

	if file_type == "cpp" then
		local compiler_command = string.format("g++ -g -o %s %s.cpp", file_base, file_base)
		vim.cmd("!" .. compiler_command) -- Execute the compilation command
		print(string.format("Compiled %s to %s", current_file, file_base))
	elseif file_type == "java" then
		local compiler_command = string.format("javac -g %s.java", file_base)
		vim.cmd("!" .. compiler_command)
		print(string.format("Compiled %s", current_file))
	else
		print("Error: Unsupported file type. Only C++ and Java are supported.")
	end
end

vim.api.nvim_create_user_command("Cpc", compile_cp, {}) -- Create the :Cpc command
vim.keymap.set("n", "<leader>cc", ":Cpc<CR>", { noremap = true, silent = true, desc = "Compile cp code" })

-- ------------------------------------------------------------------

local function run_cp_program()
	local current_file = vim.fn.expand("%:t")
	local file_base = vim.fn.fnamemodify(current_file, ":r")
	local file_type = vim.bo.filetype

	if file_type == "cpp" then
		local program_command = string.format("./%s < in.txt > out.txt", file_base)
		vim.cmd("!" .. program_command)
		print(string.format("Executed %s with redirection.", current_file))
	elseif file_type == "java" then
		local program_command = string.format("java %s < in.txt > out.txt", file_base)
		vim.cmd("!" .. program_command)
		print(string.format("Executed %s with redirection.", current_file))
	elseif file_type == "python" or file_type == "python3" then
		local program_command = string.format("python3 %s < in.txt > out.txt", current_file)
		vim.cmd("!" .. program_command)
		print(string.format("Executed %s with redirection.", current_file))
	else
		print("Error: Unsupported file type. Only C++, Java, and Python are supported.")
	end
end

vim.api.nvim_create_user_command("Cpt", run_cp_program, {})
vim.keymap.set("n", "<leader>ct", ":Cpt<CR>", { noremap = true, silent = true, desc = "Test cp code" })

-- ------------------------------------------------------------------

local function open_input_output_split()
	local current_file = vim.fn.expand("%:t") -- Get the current file name (optional, but good practice)
	local file_base = vim.fn.fnamemodify(current_file, ":r") --Filename without extension, if you need it.
	local input_file = "in.txt"
	local output_file = "out.txt"

	-- Check if the files exist. If not, create them.
	if vim.fn.filereadable(input_file) == 0 then
		print("Creating " .. input_file)
		vim.cmd("edit " .. input_file)
		vim.cmd("write")
	end
	if vim.fn.filereadable(output_file) == 0 then
		print("Creating " .. output_file)
		vim.cmd("edit " .. output_file)
		vim.cmd("write")
	end

	-- Open input.txt in a vertical split
	vim.cmd("vsplit " .. input_file)

	-- Open output.txt in a horizontal split below input.txt
	vim.cmd("split " .. output_file)

	-- Optionally, switch the focus to the input file
	-- vim.cmd("wincmd j")  --Move one window down (to input.txt)

	print("Opened " .. input_file .. " and " .. output_file .. " in splits.")
end

vim.api.nvim_create_user_command("CpSplit", open_input_output_split, {})
vim.keymap.set("n", "<leader>wt", ":CpSplit<CR>", { noremap = true, silent = true, desc = "view in/out for testing" })
