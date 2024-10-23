local M = {}

-- Get highlight group value by name.
local function hl(name)
  local highlight = vim.api.nvim_get_hl(0, { name = name, link = false })
  setmetatable(highlight, {
    __index = function(self, key)
      if key == "bg" then
        return self.background
      end
      if key == "fg" then
        return self.foreground
      end
      return nil
    end,
  })
  return highlight
end

M.get = function()
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
    [""] = { fg = hl("Normal").fg },

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

    case_ok = { fg = gruvbox_colors.green, bg = hl("Normal").bg, bold = true },
    case_err = { fg = gruvbox_colors.red, bg = hl("Normal").bg, bold = true },

    case_focus_ok = { bg = gruvbox_colors.green, fg = hl("Normal").fg, bold = true },
    case_focus_err = { bg = gruvbox_colors.red, fg = hl("Normal").fg, bold = true },

    normal = { fg = gruvbox_colors.fg },
    alt = { fg = gruvbox_colors.gray },

    italic = { italic = true },
    bold = { bold = true },
    underline = { underline = true },

    code = { fg = gruvbox_colors.orange, bg = hl("Normal").bg },
    example = { fg = gruvbox_colors.aqua },
    constraints = { fg = gruvbox_colors.blue },
    header = { fg = gruvbox_colors.purple, bold = true },
    followup = { fg = gruvbox_colors.yellow, bold = true },

    indent = { fg = gruvbox_colors.gray },
    link = { fg = gruvbox_colors.blue, underline = true },
    list = { fg = gruvbox_colors.purple },
    ref = { fg = gruvbox_colors.orange },
    su = { fg = gruvbox_colors.yellow },

    -- Calendar colors can be adjusted based on your preference
    calendar_0 = { fg = gruvbox_colors.bg_dark },
    calendar_10 = { fg = gruvbox_colors.bg_dark },
    calendar_20 = { fg = gruvbox_colors.gray },
    calendar_30 = { fg = gruvbox_colors.gray },
    calendar_40 = { fg = gruvbox_colors.gray },
    calendar_50 = { fg = gruvbox_colors.blue },
    calendar_60 = { fg = gruvbox_colors.blue },
    calendar_70 = { fg = gruvbox_colors.green },
    calendar_80 = { fg = gruvbox_colors.yellow },
    calendar_90 = { fg = gruvbox_colors.orange },
    calendar_100 = { fg = gruvbox_colors.red },

    all = { fg = hl("Normal").fg },
    all_alt = { fg = gruvbox_colors.gray },
  }
end

return M
