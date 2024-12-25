return {
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
}
