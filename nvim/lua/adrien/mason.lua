local status_mason, mason = pcall(require, "mason")
if not status_mason then
    return
end

local status_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_mason_lspconfig then
    return
end

local status_mason_null_ls, mason_null_ls = pcall(require, "mason-null-ls")
if not status_mason_null_ls then
    return
end

local status_null_ls, null_ls = pcall(require, "null-ls")
if not status_null_ls then
    return
end

local servers = {
    "cssls",
    "html",
    "sumneko_lua",
    "tsserver",
    "pyright",
    "bashls",
    "clangd",
    "rust_analyzer",
    "rustfmt",
    "jsonls",
    "prettier",
    "stylua",
}

mason.setup()

mason_lspconfig.setup({
    ensured_installed = servers,
    automatic_installation = true,
})

mason_null_ls.setup({
    ensured_installed = {
        "rustfmt",
        "stylua",
        "prettier",
    },
    automatic_installation = false,
    handlers = {},
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})
