vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- OPTIONAL: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Easily split windows
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "[W]indow Split [H]orizontal" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- Function to compile the current C++ file
local function compile_cpp_debug()
	local filetype = vim.bo.filetype
	if filetype == "cpp" then
		-- Save the current file
		vim.cmd("w")

		-- Compile and run the current file
		local filename = vim.fn.expand("%")
		local output = vim.fn.expand("%:r")
		local input = vim.fn.input("Enter input file (leave empty for none): ")

		-- Command to compile and execute
		local cmd
		if input == "" then
			cmd = string.format(
				"g++ -std=c++17 -Wshadow -Wall -o %s %s -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -DLOCAL && time ./%s; echo Press q to close; read -n 1",
				output,
				filename,
				output
			)
		else
			cmd = string.format(
				"g++ -std=c++17 -Wshadow -Wall -o %s %s -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -DLOCAL && time ./%s < %s; echo Press q to close; read -n 1",
				output,
				filename,
				output,
				input
			)
		end

		-- Open terminal, run the command, and wait for keypress to close
		vim.cmd(string.format("terminal bash -c '%s'", cmd))

		-- Enter terminal mode automatically
		vim.cmd("startinsert")
	else
		print("Not a C++ file")
	end
end
-- Function to run the executable with input from a selected file
local function run_cpp_program()
	local executable = vim.fn.expand("%:r")
	local filetype = vim.bo.filetype
	if filetype == "cpp" then
		local cmd = string.format("!time ./%s < in", executable)
		vim.cmd(cmd)
	else
		print("Not a C++ file")
	end
end

local function copy_buffer_to_clipboard()
	local cmd = "%y+"
	vim.cmd(cmd)
end

-- Keymap to copy the entire buffer to clipboard
vim.keymap.set("n", "<leader>y", function()
	copy_buffer_to_clipboard()
end)

-- Keymap to compile C++ file with <F9>
vim.keymap.set("n", "<F9>", function()
	compile_cpp_debug()
end)

-- Keymap to run the compiled program with <F12>
vim.keymap.set("n", "<F12>", function()
	run_cpp_program()
end)

-- Custom snippet add on because all sucks

