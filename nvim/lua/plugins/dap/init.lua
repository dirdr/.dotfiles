return {
  -- Debug Adapter Protocol client implementation for Neovim
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- A UI for nvim-dap
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup({
            controls = {
              element = "repl",
              enabled = true,
              icons = {
                disconnect = " ",
                pause = " ",
                play = " ",
                run_last = " ",
                step_back = " ",
                step_into = " ",
                step_out = " ",
                step_over = " ",
                terminate = " ",
              },
            },
          })
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("nvim-dap-virtual-text").setup({})
        end,
      },
    },
    config = function()
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
      vim.fn.sign_define(
        "DapStopped",
        { text = "󰁕 ", texthl = "DiagnosticWarn", linehl = "DapStoppedLine", numhl = "" }
      )
      vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DiagnosticError", linehl = "", numhl = "" })
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = " ", texthl = "DiagnosticError", linehl = "", numhl = "" }
      )
      vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
    end,
  },
}
