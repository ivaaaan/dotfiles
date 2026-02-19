,call plug#begin("~/.config/nvim/plugged")
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'hashivim/vim-terraform'
Plug 'nvim-lua/plenary.nvim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ray-x/lsp_signature.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'dhruvasagar/vim-table-mode'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'folke/trouble.nvim'
Plug 'nvim-neotest/nvim-nio'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'neovim/nvim-lspconfig'
Plug 'sindrets/diffview.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'stevearc/conform.nvim'
Plug 'github/copilot.vim'
Plug 'saghen/blink.cmp', { 'tag': 'v1.*' }
Plug 'mrcjkb/rustaceanvim'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'
Plug 'rebelot/kanagawa.nvim'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
call plug#end()

lua <<EOF
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

vim.g.mapleader = ","
vim.g.cmdheight = 2
vim.g.incsearch = true 
vim.g.hlsearch = true
vim.g.encoding = "UTF-8"

vim.g.table_mode_corner_corner = "|"

vim.wo.relativenumber = true
vim.wo.number = true

require "lsp"
require "keymappings"

require "plugins/autopairs"
require "plugins/chadtree"
require "plugins/conform"
require "plugins/colorscheme"
require "plugins/context"
require "plugins/dap"
require "plugins/diffview"
require "plugins/fzf"
require "plugins/gitsigns"
require "plugins/go"
require "plugins/lsp_signature"
require "plugins/lualine"
require "plugins/treesitter"
require "plugins/trouble"
EOF

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" chadtree
nnoremap <leader>v <cmd>CHADopen<cr>

set completeopt=menu,menuone,noselect

map <Space>t :vsplit term://fish<cr>
tnoremap <Esc> <C-\><C-n>

vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

hi Normal guibg=NONE ctermbg=NONE
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-x> :tabclose<CR>

set splitright

map <up> <C-w><up>
map <down> <C-w><down>
map <left> <C-w><left>
map <right> <C-w><right>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



