return {

  -------------------------------------------------
  -- Mason
  -------------------------------------------------
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },

  -------------------------------------------------
  -- Mason LSP bridge
  -------------------------------------------------
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",          -- ✅ nuevo nombre
        "bashls",
        "clangd",
        "rust_analyzer",
        "elixirls",
        "jdtls",
      },
    },
  },

  -------------------------------------------------
  -- LSP (API moderna)
  -------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim" },

    config = function()

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
        "lua_ls",
        "ts_ls",
        "bashls",
        "clangd",
        "rust_analyzer",
        "elixirls",
        "jdtls",
      }

      -- ✅ NUEVA API
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })

        vim.lsp.enable(server)
      end

      -------------------------------------------------
      -- Keymaps
      -------------------------------------------------
      local map = vim.keymap.set

      map("n", "gd", vim.lsp.buf.definition)
      map("n", "K", vim.lsp.buf.hover)
      map("n", "gr", vim.lsp.buf.references)
      map("n", "<leader>rn", vim.lsp.buf.rename)
      map("n", "<leader>ca", vim.lsp.buf.code_action)
    end,
  },

  -------------------------------------------------
  -- Autocomplete
  -------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },

    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),

        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })
    end,
  },
}

