call plug#begin()
"colorscheme
Plug 'gruvbox-community/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'bluz71/vim-nightfly-colors'
Plug 'sainnhe/gruvbox-material'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" lsp
Plug 'williamboman/mason.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jayp0521/mason-null-ls.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'simrat39/rust-tools.nvim'
" cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-vsnip'                       
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" nvim tree 
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
" AutoPairs
Plug 'windwp/nvim-autopairs'
" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter'
" comment
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
" bufferline 
Plug 'akinsho/bufferline.nvim'
Plug 'moll/vim-bbye'
" autoclosing tag
Plug 'windwp/nvim-ts-autotag'
" trouble 
Plug 'folke/trouble.nvim'
" toggleterm
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
" DAP
Plug 'mfussenegger/nvim-dap'
" statusline
Plug 'nvim-lualine/lualine.nvim'
" alpha
Plug 'goolord/alpha-nvim'
" markdown previewer 
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" indent blank line
Plug 'lukas-reineke/indent-blankline.nvim'
" vim be good - training vim movement
Plug 'ThePrimeagen/vim-be-good'
" tmux navigator 
Plug 'christoomey/vim-tmux-navigator'
" vim text
Plug 'lervag/vimtex'
" Emmet
Plug 'mattn/emmet-vim'
call plug#end()
lua require("adrien/init")
set termguicolors
autocmd bufwritepost ~/.config/tmux execute ':!tmux source-file %'
colorscheme gruvbox-material
