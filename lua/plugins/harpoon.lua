local map = require("config.utils").map

return {
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
}
