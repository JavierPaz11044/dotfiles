return {
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		version = "*",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers", -- show buffers, not vim tabs
					diagnostics = "nvim_lsp",
					separator_style = "slant",
					show_buffer_close_icons = true,
					show_close_icon = false,
					always_show_bufferline = true,
				},
			})

			-- keymaps
			vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
			vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
			vim.keymap.set("n", "<leader>x", ":bdelete<CR>")
		end,
	},
}
