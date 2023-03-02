local alpha_ok, alpha = pcall(require, "alpha")
if not alpha_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = "Macro"
    return b
end

local icons = require("adrien.icons")

dashboard.section.buttons.val = {
    button("f", icons.documents.Files .. " Find file", ":Telescope find_files <CR>"),
    button("t", icons.ui.List .. " Find text", ":Telescope live_grep <CR>"),
}

alpha.setup(dashboard.opts)
