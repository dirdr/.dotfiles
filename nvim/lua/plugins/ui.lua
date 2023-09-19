return {
  {
    "kyazdani42/nvim-web-devicons",
    lazy = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = true,
        },
        extensions = {
          "neo-tree",
        },
      })
      vim.opt.showmode = false
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = function()
      require("gitsigns").setup({
        --TODO
      })
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "BufEnter",
    config = function()
      require("dressing").setup({})
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    cmd = "Neotree",
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          hide_by_name = {
            ".git",
          },
        },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { link = "IndentBlanklineChar" })
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { link = "IndentBlanklineChar" })
        end,
        group = vim.api.nvim_create_augroup("RelinkIndentBlanklineHightLightGroup", { clear = true }),
        desc = "Relink IndentBlankline Highlight Group",
      })
      require("indent_blankline").setup({
        char = "",
        context_char = "│",
        show_current_context = true,
      })
    end,
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.buttons.val = {
        dashboard.button(
          "leader ff",
          "Find file",
          "<cmd>lua require('telescope.builtin').find_files( {previewer = false, no_ignore = false, hidden = false,} )<cr>"
        ),
        dashboard.button("leader fg", "Live grep", "<cmd>lua require('telescope.builtin').live_grep()<cr>"),
      }
      require("alpha").setup(dashboard.opts)
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      -- options
    },
  },
}
