return {
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
    },
  },
  { "ThePrimeagen/vim-be-good" },
  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false },
      scroll = { enabled = false },
      words = { enabled = false },
    },
  },
  {
    "saghen/blink.cmp",
    opts = { completion = { ghost_text = { enabled = false } } },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = "gruvbox"
      opts.options.component_separators = ""
      opts.options.section_separators = ""
      opts.sections = {
        lualine_a = { "mode" },
        lualine_b = { { "filename", path = 1 } },
        lualine_c = {},
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = { inlay_hints = { enabled = false } },
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
}
