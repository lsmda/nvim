---@diagnostic disable: undefined-field
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local get_float_opts = require("config.utils").get_float_opts

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc, silent = true })
          end

          local builtin = require "telescope.builtin"

          map("<leader>gd", builtin.lsp_definitions, "Go to definition")
          map("<leader>gr", builtin.lsp_references, "Go to references")
          map("<leader>gi", builtin.lsp_implementations, "Go to implementation")
          map("<leader>D", builtin.lsp_type_definitions, "Type definition")
          map("<leader>ds", builtin.lsp_document_symbols, "Document symbols")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>K", "<cmd>Lspsaga hover_doc<CR>", "Display documentation")
          map("<leader>pk", "<cmd>Lspsaga peek_definition<CR>", "Peek definition")

          map("<leader>dd", function()
            vim.diagnostic.open_float(nil, get_float_opts())
          end, "Display diagnostics")

          map("<leader>nd", function()
            vim.diagnostic.goto_next { float = get_float_opts { scope = "line" } }
          end, "Next diagnostic")

          map("<leader>pd", function()
            vim.diagnostic.goto_prev { float = get_float_opts { scope = "line" } }
          end, "Previous diagnostic")
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      local servers = {
        cssls = {},
        tailwindcss = {},
        astro = {},
        graphql = {},
        html = {},
        pyright = {},
        eslint = {},
        nil_ls = {},
        gopls = {},
        tsserver = {},

        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                globals = { "vim" },
                disable = { "missing-fields" },
              },
            },
          },
        },
      }

      require("mason").setup()

      local ensure_installed = vim.tbl_keys(servers or {})

      vim.list_extend(ensure_installed, {
        "stylua",
        "eslint_d",
        "prettierd",
        "crlfmt",
        "black",
      })

      require("mason-tool-installer").setup { ensure_installed = ensure_installed }

      require("mason-lspconfig").setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
