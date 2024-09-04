,call plug#begin("~/.config/nvim/plugged")
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'hashivim/vim-terraform'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ryanoasis/vim-devicons'
Plug 'ray-x/lsp_signature.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
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
Plug 'towolf/vim-helm'
Plug 'szw/vim-maximizer'
Plug 'dracula/vim'
Plug 'nvim-neotest/nvim-nio'
Plug 'rmagatti/auto-session'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'rafamadriz/friendly-snippets'
Plug 'f3fora/cmp-spell'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'
Plug 'sindrets/diffview.nvim'
call plug#end()

source "coc.vim"
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

vim.opt.spell = true
vim.opt.spelllang = { "en_us" }
vim.opt.spelloptions = "camel"

require "plugins/colorscheme"
require "plugins/autopairs"
require "plugins/treesitter"
require "plugins/chadtree"
require "plugins/dap"
require "plugins/whichkey"
require "plugins/lualine"
require "plugins/autosession"
require "lsp"
require "plugins/lsp_signature"
require "plugins/coc"
require "plugins/go"
require "keymappings"
require("trouble").setup()

require('fzf-lua').setup({ winopts = { split = 'botright new', preview = {
			hidden = 'nohidden', --hidden|nohidden
	 	}
	}
})
EOF

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" chadtree
nnoremap <leader>v <cmd>CHADopen<cr>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>


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

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
