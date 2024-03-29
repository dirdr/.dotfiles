local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap

--Remap space as leader key
keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- greatest remap ever (Paste over selection without yanking)
keymap.set("x", "p", "P")

-- normal --
-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

keymap.set("n", "<leader>r", ":Lex 30<cr>", opts)

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap.set("i", "jk", "<ESC>", opts)

-- Visual -- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Terminal --
-- Better terminal navigation
keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
keymap.set("t", "<Esc>", "<C-\\><C-n>", term_opts)

-- Telescope --
keymap.set(
  "n",
  "<leader>ff",
  "<cmd>lua require('telescope.builtin').find_files( {previewer = false, no_ignore = false, hidden = false,} )<cr>",
  opts
)
keymap.set("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap.set("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap.set("n", "<leader>fc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", opts)

-- NeoTree --
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", opts)

keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

-- Dapui
keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle({})<cr>", opts)
keymap.set("n", "<leader>de", "<cmd>lua require('dapui').eval()<cr>", opts)

-- Dap
keymap.set("n", "<leader>dB", "require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))", opts)
keymap.set("n", "<leader>de", "require('dap').toggle_breakpoint()", opts)
keymap.set("n", "<leader>dl", "require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))", opts)
keymap.set("n", "<leader>dC", "require('dap').run_to_cursor()", opts)
keymap.set("n", "<leader>dg", "require('dap').goto_()", opts)
keymap.set("n", "<leader>di", "require('dap').step_into()", opts)
keymap.set("n", "<leader>dk", "require('dap').up()", opts)
keymap.set("n", "<leader>dj", "require('dap').down()", opts)
keymap.set("n", "<leader>do", "require('dap').step_out()", opts)
keymap.set("n", "<leader>dO", "require('dap').step_over()", opts)
keymap.set("n", "<leader>dp", "require('dap').pause()", opts)
keymap.set("n", "<leader>dp", "require('dap').pause()", opts)
keymap.set("n", "<leader>dr", "require('dap').repl.toggle()", opts)
keymap.set("n", "<leader>ds", "require('dap').session()", opts)
keymap.set("n", "<leader>dt", "require('dap').terminate()", opts)
keymap.set("n", "<leader>dR", "require('dap').clear_breakpoints()", opts)
