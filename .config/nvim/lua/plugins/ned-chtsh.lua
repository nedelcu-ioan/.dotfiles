vim.api.nvim_create_user_command("Cht", function()
	require("ned-chtsh").getCheatSheet()
end, { desc = "Query cht.sh" })

vim.keymap.set("n", "<leader>cs", ":Cht<CR>", { desc = "[C]ht.[s]h query" })

return {
	"nedelcu-ioan/ned-chtsh.nvim",
}
