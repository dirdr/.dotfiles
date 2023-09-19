return {
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "lervag/vimtex",
    config = function()
      vim.cmd("filetype plugin indent on")
      vim.cmd("syntax enable")
      vim.g.vimtex_view_method = "skim"
    end,
  },
}
