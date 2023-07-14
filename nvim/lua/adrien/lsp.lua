local servers = {
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

local status_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_lspconfig then
    print("error in the require of lspconfig")
    return
end

local status_cmpLsp, cmpLsp = pcall(require, "cmp_nvim_lsp")
if not status_cmpLsp then
    print("error in the require of nvim_cmp")
    return
end

local status_rust_tools, rust_tools = pcall(require, "rust-tools")
if not status_rust_tools then
    print("error in the require of rust_tools")
    return
end

local capabilities = cmpLsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "f", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "rf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts) -- to format with null ls source
end

for server, opts in pairs(servers) do
    lspconfig[server].setup({
        capabilities = capabilities,
        settings = opts,
        on_attach = on_attach,
    })
end

-- This plugin automatically sets up nvim-lspconfig for rust_analyzer for you,
-- so don't do that manually, as it causes conflicts.
rust_tools.setup({
    server = {
        on_attach = function(_, bufnr)
            local opts = { noremap = true, silent = true }
            -- Hover actions
            vim.keymap.set("n", "<Leader>h", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
            vim.api.nvim_buf_set_keymap(bufnr, "n", "rf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts) -- to format with null ls source
            vim.api.nvim_buf_set_keymap(bufnr, "n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        end,
    },
})
