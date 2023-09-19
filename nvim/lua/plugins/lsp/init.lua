local function lspconfig_setup()
  local servers = { -- don't include rustanalyzer because of further integration with rsut tools
    ["cssls"] = {},
    ["html"] = {},
    ["lua_ls"] = { Lua = { diagnostics = { globals = { "vim" } } } },
    ["tsserver"] = {},
    ["pyright"] = {},
    ["bashls"] = {},
    ["clangd"] = {},
    ["marksman"] = {},
    ["texlab"] = {},
    ["java_language_server"] = {},
  }

  local capabilities = cmpLsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "f", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  end

  for server, opts in pairs(servers) do
    require("lspconfig")[server].setup({
      capabilities = capabilities,
      settings = opts,
      on_attach = on_attach,
    })
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
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup({
        server = {
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true }
            -- Hover actions
            vim.keymap.set("n", "<Leader>h", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
            vim.api.nvim_buf_set_keymap(bufnr, "n", "rf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts) -- to format with null ls source
            vim.api.nvim_buf_set_keymap(bufnr, "n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
          end,
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
      })
    end,
  },
}
