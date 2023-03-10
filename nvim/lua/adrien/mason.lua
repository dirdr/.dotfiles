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
}

mason.setup()
mason_lspconfig.setup({
    ensured_installed = servers,
    automatic_installation = true,
})

mason_null_ls.setup({
    automatic_setup = true,
})

null_ls.setup()
require("mason-null-ls").setup_handlers() -- If `automatic_setup` is true.
