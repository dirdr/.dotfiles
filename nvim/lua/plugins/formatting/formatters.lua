local default_config_dir = vim.fn.stdpath("config") .. "/lua/plugins/formatting/configs/"

-- we need to wrap to_register to a function, since null-ls will loaded after
-- See https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-- for a list of available built-in sources
return {
  -- prettierd over prettier for formatting speed,
  -- need to actually test if there is a notable difference
  prettierd = {
    name = "prettierd",
    disabled = false,
    to_register_wrap = function()
      return require("null-ls").builtins.formatting.prettier.with({
        extra_args = {
          "--config-path",
          require("util").config_finder({
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yaml",
            ".prettierrc.yml",
            ".prettierrc.toml",
          }, default_config_dir),
        },
      })
    end,
  },
  stylua = {
    name = "stylua",
    disabled = false,
    to_register_wrap = function()
      return require("null-ls").builtins.formatting.stylua.with({
        filetypes = { "lua" },
        extra_args = {
          "--config-path",
          require("util").config_finder({ "stylua.toml", ".stylua.toml" }, default_config_dir),
        },
      })
    end,
  },
  clang_format = {
    name = "clang-format",
    disabled = false,
    to_register_wrap = function()
      return require("null-ls").builtins.formatting.clang_format.with({
        filetypes = { "cpp", "h", "c" },
        extra_args = {
          "--config-path",
          require("util").config_finder({ ".clang-format" }, default_config_dir),
        },
      })
    end,
  },
}
