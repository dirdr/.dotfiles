local status_nightfox, nightfox = pcall(require, "nightfox")
if not status_nightfox then
    return
end
-- comments and keywords will be showed as italic
nightfox.setup({
    options = {
        styles = {
            comments = "italic",
            keywords = "italic",
        },
    },
})

vim.g.gruvbox_flat_style = "dark"
