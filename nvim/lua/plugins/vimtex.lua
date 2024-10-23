return {
  "lervag/vimtex",
  opts = function(_, opts)
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_enabled = 1
    vim.g.vimtex_compiler_latexmk = {
      options = {
        "-shell-escape",
      },
    }
  end,
}
