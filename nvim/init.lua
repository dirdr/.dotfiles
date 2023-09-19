require("dirdr.keymaps")
require("dirdr.options")
require("dirdr.autocmds")
require("dirdr.globals")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", {})
vim.api.nvim_command('autocmd bufwritepost ~/.config/tmux execute \':!tmux source-file %\'')
