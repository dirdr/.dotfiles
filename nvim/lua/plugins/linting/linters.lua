local default_config_dir = vim.fn.stdpath("config") .. "/lua/plugins/linting/configs/"

-- we need to wrap to_register to a function, since none-ls will loaded after
return {
  pylint = {
    name = "pylint", -- for mason installer
    to_register_wrap = function()
      return require("null-ls").register(require("null-ls").builtins.diagnostics.pylint.with({
        filetypes = { "python" },
        extra_args = {
          "--rcfile",
          require("util").config_finder({ ".pylintrc", "pylintrc" }, default_config_dir),
        },
      }))
    end,
  },
  -- eslint = {
  --   name = "eslint_d",
  --   to_register_wrap = function()
  --     return require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with({
  --       filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  --       command = "eslint_d",
  --       args = { "--stdio", "--format", "json" },
  --       parseJson = {
  --         errorsRoot = "[0].messages",
  --         line = "line",
  --         column = "column",
  --         endLine = "endLine",
  --         endColumn = "endColumn",
  --         message = "${message} [${ruleId}]",
  --         security = "severity",
  --       },
  --       severity_map = {
  --         [2] = "error",
  --         [1] = "warning",
  --       },
  --       sourceName = "eslint_d",
  --       debounce = 100,
  --     }))
  --   end,
  -- },
}
