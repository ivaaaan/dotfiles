,call plug#begin("~/.config/nvim/plugged")
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'hashivim/vim-terraform'
Plug 'nvim-lua/plenary.nvim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ray-x/lsp_signature.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'folke/trouble.nvim'
Plug 'towolf/vim-helm'
Plug 'dracula/vim'
Plug 'nvim-neotest/nvim-nio'
Plug 'rmagatti/auto-session'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'neovim/nvim-lspconfig'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sindrets/diffview.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'stevearc/conform.nvim'
Plug 'takac/vim-hardtime'
Plug 'github/copilot.vim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'ellisonleao/gruvbox.nvim'
Plug'saghen/blink.cmp', { 'tag': 'v1.*' }
Plug 'rafamadriz/friendly-snippets'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} 
Plug 'greggh/claude-code.nvim'
Plug 'mrcjkb/rustaceanvim'
Plug 'olexsmir/gopher.nvim'
Plug 'wtfox/jellybeans.nvim'
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
require "plugins/lualine"
require "plugins/autosession"
require "plugins/claudecode"
require "lsp"
require "plugins/lsp_signature"
require "plugins/gitsigns"
require "plugins/go"
require "keymappings"
require("trouble").setup()
--require "commands"

require('fzf-lua').setup({ winopts = { split = 'botright new', preview = {
	hidden = 'nohidden', --hidden|nohidden
}
}})


-- require("conform").setup({
--   formatters_by_ft = {
--     lua = { "stylua" },
--     python = { "black" },
--     rust = { "rustfmt", lsp_format = "fallback" },
--     javascript = { "prettierd", "prettier", stop_after_first = true },
--     go = { "gofmt", "gofumpt", lsp_format = "fallback"},
--     html = {"superhtml"},
--     css = {
-- 	command = "stylelint --config=$HOME/.stylelintrc.js"
--     }
--   },
-- })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
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

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-x> :tabclose<CR>

map <up> <C-w><up>
map <down> <C-w><down>
map <left> <C-w><left>
map <right> <C-w><right>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



