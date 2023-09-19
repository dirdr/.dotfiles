-- Ignore files bigger than a threshold
local new_marker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then
      return
    end
    if stat.size > 100000 then
      return
    else
      require("telescope.previewers").buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require("telescope").setup({
        defaults = {
          buffer_preview_marker = new_marker,
          mappings = {
            i = {
              ["<C-n>"] = require("telescope.actions").cycle_history_next,
              ["<C-p>"] = require("telescope.actions").cycle_history_prev,
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
              ["<C-c>"] = require("telescope.actions").close,
              ["<CR>"] = require("telescope.actions").select_default,
            },
            n = {
              ["<esc>"] = require("telescope.actions").close,
              ["<CR>"] = require("telescope.actions").select_default,
              ["j"] = require("telescope.actions").move_selection_next,
              ["k"] = require("telescope.actions").move_selection_previous,
              ["gg"] = require("telescope.actions").move_to_top,
              ["G"] = require("telescope.actions").move_to_bottom,
            },
          },
          extensions = {
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = "smart_case",
            },
            file_browser = {
              previewer = false,
              theme = "dropdown",
              hijack_netrw = true,
              initil_mode = "normal",
              git_status = false,
              mappings = {
                i = {
                  ["<esc>"] = false,
                },
              },
            },
          },
        },
      })
      require("telescope").load_extension("fzf")
    end,
    -- improve sorting performance
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      lazy = true,
      build = "make",
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      lazy = true,
    },
  },
}
