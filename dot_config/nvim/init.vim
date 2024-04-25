,call plug#begin("~/.config/nvim/plugged")
Plug 'ellisonleao/gruvbox.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'hashivim/vim-terraform'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ryanoasis/vim-devicons'
Plug 'ray-x/lsp_signature.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'dhruvasagar/vim-table-mode'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sindrets/diffview.nvim'
Plug 'leoluz/nvim-dap-go'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'folke/which-key.nvim'
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-lualine/lualine.nvim'
Plug 'folke/trouble.nvim'
Plug 'ms-jpq/coq_nvim'
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'fatih/vim-go'
Plug 'towolf/vim-helm'
Plug 'szw/vim-maximizer'
Plug 'dracula/vim'
Plug 'nvim-neotest/nvim-nio'
Plug 'rmagatti/auto-session'
call plug#end()

lua <<EOF
vim.g.mapleader = ","
vim.g.cmdheight = 2
vim.g.incsearch = true 
vim.g.hlsearch = true
vim.g.encoding = "UTF-8"
vim.go.splitright = true 

vim.g.table_mode_corner_corner = "|"

vim.wo.relativenumber = true
vim.wo.number = true

vim.cmd("autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4")
vim.cmd("autocmd VimEnter * :silent exec '!kill -s SIGWINCH $PPID'")
vim.cmd("hi SpellBad ctermfg=red guifg=red")


require "plugins/colorscheme"
require "plugins/autopairs"
require "plugins/treesitter"
require "plugins/go"
require "plugins/chadtree"
require "plugins/dap"
require "plugins/whichkey"
require "plugins/lualine"
require "plugins/autosession"
require "lsp"
require "plugins/lsp_signature"
require "autocomplete"
require "keymappings"
EOF


highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" chadtree
 nnoremap <leader>v <cmd>CHADopen<cr>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>b <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <space>o <cmd>Telescope lsp_document_symbols<cr>
nnoremap <space>O <cmd>Telescope lsp_dynamic_workspace_symbols<cr>

set completeopt=menu,menuone,noselect

map <Space>t :vsplit term://fish<cr>
tnoremap <Esc> <C-\><C-n>

autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>tf <Plug>(go-test-func)

vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
noremap <C-w>m :MaximizerToggle<CR>
hi Normal guibg=NONE ctermbg=NONE

map <up> <C-w><up>
map <down> <C-w><down>
map <left> <C-w><left>
map <right> <C-w><right>
