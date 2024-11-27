---@diagnostic disable: undefined-field
local map = vim.keymap.set
local icons = require("config.utils").icons

return {
  ------------------------------------------------------------------
  -- colorscheme - should have highest priority! -------------------
  ------------------------------------------------------------------
  {
    dir = "~/.config/nvim/lua/base46",
    lazy = false,
    priority = 1000,
    config = function()
      local base46 = require "base46"

      base46.load_theme {
        base = "base46",
        theme = "aquarium",
        transparency = true,
      }
    end,
  },

  ------------------------------------------------------------------
  -- required on load ----------------------------------------------
  ------------------------------------------------------------------
  {
    "christoomey/vim-tmux-navigator",
  },

  {
    "vigoux/notifier.nvim",
    opts = {},
  },

  {
    "stevearc/dressing.nvim",
    opts = {},
  },

  {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
  },

  {
    "windwp/nvim-ts-autotag", -- auto add closing tags for html and jsx
    lazy = true,
    opts = {},
  },

  {
    "hinell/duplicate.nvim",
    keys = {
      { "<S-M-k>", "<CMD>VisualDuplicate -1<CR>", desc = "Duplicate selection up", mode = "x" },
      { "<S-M-j>", "<CMD>VisualDuplicate +1<CR>", desc = "Duplicate selection down", mode = "x" },
    },
    dependencies = {
      "mrjones2014/legendary.nvim",
      priority = 1000,
      lazy = false,
    },
  },

  {
    "echasnovski/mini.nvim",
    init = function()
      local modules = {
        ai = {},
        comment = {},
        cursorword = { delay = 350 },
        indentscope = { draw = { delay = 50 } },
        pairs = {},
        splitjoin = { mappings = { toggle = "<leader>j", split = "", join = "" } },
        statusline = {},
      }

      for module, opts in pairs(modules) do
        require("mini" .. "." .. module).setup(opts)
      end

      local highlightColor = "#333333"
      vim.api.nvim_set_hl(0, "MiniCursorword", { bg = highlightColor })
      vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { bg = highlightColor })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Find by grep string" },
      { "<leader>fw", "<CMD>Telescope grep_string<CR>", desc = "Find word" },
      { "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "Find buffers" },
      { "<leader>fc", "<CMD>Telescope command_history<CR>", desc = "Find commands" },

      { "<leader>gf", "<CMD>Telescope git_files<CR>", desc = "Git files" },
      { "<leader>gb", "<CMD>Telescope git_branches<CR>", desc = "Git branches" },
      { "<leader>gc", "<CMD>Telescope git_commits<CR>", desc = "Git commits" },
      { "<leader>gs", "<CMD>Telescope git_status<CR>", desc = "Git status" },
      { "<leader>gx", "<CMD>Telescope git_stash<CR>", desc = "Git stash" },
    },
    opts = function()
      local M = {}

      M.normalize_path = function(path)
        return path:gsub("\\", "/")
      end

      M.normalize_cwd = function()
        return M.normalize_path(vim.loop.cwd()) .. "/"
      end

      M.is_subdirectory = function(cwd, path)
        return string.lower(path:sub(1, #cwd)) == string.lower(cwd)
      end

      M.split_filepath = function(path)
        local normalized_path = M.normalize_path(path)
        local normalized_cwd = M.normalize_cwd()
        local filename = normalized_path:match "[^/]+$"

        if M.is_subdirectory(normalized_cwd, normalized_path) then
          local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
          return stripped_path, filename
        else
          local stripped_path = normalized_path:sub(1, -(#filename + 1))
          return stripped_path, filename
        end
      end

      M.path_display = function(_, path)
        local stripped_path, filename = M.split_filepath(path)
        if filename == stripped_path or stripped_path == "" then
          return filename
        end
        return string.format("%s @ %s", filename, stripped_path)
      end

      return {
        defaults = {
          prompt_prefix = icons.ui.Telescope .. " ",
          selection_caret = icons.ui.Forward .. " ",
          entry_prefix = "   ",
          initial_mode = "normal",
          preview = true,
          border = true,
          selection_strategy = "reset",
          path_display = M.path_display,
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" },
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              width = { padding = 0 },
              height = { padding = 0 },
              preview_width = 0.5,
              preview_cutoff = 0,
            },
          },
          vimgrep_arguments = {
            "rg",
            "--hidden",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          file_ignore_patterns = {
            "--follow",
            "--no-ignore",
            "node_modules",
            "Library",
            "logs",
            "/media",
            "/static",
            "/sites",
            "cache",
            "undo/",
            "backups/",
            "automatic_backups/",
            "autoload/",
            ".idea/",
            ".DS_Store",
            '"*.pyc"',
            '"*.compiled"',
            '"*.scss"',
            "^pnpm-lock.*",
            "^lazy-lock.json",
            "build",
            "^yarn.lock",
            "schema.gql",
          },
        },
        pickers = {
          find_files = {
            initial_mode = "insert",
          },

          live_grep = {
            initial_mode = "insert",
          },

          diagnostics = {
            theme = "dropdown",
          },

          buffers = {
            theme = "dropdown",
            previewer = false,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
        },
      }
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    opts = function()
      local nvim_tree_api = require "nvim-tree.api"

      -- toggle file explorer when outside of nvim tree
      map("n", "<C-e>", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

      local on_attach = function(bufnr)
        require("nvim-tree.api").config.mappings.default_on_attach(bufnr)

        -- toggle file explorer when in nvim tree
        map("n", "<C-e>", nvim_tree_api.tree.toggle, { desc = "Toggle file explorer", buffer = bufnr, nowait = true })

        -- preview file with file explorer open
        map("n", "e", nvim_tree_api.node.open.preview, { desc = "Open file preview", buffer = bufnr, nowait = true })

        -- noop function to ignore write action
        map("n", "<leader>w", function() end, { desc = "Ignore write on file explorer", buffer = bufnr, nowait = true })

        -- write all buffers and quit
        map("n", "<leader>q", function()
          vim.cmd "wqa"
        end, { desc = "Exit neovim", buffer = bufnr, nowait = true })
      end

      return {
        on_attach = on_attach,
        sort = {
          sorter = "name",
        },
        view = {
          width = 30,
          cursorline = false,
          side = "right",
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        filters = {
          dotfiles = false, -- Show dotfiles
          exclude = { ".env" },
        },
        git = {
          enable = true,
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
      }
    end,
  },

  ------------------------------------------------------------------
  -- lazy ----------------------------------------------------------
  ------------------------------------------------------------------
  {
    "mg979/vim-visual-multi",
    lazy = true,
  },

  {
    "axelvc/template-string.nvim",
    lazy = true,
    opts = {},
  },

  {
    "ggandor/leap.nvim",
    lazy = true,
    keys = {
      { "s", "<Plug>(leap-forward-to)" },
      { "S", "<Plug>(leap-backward-to)}" },
    },
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
    },
  },

  {
    "sindrets/diffview.nvim",
    lazy = true,
    keys = {
      { "<leader>df", '<CMD>DiffviewOpen"<CR>', desc = "Open git diff view" },
      { "<leader>dh", "<CMD>DiffviewFileHistory<CR>", desc = "Open git diff history" },
    },
    opts = function()
      local actions = require "diffview.actions"

      local close = { "n", "<leader>q", "<CMD>tabclose<CR>", { desc = "Close diff view" } }
      local select = { "n", "e", actions.select_entry, { desc = "Open diff for the selected entry" } }
      local toggle = { "n", "<C-e>", actions.toggle_files, { desc = "Toggle file panel" } }

      return {
        keymaps = {
          view = { close, toggle },
          file_panel = { close, select, toggle },
          file_history_panel = { close, select, toggle },
        },
      }
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "BufEnter",
    opts = {
      signs = {
        add = {
          hl = "GitSignsAdd",
          text = icons.ui.BoldLineLeft,
          numhl = "GitSignsAddNr",
          linehl = "GitSignsAddLn",
        },
        change = {
          hl = "GitSignsChange",
          text = icons.ui.BoldLineLeft,
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
        delete = {
          hl = "GitSignsDelete",
          text = icons.ui.TriangleShortArrowRight,
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        topdelete = {
          hl = "GitSignsDelete",
          text = icons.ui.TriangleShortArrowRight,
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        changedelete = {
          hl = "GitSignsChange",
          text = icons.ui.BoldLineLeft,
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
      },
      signcolumn = true, -- toggle with `:gitsigns toggle_signs`
      numhl = false, -- toggle with `:gitsigns toggle_numhl`
      linehl = false, -- toggle with `:gitsigns toggle_linehl`
      word_diff = false, -- toggle with `:gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = true, -- toggle with `:gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = "<author>, <author_time:%d-%m-%Y> <summary>",
      update_debounce = 150,
      max_file_length = 40000,
      preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<leader>ft", "<CMD>TodoTelescope<CR>", desc = "Find todos" },
    },
  },

  {
    "rmagatti/alternate-toggler",
    event = { "BufReadPost" },
    lazy = true,
    keys = {
      {
        "<leader>tt",
        "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>",
        desc = "Toggle value",
        silent = true,
      },
    },
    opts = {
      alternates = {
        ["1"] = "0",
        ["+"] = "-",
        ["=="] = "!=",
        ["==="] = "!==",
        [">"] = "<",
        [">="] = "<=",
        [">=="] = "<==",
        ["true"] = "false",
        ["True"] = "False",
        ["TRUE"] = "FALSE",
        ["yes"] = "no",
        ["Yes"] = "No",
        ["YES"] = "NO",
      },
    },
  },

  {
    "folke/which-key.nvim",
    lazy = true,
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {
      window = {
        border = "single",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 1, 1, 1, 1 },
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },
    },
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      local harpoon = require "harpoon"
      harpoon:setup {}

      local function toggle_telescope(harpoon_files)
        local file_paths = {}

        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table {
              results = file_paths,
            },
          })
          :find()
      end

      map("n", "<leader>hh", function()
        toggle_telescope(harpoon:list())
      end, { desc = "Open harpoon" })

      map("n", "<leader>ha", function()
        harpoon:list():append()
      end)

      map("n", "<leader>hr", function()
        harpoon:list():remove()
      end)

      map("n", "<leader>hc", function()
        harpoon:list():clear()
      end)

      map("n", "<S-h>", function()
        harpoon:list():select(1)
      end)

      map("n", "<S-j>", function()
        harpoon:list():select(2)
      end)

      map("n", "<S-k>", function()
        harpoon:list():select(3)
      end)

      map("n", "<S-l>", function()
        harpoon:list():select(4)
      end)

      map("n", "<S-b>", function()
        harpoon:list():select(5)
      end)

      map("n", "<S-n>", function()
        harpoon:list():select(6)
      end)

      map("n", "<S-m>", function()
        harpoon:list():select(7)
      end)

      map("n", "<S-,>", function()
        harpoon:list():select(8)
      end)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    build = ":TSUpdate",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    init = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua",
          "markdown",
          "markdown_inline",
          "json",
          "javascript",
          "typescript",
          "dockerfile",
          "tsx",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-Space>",
            node_incremental = "<C-Space>",
            scope_incremental = false,
            node_decremental = "<BS>",
          },
        },
        autotag = {
          enable = true,
        },
      }
    end,
  },

  { -- lsp
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- useful status updates for lsp.
      { "j-hui/fidget.nvim", opts = {} },

      -- allows extra capabilities provided by nvim-cmp
      "hrsh7th/cmp-nvim-lsp",
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
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

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
  },

  { -- completion
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "InsertEnter" },
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        build = (function()
          if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
            return
          end
          return "make install_jsregexp"
        end)(),
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
          },
        },
      },
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-cmdline",
      "windwp/nvim-autopairs",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
    },
    opts = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"

      luasnip.config.setup()

      -- load vscode snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- enable nvim-autopairs with cmp
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      -- enable typescript integration
      require("nvim-autopairs").setup { check_ts = true }

      return {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        formatting = {
          format = function(_, item)
            local icons_lspking = require("config.utils").icons.lspkind

            item.abbr = item.abbr .. " "
            item.menu = item.kind or ""
            item.menu_hl_group = "CmpItemKind" .. (item.kind or "")
            item.kind = (icons_lspking[item.kind] or "") .. " "
            item.kind = " " .. item.kind

            return item
          end,
          fields = { "abbr", "kind", "menu" },
        },
        window = {
          completion = {
            scrollbar = true,
            side_padding = 1,
            winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None,FloatBorder:CmpBorder",
            border = "single",
          },
          documentation = {
            border = "single",
            winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
          },
        },
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        },
        experimental = {
          ghost_text = false,
        },
      }
    end,
  },

  { -- formatter
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>w",
        function()
          require("conform").format { async = true, lsp_fallback = true }
          vim.cmd "w"
        end,
        desc = "Format and write current buffer",
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        css = { "prettierd" },
        graphql = { "prettierd" },
        html = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        nix = { "nixfmt" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        yaml = { "prettierd" },
        go = { "crlfmt" },
        gomod = { "crlfmt" },
        python = { "ruff" },
      },
    },
  },

  { -- linter
    "mfussenegger/nvim-lint",
    lazy = true,
    opts = {
      linters = {
        eslint_d = {
          args = {
            "--no-warn-ignored", -- <- this is the key argument
            "--format",
            "json",
            "--stdin",
            "--stdin-filename",
            function()
              return vim.api.nvim_buf_get_name(0)
            end,
          },
        },
      },
    },
    config = function()
      require("lint").linters_by_ft = {
        css = { "eslint_d" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
