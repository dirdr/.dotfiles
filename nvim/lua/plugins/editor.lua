return {
  "rcarriga/nvim-notify",
  opts = {
    max_height = function()
      return math.floor(vim.o.lines * 0.50)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.50)
    end,
    top_down = false,
  },
  { "tpope/vim-fugitive" },
}
