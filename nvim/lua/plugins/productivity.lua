return {

	-------------------------------------------------
	-- FORMATTER (format on save)
	-------------------------------------------------
	{
		"stevearc/conform.nvim",

		event = "BufWritePre",

		opts = {
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},

			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },

				rust = { "rustfmt" },
				c = { "clang_format" },
				cpp = { "clang_format" },

				bash = { "shfmt" },
				elixir = { "mix" },
			},
		},
	},

	-------------------------------------------------
	-- GIT SIGNS
	-------------------------------------------------
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",

		opts = {
			current_line_blame = true,
		},
	},

	-------------------------------------------------
	-- STATUSLINE
	-------------------------------------------------
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-web-devicons" },

		opts = {
			options = {
				theme = "auto",
				section_separators = "",
				component_separators = "",
			},
		},
	},

	-------------------------------------------------
	-- TERMINAL
	-------------------------------------------------
	{
		"akinsho/toggleterm.nvim",
		version = "*",

		opts = {
			open_mapping = [[<c-\>]],
			direction = "float",
			float_opts = {
				border = "curved",
			},
		},
	},
}
