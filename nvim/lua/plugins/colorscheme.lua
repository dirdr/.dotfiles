return {
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    config = function()
      vim.g.gruvbox_material_enable_italic = 1
      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "projekt0n/caret.nvim",
    lazy = true,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    config = function()
      require("gruvbox").setup({
        bold = false,
        contrast = "hard",
      })
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
      require("kanagawa").setup({
        keywordStyle = {
          italic = true,
        },
        statementStyle = {
          bold = false,
        },
      })
      --vim.cmd.colorscheme("kanagawa-wave")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    config = function()
      --vim.cmd.colorscheme("catppuccin-mocha")
      require("catppuccin").setup({
        flavour = "mocha",
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          types = { "italic" },
        },
      })
    end,
  },
}
