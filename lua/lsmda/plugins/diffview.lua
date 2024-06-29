return {
	"sindrets/diffview.nvim",
	config = function()
		local diffView = require("diffview")
		local actions = require("diffview.actions")

		vim.keymap.set("n", "<leader>df", diffView.open, { desc = "Open diff view" })
		vim.keymap.set("n", "<leader>dh", diffView.file_history, { desc = "Open diff history" })

		-- Shared keymaps
		local closeDiffView = { "n", "<leader>q", "<cmd>tabclose<CR>", { desc = "Close diff view" } }
		local selectEntry = { "n", "e", actions.select_entry, { desc = "Open diff for the selected entry" } }
		local toggleFiles = { "n", "<C-e>", actions.toggle_files, { desc = "Toggle file panel" } }

		require("diffview").setup({
			keymaps = {
				view = { closeDiffView, toggleFiles },
				file_panel = { closeDiffView, selectEntry, toggleFiles },
				file_history_panel = { closeDiffView, selectEntry, toggleFiles },
			},
		})
	end,
}
