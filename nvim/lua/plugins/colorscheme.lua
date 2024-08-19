return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "projekt0n/caret.nvim",
    lazy = true,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    config = function()
      require("gruvbox").setup({
        bold = false,
        contrast = "hard",
      })
      -- vim.cmd.colorscheme("gruvbox")
      -- temp fix
      -- vim.api.nvim_set_hl(0, "Delimiter", { link = "GruvboxOrange" })
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
