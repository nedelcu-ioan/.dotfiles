local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- For init.lua
if vim.env.TERM and string.find(vim.env.TERM, "screen") then
	vim.o.t_Co = "256"
	vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 0
end
local opts = {
	change_detection = {
		notify = false,
	},
	checker = {
		enabled = true,
		notify = false,
	},
}

require("config.options")
require("config.keymaps")
require("lazy").setup("plugins", opts)

local telescope = require("telescope.builtin")

local function insert_cpp_snippet()
	local snippets_dir = "~/.config/nvim/snippets" -- Replace this with your actual snippets directory

	-- Use Telescope to pick a file from the snippets directory
	telescope.find_files({
		prompt_title = "C++ Snippets",
		cwd = snippets_dir,
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local actions = require("telescope.actions")
				local action_state = require("telescope.actions.state")

				-- Get the selected entry (snippet file)
				local selection = action_state.get_selected_entry()
				local snippet_file = selection.path

				-- Close Telescope
				actions.close(prompt_bufnr)

				-- Read the snippet file and insert it at the cursor position
				local lines = {}
				for line in io.lines(snippet_file) do
					table.insert(lines, line)
				end

				-- Insert the snippet at the cursor position
				vim.api.nvim_put(lines, "l", true, true)
			end)

			return true
		end,
	})
end

-- Map F8 to trigger the snippet search and insert
vim.keymap.set("n", "<F8>", function()
	insert_cpp_snippet()
end, { noremap = true, silent = true })
