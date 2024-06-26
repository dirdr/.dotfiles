return {
  {
    "nvimtools/none-ls.nvim",
    config = function(_, opts) -- opts is received from child spec (formatting, linting)
      local sources = {} -- a list of to_register
      for _, to_register_wrap in pairs(opts) do
        local to_register = to_register_wrap()
        table.insert(sources, to_register)
      end
      require("null-ls").setup({
        sources = sources,
      })
    end,
  },
}
