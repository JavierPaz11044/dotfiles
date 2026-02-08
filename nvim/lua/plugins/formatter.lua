return {
	"stevearc/conform.nvim",

	event = { "BufWritePre" }, -- auto format before save

	opts = {
		----------------------------------
		-- Formatters per filetype
		----------------------------------
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },

			rust = { "rustfmt" },

			c = { "clang_format" },
			cpp = { "clang_format" },

			sh = { "shfmt" },
			bash = { "shfmt" },
		},

		----------------------------------
		-- Auto format on save
		----------------------------------
		format_on_save = {
			timeout_ms = 1500,
			lsp_fallback = true,
		},
	},

	----------------------------------
	-- Optional keymap
	----------------------------------
	config = function(_, opts)
		require("conform").setup(opts)

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ async = true })
		end, { desc = "Format file" })
	end,
}
