return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true, -- solo se carga cuando otro plugin lo necesite
    config = function()
      require("nvim-web-devicons").setup({

        override = {
          zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh",
          },
        },

        color_icons = true,
        default = true,
        strict = true,
        variant = "dark", -- usa "dark" o "light"
        blend = 0,

        override_by_filename = {
          [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore",
          },
        },

        override_by_extension = {
          log = {
            icon = "",
            color = "#81e043",
            name = "Log",
          },
        },

      })
    end,
  },

}
