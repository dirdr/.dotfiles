return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      basedpyright = {
        settings = {
          pyright = {
            disableOrganizeImports = true, -- Use Ruff for organizing imports
          },
          python = {
            analysis = {
              ignore = { "*" }, -- Use Ruff for diagnostics
              typeCheckingMode = "off", -- Use mypy for type checking
            },
          },
        },
      },
    },
  },
}
