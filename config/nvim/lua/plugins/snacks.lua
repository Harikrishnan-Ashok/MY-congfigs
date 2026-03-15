return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			
		},
		keys={
			--- git stuff 
			 { "<leader>gl", function() require("snacks").lazygit() end, desc = "Lazygit" },
       { "<leader>gL", function() require("snacks").lazygit.log() end, desc = "Lazygit Logs" },
       { "<leader>rf", function() require("snacks").rename.rename_file() end, desc = "Fast Rename Current File" },

			--- file stuff 
			 { "<leader>ff", function() require("snacks").picker.files() end, desc = "Find Files (Snacks Picker)" },
			 { "<leader>fg", function() require("snacks").picker.grep() end, desc = "Grep word" },
       { "<leader>fgs", function() require("snacks").picker.grep_word() end, desc = "Search Visual selection or Word", mode = { "n", "x" } },
		}
	}
}
