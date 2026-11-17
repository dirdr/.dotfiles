return {
  {
    "sanathks/workspace.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("workspace").setup({
        workspaces = {
          -- opening workspace with keymap open the folder inside workspace
          -- selecting one create a new tmux session based on this folder
          { name = "NUMSPOT", path = "~/dev/sources_numspot/", keymap = { "<leader>tpn" } },
          { name = "PERS", path = "~/dev/sources_pers", keymap = { "<leader>tpp" } },
        },
      })
      local workspace = require("workspace")
      -- set keymap to see current tmux session for the workspace
      vim.keymap.set("n", "<leader>ts", workspace.tmux_sessions)
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
