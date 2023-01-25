call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ellisonleao/gruvbox.nvim'
Plug 'vim-test/vim-test'
Plug 'hashivim/vim-terraform'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ryanoasis/vim-devicons'
Plug 'ray-x/lsp_signature.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'TimUntersberger/neogit'
Plug 'nvim-lualine/lualine.nvim'
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
call plug#end()
lua <<EOF
vim.g.mapleader = ","
vim.g.cmdheight = 2
vim.g.incsearch = true 
vim.g.hlsearch = true
vim.g.encoding = "UTF-8"
vim.go.splitright = true 
vim.g.limelight_conceal_ctermfg = 100
vim.g.limelight_conceal_guifg = '#83a598'

vim.g.table_mode_corner_corner = "|"

vim.wo.relativenumber = true
vim.wo.number = true

vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE")
vim.cmd("autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4")
vim.cmd("autocmd VimEnter * :silent exec '!kill -s SIGWINCH $PPID'")
vim.cmd("hi SpellBad ctermfg=red guifg=red")

require("gruvbox").setup({
    contrast = "soft",
    bold = false
})
vim.cmd("colorscheme gruvbox")

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require "lsp_signature".setup {}
require "nvim-autopairs".setup {}
require "neogit".setup {
	sort_branches = "committerdate",
	integrations = {
		diffview = true
	}
}
require "lualine".setup {
  options = { theme  = "gruvbox" },
}
require "go"
require "autocomplete"
require "lsp"


local null_ls = require("null-ls")
null_ls.setup {
  sources = {
     null_ls.builtins.formatting.goimports
  }
}

local chadtree_settings = { 
  theme = {
    text_colour_set = "nerdtree_syntax_dark",
    icon_glyph_set = "devicons"
  }
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

EOF

" chadtree
nnoremap <leader>v <cmd>CHADopen<cr>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" vim-test
let test#strategy = "neovim"

nmap <Leader>ll <cmd>Limelight<cr>

" terraform
let g:terraform_align=1

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap gr <cmd>Telescope lsp_references<cr>
nnoremap gd <cmd>Telescope lsp_definition<cr>

set completeopt=menu,menuone,noselect
set termguicolors

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
nmap <silent> <C-g> :Neogit<CR>

map <Space>t :vsplit term://fish<cr>
tnoremap <Esc> <C-\><C-n>

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
