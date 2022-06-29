syntax on
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set rnu
set noswapfile
set incsearch
set visualbell
set t_vb=
set expandtab
set nobackup
set undodir=~/.vim/undodir
set undofile
set updatetime=100
filetype plugin on
set cursorline

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'frazrepo/vim-rainbow'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
call plug#end()

"Setting up coc nvim
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
"Setting up autocomplition for coc.nvim
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
set cmdheight=2
set background=dark
set t_Co=256
"set t_ut=

colorscheme codedark
let g:codedark_conservative = 1
"NERDTree horizontal size
let g:NERDTreeWinSize=27


" Stands for <Leader>
let mapleader=" "


" Add semicolon at the end of the lien
:map ;; <ESC>A;<ESC>
" Comment a line
:map \\ <leader>c<space>

" Remap window management keys
:map <leader>h :wincmd h <cr>
:map <leader>j :wincmd j <cr>
:map <leader>k :wincmd k <cr>
:map <leader>l :wincmd l <cr>
:map <leader>w :wincmd w <cr>
:map <leader>[ {
" Open NERDTree
:map <leader>d :NERDTreeToggle<cr>
:tnoremap <Esc> <C-\><C-n>
:map <leader>t :term <cr> <Esc>:wincmd w <cr> :wincmd x <cr>:resize 12 <cr>i


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <F2> <Plug>(coc-rename)
