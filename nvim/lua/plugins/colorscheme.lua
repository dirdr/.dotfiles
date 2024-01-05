return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    -- config = function()
    --   vim.g.gruvbox_material_enable_italic = 1
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
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          types = { "italic" },
        },
      })
    end,
  },
}
