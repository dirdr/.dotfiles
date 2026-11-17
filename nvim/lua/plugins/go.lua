return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = { semanticTokens = false },
          },
        },
      },
      setup = {
        gopls = function() end,
      },
    },
  },
}
