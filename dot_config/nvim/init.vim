call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ellisonleao/gruvbox.nvim'
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
call plug#end()
set t_Co=256
set background=dark
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

require("gruvbox").setup({
    contrast = "soft",
    bold = false,
    italic = false,
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
require "go"
require "autocomplete"
require "lsp"


local null_ls = require("null-ls")
null_ls.setup {
  sources = {
     null_ls.builtins.formatting.goimports,
     null_ls.builtins.diagnostics.cspell,
     null_ls.builtins.code_actions.cspell,
     null_ls.builtins.code_actions.gomodifytags
  }
}

local chadtree_settings = { 
  theme = {
    text_colour_set = "nerdtree_syntax_dark",
    icon_glyph_set = "devicons",
    icon_colour_set = "none"
  }
}

vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

vim.keymap.set({ 'n' }, '<Leader>k', function()
     vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })
EOF

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" chadtree
nnoremap <leader>v <cmd>CHADopen<cr>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>tf <Plug>(go-test-func)

" terraform
let g:terraform_align=1

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>b <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap gr <cmd>Telescope lsp_references<cr>
nnoremap gd <cmd>Telescope lsp_definition<cr>
nnoremap <space>o <cmd>Telescope lsp_document_symbols<cr>
nnoremap <space>O <cmd>Telescope lsp_dynamic_workspace_symbols<cr>

set completeopt=menu,menuone,noselect

map <Space>t :vsplit term://fish<cr>
tnoremap <Esc> <C-\><C-n>
