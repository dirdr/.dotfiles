local function lspconfig_setup()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      local opts = { buffer = bufnr }

      vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>dc", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "<leader>de", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, opts)

      -- auto show diagnostic when cursor hold
      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          local float_opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          }

          if not vim.b.diagnostics_pos then
            vim.b.diagnostics_pos = { nil, nil }
          end

          local cursor_pos = vim.api.nvim_win_get_cursor(0)
          if
              (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
              and #vim.diagnostic.get() > 0
          then
            vim.diagnostic.open_float(nil, float_opts)
          end

          vim.b.diagnostics_pos = cursor_pos
        end,
      })
    end,
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  -- pass the config table of language_servers.lua into the lsp configuration
  local setup_server = function(server, config)
    if not config then
      return
    end

    if type(config) ~= "table" then
      config = {}
    end

    config = vim.tbl_deep_extend("force", {
      capabilities = capabilities,
    }, config)

    require("lspconfig")[server].setup(config)
  end

  local servers = require("plugins.lsp.language_servers")
  for server, setting in pairs(servers) do
    if setting.disabled then
      goto continue
    end

    if setting.config ~= nil then
      setup_server(server, setting.config)
    else
      setup_server(server, {})
    end

    ::continue::
  end
end
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
      lspconfig_setup()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      hint_prefix = "",
      floating_window = false,
      bind = true,
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    lazy = false,   -- This plugin is already lazy
    ft = { "rust" },
    opts = {
      server = {
        on_attach = function(client, bufnr)
          -- additional keymaps for rustaceanvim, `hover`, `code_actions`, `rename`
          -- and others basic ones are handled inside the lsp_config() setup
          local opts = { buffer = bufnr }
          -- Open doc.rs for the symbol under the cursor
          vim.keymap.set("n", "<leader>od", vim.cmd.RustLsp("openDocs"), opts)
          -- Override default buf code_actions to use rust-analyzer grouped code actions
          vim.keymap.set("n", "<leader>a", vim.cmd.RustLsp("codeActions"), opts)
          -- no need to override hover :
          -- y default, this plugin replaces Neovim's built-in hover handler with hover actions,
          -- so you can also use vim.lsp.buf.hover().
        end,
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirstFromCheck = true,
              runBuildScripts = true,
            },
            checkOnSave = {
              allFeature = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = vim.tbl_deep_extend("force", {}, opts or {})
    end,
  },
}
