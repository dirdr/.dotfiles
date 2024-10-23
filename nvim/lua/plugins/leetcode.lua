return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    lang = "rust",
    theme = (function()
      local gruvbox_colors = {
        bg_dark = "#282828",
        bg_light = "#fbf1c7",
        fg = "#ebdbb2",
        gray = "#928374",
        red = "#cc241d",
        green = "#98971a",
        yellow = "#d79921",
        blue = "#458588",
        purple = "#b16286",
        aqua = "#689d6a",
        orange = "#d65d0e",
      }

      return {
        [""] = { fg = gruvbox_colors.fg },

        easy = { fg = gruvbox_colors.green },
        medium = { fg = gruvbox_colors.yellow },
        hard = { fg = gruvbox_colors.red },

        easy_alt = { fg = gruvbox_colors.bg_dark },
        medium_alt = { fg = gruvbox_colors.bg_dark },
        hard_alt = { fg = gruvbox_colors.bg_dark },

        ok = { fg = gruvbox_colors.green },
        info = { fg = gruvbox_colors.blue },
        hint = { fg = gruvbox_colors.aqua },
        error = { fg = gruvbox_colors.red },

        case_ok = { fg = gruvbox_colors.green, bg = gruvbox_colors.bg_dark, bold = true },
        case_err = { fg = gruvbox_colors.red, bg = gruvbox_colors.bg_dark, bold = true },

        case_focus_ok = { bg = gruvbox_colors.green, fg = gruvbox_colors.bg_dark, bold = true },
        case_focus_err = { bg = gruvbox_colors.red, fg = gruvbox_colors.bg_dark, bold = true },

        normal = { fg = gruvbox_colors.fg },
        alt = { fg = gruvbox_colors.gray },

        italic = { italic = true },
        bold = { bold = true },
        underline = { underline = true },

        code = { fg = gruvbox_colors.orange, bg = gruvbox_colors.bg_dark },
        example = { fg = gruvbox_colors.aqua },
        constraints = { fg = gruvbox_colors.blue },
        header = { fg = gruvbox_colors.purple, bold = true },
        followup = { fg = gruvbox_colors.yellow, bold = true },

        indent = { fg = gruvbox_colors.gray },
        link = { fg = gruvbox_colors.blue, underline = true },
        list = { fg = gruvbox_colors.purple },
        ref = { fg = gruvbox_colors.orange },
        su = { fg = gruvbox_colors.yellow },

        -- Calendar colors
        calendar_0 = { fg = gruvbox_colors.bg_dark },
        calendar_10 = { fg = gruvbox_colors.gray },
        calendar_20 = { fg = gruvbox_colors.gray },
        calendar_30 = { fg = gruvbox_colors.gray },
        calendar_40 = { fg = gruvbox_colors.blue },
        calendar_50 = { fg = gruvbox_colors.blue },
        calendar_60 = { fg = gruvbox_colors.green },
        calendar_70 = { fg = gruvbox_colors.yellow },
        calendar_80 = { fg = gruvbox_colors.orange },
        calendar_90 = { fg = gruvbox_colors.red },
        calendar_100 = { fg = gruvbox_colors.red },

        all = { fg = gruvbox_colors.fg },
        all_alt = { fg = gruvbox_colors.gray },
      }
    end)(),
    hooks = {
      ["question_enter"] = {
        function()
          -- os.execute "sleep 1"
          local file_extension = vim.fn.expand("%:e")
          if file_extension == "rs" then
            local bash_script = tostring(vim.fn.stdpath("data") .. "/leetcode/rust_init.sh")
            local success, error_message = os.execute(bash_script)
            if success then
              print("Successfully updated rust-project.json")
              vim.cmd("LspRestart rust_analyzer")
            else
              print("Failed update rust-project.json. Error: " .. error_message)
            end
          end
        end,
      },
    },
  },
}
