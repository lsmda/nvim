---@diagnostic disable: undefined-field

local map = require("config.utils").map

return { -- lsp
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- useful status updates for lsp.
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    local get_float_opts = require("config.utils").get_float_opts

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),

      callback = function(event)
        local tl_map = function(keys, func, desc)
          map("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc, silent = true })
        end

        local builtin = require "telescope.builtin"

        tl_map("<leader>gd", builtin.lsp_definitions, "Go to definition")
        tl_map("<leader>gr", builtin.lsp_references, "Go to references")
        tl_map("<leader>gi", builtin.lsp_implementations, "Go to implementation")
        tl_map("<leader>D", builtin.lsp_type_definitions, "Type definition")
        tl_map("<leader>ds", builtin.lsp_document_symbols, "Document symbols")
        tl_map("<leader>rn", vim.lsp.buf.rename, "Rename")
        tl_map("<leader>ca", vim.lsp.buf.code_action, "Code action")

        tl_map("<leader>dd", function()
          vim.diagnostic.open_float(nil, get_float_opts())
        end, "Display diagnostics")

        tl_map("<leader>nd", function()
          vim.diagnostic.goto_next { float = get_float_opts { scope = "line" } }
        end, "Next diagnostic")

        tl_map("<leader>pd", function()
          vim.diagnostic.goto_prev { float = get_float_opts { scope = "line" } }
        end, "Previous diagnostic")
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

    local servers = {
      cssls = {},
      tailwindcss = {},
      astro = {},
      graphql = {},
      html = {},
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

      pyright = {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              typeCheckingMode = "basic",
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
      "ruff",
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
}
