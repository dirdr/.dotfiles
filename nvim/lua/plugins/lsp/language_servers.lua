return {
  html = {
    name = "html-lsp", -- for mason installer
    disabled = false,
  },
  pyright = {
    name = "pyright",
    disabled = false,
    config = {
      settings = {
        python = {
          analysis = {
            diagnosticMode = "openFilesOnly",
            extraPaths = { "third_party" },
            typeCheckingMode = "off",
          },
        },
      },
    },
  },
  clangd = {
    name = "clangd",
  },
  gopls = {
    name = "gopls",
  },
  tsserver = {
    name = "typescript-language-server",
  },
  cssls = {
    name = "css-lsp",
  },
  jsonls = {
    name = "json-lsp",
  },
  tailwindcss = {
    name = "tailwindcss-language-server",
  },
  texlab = {
    name = "texlab",
  },
  lua_ls = {
    name = "lua-language-server",
    config = {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            -- library = vim.api.nvim_get_runtime_file("", true),
            library = {
              vim.fn.stdpath("config"),
            },
            checkThirdParty = false,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    },
  },
}
