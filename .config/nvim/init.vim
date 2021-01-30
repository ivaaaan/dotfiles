call plug#begin()
Plug 'takac/vim-hardtime'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'vim-test/vim-test'
Plug 'hashivim/vim-terraform'
call plug#end()

let mapleader = ","
set cmdheight=2

let g:ale_set_highlights = 1
let g:ale_virtualtext_cursor = 1

" vim-hardtime
let g:hardtime_default_on = 1
let g:list_of_normal_keys =  ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys =  ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

" ultisnips
let g:UltiSnipsSnippetDirectories=["~/.config/nvim/UltiSnips"]
let g:UltiSnipsExpandTrigger="<C-r>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" vim-go
let g:go_snippet_engine="UltiSnips"
let g:go_fmt_command = "goimports"

" ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['goimports'],
\}

" vim-test
let test#strategy = "neovim"
let g:test#php#phpunit#executable = 'docker-compose exec php vendor/bin/phpunit'

" terraform
let g:terraform_align=1

" colors
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

" keybindings
nmap <leader>fi       :Files<CR>
nmap <silent> gr <Plug>(coc-references)
map <C-n> :NERDTreeToggle<CR>

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap <leader>ca  <Plug>(coc-codeaction)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>rn <Plug>(coc-rename)

set number relativenumber
set nu rnu
set incsearch
set hlsearch

hi SpellBad ctermfg=red guifg=red

filetype plugin on

autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
