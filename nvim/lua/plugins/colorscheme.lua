return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    -- config = function()
    --   vim.cmd.colorscheme("gruvbox-material")
    -- end,
  },
  {
    "projekt0n/caret.nvim",
    lazy = true,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
      require("catppuccin").setup({
        flavour = "mocha",
        style = {
          comments = { "italic" },
          functions = { "italic" },
        },
      })
    end,
  },
}
