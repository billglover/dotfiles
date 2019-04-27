" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" declare plugins
silent! if plug#begin()

  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'fatih/vim-go'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'airblade/vim-gitgutter'
  Plug 'SirVer/ultisnips'
  Plug 'dracula/vim', { 'as': 'dracula' }

  call plug#end()
endif

"syntax on
let g:dracula_italic = 0
let g:dracula_colorterm = 0
color dracula
set background=dark
"set termguicolors
let g:airline_theme='dracula'
set cursorline

filetype plugin indent on

let mapleader = ","
let g:mapleader = ","

" settings
set noerrorbells
set number
set showcmd
set noshowmode
set noswapfile
set nobackup
set nowritebackup
set splitright
set splitbelow
set encoding=utf-8
set autowrite
set autoread
set laststatus=2 " always show the status bar
set showtabline=2 " always show the tab bar
set hidden " hide (rather than unload) buffers when abandoned
set ruler
au FocusLost * :wa " save the file when focus lost
set fileformats=unix,dos,mac
set incsearch
set hlsearch
set history=5000
set backspace=indent,eol,start

" performance
set lazyredraw
syntax sync minlines=256
set synmaxcol=300
set re=1

" handle long lines
set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=80

" indenting
set autoindent
set complete-=i
set showmatch
set smarttab
set et
set tabstop=4
set shiftwidth=4
set expandtab

" scrolling
set scrolloff=1
set sidescrolloff=5
set display+=lastline

" mouse support
if has('mouse')
  set mouse=a
endif

" NERDTree
nmap <C-t> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" airline
let g:airline#extensions#branch#enabled = 1

" Fast saving
nmap <leader>w :w!<cr>

" spelling
nnoremap <F6> :setlocal spell! spell?<CR>

" cycle buffers
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

" clear search highlight
nnoremap <leader><space> :nohlsearch<CR>

" GoLang support
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
let g:go_list_type = "quickfix"

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
set updatetime=100
let g:go_auto_sameids = 1
