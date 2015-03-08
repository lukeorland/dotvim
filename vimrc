set nocompatible
filetype off

source ~/.vim/functions/util.vim

let mapleader = ","
let maplocalleader = "\\"

" VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tsaleh/vim-align'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-eunuch'
Plugin 'sjl/gundo.vim'

Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.pyc$']
" open a NERDTree automatically when vim starts up if no files were specified:
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

Plugin 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_new_tab = 0
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0
nmap <C-n> :NERDTreeTabsToggle<CR>

Plugin 'Spaceghost/vim-matchit'
Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = ''

Plugin 'd11wtq/ctrlp_bdelete.vim'
" A relevant command is called further down this file

Plugin 'vim-scripts/increment.vim--Natter'

Plugin 'bling/vim-airline'

" Coding
Plugin 'Valloric/YouCompleteMe'

Plugin 'majutsushi/tagbar'
nmap \t :TagbarToggle<CR>

Plugin 'gregsexton/gitv'

Plugin 'joonty/vdebug'

Plugin 'scrooloose/nerdcommenter'
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>

Plugin 'DeleteTrailingWhitespace'

Plugin 'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window:
let g:UltiSnipsEditSplit="vertical"
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'tpope/vim-fugitive'
nmap <leader>g :Ggrep 
" ,f for global git search for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

Plugin 'scrooloose/syntastic'
"let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby'], 'passive_filetypes': ['html', 'css', 'slim'] }
let g:syntastic_auto_loc_list = 0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_python_pylint_post_args='--disable=R0904'

Plugin 'python_match.vim'
Plugin 'hynek/vim-python-pep8-indent'

Plugin 'tpope/vim-markdown'
"Plugin 'chase/vim-ansible-yaml'

Plugin 'tpope/vim-sleuth'

Plugin 'sjl/badwolf'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'zaiste/Atom'
Plugin 'w0ng/vim-hybrid'
Plugin 'chriskempson/base16-vim'
Plugin 'Elive/vim-colorscheme-elive'
Plugin 'zeis/vim-kolor'
Plugin 'morhetz/gruvbox'
Plugin 'therubymug/vim-pyte'
" }}}

call vundle#end()            " required


" Color
" During installation the desired colorscheme might not be available
"if filereadable(globpath(&rtp, 'colors/kolor.vim'))
if filereadable(globpath(&rtp, 'colors/pyte.vim'))
  set t_Co=256
  colorscheme pyte
else
  colorscheme default
endif

call ctrlp_bdelete#init()

filetype plugin indent on
syntax on

autocmd FileType gitcommit set tw=68 spell
autocmd FileType gitcommit setlocal foldmethod=manual

set scrolloff=0

"set switchbuf=useopen

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Mappings
" Yank from current cursor position to end of line
map Y y$
" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <leader>yo "*y
" Paste content from OS's clipboard
nnoremap <leader>po "*p

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Settings
set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=menuone,preview
set encoding=utf-8
set hidden
set history=1000
set incsearch
set laststatus=2
set list

" Don't redraw while executing macros
set nolazyredraw

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set showbreak=↪

set notimeout
set ttimeout
set ttimeoutlen=10

if has('persistent_undo')
  set undodir=~/.vim/tmp/undo/     " undo files
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set backup
set noswapfile

set modeline
set modelines=3
set endofline
set number

if exists('+relativenumber')
  set relativenumber
endif

set numberwidth=3
set winwidth=83
set ruler

if executable('zsh')
  set shell=zsh\ -l
else
  set shell=bash\ -i
endif

set showcmd

set exrc
set secure

set matchtime=2

set completeopt=longest,menuone,preview

" White characters
set autoindent
set tabstop=4
set softtabstop=4
set textwidth=80
set shiftwidth=4
set expandtab
set wrap
set formatoptions=qnc1
if exists('+colorcolumn')
  set colorcolumn=+1
endif
" filetype-specific settings are under .vim/ftplugin/

set visualbell

" Completion behaves like bash
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.pyc,*.toc,tmp,*.scssc
set wildmenu
set wildmode=list:longest,full

set dictionary=/usr/share/dict/words

" Save when losing focus
au FocusLost    * :silent! wall

" Cursorline
" Only show cursorline in the current window and in normal mode.
augroup cline
  au!
  au WinLeave * set nocursorline
  au WinEnter * set cursorline
  au InsertEnter * set nocursorline
  au InsertLeave * set cursorline
augroup END

" Trailing whitespace
set listchars=tab:↦\ ,trail:◦,precedes:˂,extends:˃
"set listchars=tab:↦\ ,trail:◦,precedes:˂,extends:˃,eol:$

set ignorecase
set smartcase
set showmatch
set nogdefault
set hlsearch

" ,/ clears current search highlight 
nmap <silent> <header>/ :nohlsearch<CR>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Open from Quickfix into a new tab if not already open in a tab:
set switchbuf+=usetab,newtab

" Navigation & UI

" Begining & End of line in Normal mode
noremap H ^
noremap L g_

" more natural movement with wrap on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Easy splitted window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" folding
set foldlevelstart=0
set foldmethod=syntax

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

source ~/.vim/functions/buffer_handling.vim
source ~/.vim/functions/insert_tab_wrapper.vim
source ~/.vim/functions/my_fold_text.vim

au BufWinEnter *.txt setlocal nolist linebreak
au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
