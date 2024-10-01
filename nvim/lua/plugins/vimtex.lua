return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.cmd("filetype plugin indent on")
      vim.cmd("syntax enable")
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_enabled = 1
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-shell-escape",
        },
      }
    end,
  },
}
