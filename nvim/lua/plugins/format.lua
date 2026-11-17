return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      yaml = { "yamlfmt" },
    },
    formatters = {
      yamlfmt = {
        -- Preserve existing quote styles: don't force single or double quotes
        prepend_args = { "-formatter", "force_quote_style=" },
      },
    },
  },
}
