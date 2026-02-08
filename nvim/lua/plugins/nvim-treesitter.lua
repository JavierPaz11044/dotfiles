return {
	{
		"nvim-treesitter/nvim-treesitter",

		build = ":TSUpdate",

		event = { "BufReadPost", "BufNewFile" },

		opts = {
			ensure_installed = {
				"lua",
				"bash",
				"c",
				"cpp",
				"rust",
				"javascript",
				"typescript",
				"elixir",
				"java",
			},

			highlight = { enable = true },
			indent = { enable = true },
		},
	},
}
