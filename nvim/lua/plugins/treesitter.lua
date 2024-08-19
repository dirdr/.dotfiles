return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- colorscheme breaking chnages for highlight group, waiting for update
    build = ":TSUpdate",
    event = "BufEnter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
          disable = { "python" },
        },
        ensure_installed = {
          "rust",
          "python",
          "typescript",
          "javascript",
          "c",
          "cpp",
          "json",
          "java",
          "go",
          "html",
          "css",
          "lua",
          "bash",
        },
        auto_install = true,
        autotag = {
          enable = true,
        },
      })
    end,
  },
  {
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
    },
  },
}
