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
    disabled = false,
    config = {
      -- override defaults lsp configuration commands
      -- [source](https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/clangd.lua).
      cmd = {
        "clangd",
        -- allow indexing of files in the project
        "--background-index",
        -- enables diagnostics from clangd tidy
        "--clang-tidy",
        -- enable rename operations affecting all the files
        "--cross-file-rename",
        "--suggest-missing-includes",
        -- to disable clangd injecting functions placeholders to nvim-cmp
        "--function-arg-placeholders=false",
      },
    },
  },
  tsserver = {
    disabled = false,
    name = "typescript-language-server",
  },
  cssls = {
    disabled = false,
    name = "css-lsp",
  },
  jsonls = {
    disabled = false,
    name = "json-lsp",
  },
  tailwindcss = {
    disabled = true,
    name = "tailwindcss-language-server",
  },
  texlab = {
    disabled = false,
    name = "texlab",
  },
  lua_ls = {
    name = "lua-language-server",
    disabled = false,
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
  eslint = {
    disabled = false,
    name = "eslint-lsp",
  },
}
