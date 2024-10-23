return {
  { "ellisonleao/gruvbox.nvim" },
  {
    "sainnhe/gruvbox-material",
    init = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = 1
    end,
  },
  {
    "RRethy/base16-nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}