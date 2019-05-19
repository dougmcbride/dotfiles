"call plug#begin('~/.vim/plugged')
"Plug 'keith/swift.vim'
"call plug#end()
"execute pathogen#infect()

set fileencodings=utf-8,cp936,gbk,utf-16le

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_swift_checkers = ['swiftlint']

" Make vim more useful
set nocompatible
" Make :find recursive in current directory
set path+=**
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
" set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol

" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" colorscheme murphy
colorscheme ir_black
map _L ^y$IDLog(@"A = %@", pA);
" map _f :FuzzyFinderTextMate
map _l ^y$Ilogger.debug "A = #{}"hP
map _o :noh
map _r :Rgrep<Home>def /vendor
map _t !}fmt
" Highlight current line
set cursorline
" Shift width 2
set sw=2
" Spaces not tabs
set expandtab
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Use relative line numbers
set relativenumber
au BufReadPost * set relativenumber
" Start scrolling three lines before the horizontal window border
set scrolloff=5

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" Change spaces to newlines (,nn)
function! SpacesToNewlines ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/ //e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>nn :call SpacesToNewlines ()<CR>

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'keith/swift.vim', { 'for':  'swift' }
Plug 'scrooloose/syntastic'
Plug 'chase/vim-ansible-yaml'
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Add plugins to &runtimepath
call plug#end()