return {
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.cmd("filetype plugin indent on")
      vim.cmd("syntax enable")
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_enabled = 1
    end,
  },
  -- manage tmux session within neovim
  {
    "sanathks/workspace.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("workspace").setup({
        workspaces = {
          -- opening workspace with keymap open the folder inside workspace
          -- selecting one create a new tmux session based on this folder
          { name = "personal", path = "~/dev/personal", keymap = { "<leader>tp" } },
          { name = "school - ESIEE", path = "~/dev/ESIEE", keymap = { "<leader>te" } },
        },
      })
      local workspace = require("workspace")
      -- set keymap to see current tmux session for the workspace
      vim.keymap.set("n", "<leader>ts", workspace.tmux_sessions)
    end,
  },
}
