set nocompatible
filetype off

source ~/.vim/functions/util.vim

let mapleader = ","
let maplocalleader = "\\"

" VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

""""""""""""
" Appearance
Plugin 'gregsexton/Gravity'
Plugin 'gregsexton/Muon'
Plugin 'sjl/badwolf'
Plugin 'skwp/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'zaiste/Atom'
Plugin 'w0ng/vim-hybrid'
Plugin 'Elive/vim-colorscheme-elive'
Plugin 'zeis/vim-kolor'
Plugin 'morhetz/gruvbox'
Plugin 'therubymug/vim-pyte'

Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'

" Required for Gblame in terminal vi
Plugin 'godlygeek/csapprox'

""""""""""""
" Git
Plugin 'gregsexton/gitv'
Plugin 'mattn/gist-vim'


Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
nmap <leader>g :Ggrep 
" ,f for global git search for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

""""""""""""
" Languages
Plugin 'sheerun/vim-polyglot'

Plugin 'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window:
let g:UltiSnipsEditSplit="vertical"
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'scrooloose/syntastic'
"let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby'], 'passive_filetypes': ['html', 'css', 'slim'] }
let g:syntastic_auto_loc_list = 0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_python_pylint_post_args='--disable=R0904'
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}

Plugin 'tpope/vim-sleuth'

" Python
Plugin 'python_match.vim'
Plugin 'hynek/vim-python-pep8-indent'

" Markdown
Plugin 'tpope/vim-markdown'
"Plugin 'jtratner/vim-flavored-markdown'
"Plugin 'nelstrom/vim-markdown-preview'

" YAML
"Plugin 'chase/vim-ansible-yaml'

""""""""""""
" Project
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.pyc$']
" Make nerdtree look nice:
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

Plugin 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_new_tab = 0
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1
" Don't unfocus NERDTree when leaving a tab for descriptive tab names
let g:nerdtree_tabs_meaningful_tab_names = 0
map <leader>n <plug>NERDTreeTabsToggle<CR>

Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = ''

Plugin 'd11wtq/ctrlp_bdelete.vim'
" A relevant command is called further down this file

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
" Prevent vim-session from asking us to load the session.
" If you want to load the session, use :SaveSession and :OpenSession
let g:session_autosave = 'no'
let g:session_autoload = 'no'

""""""""""""
" Search
Plugin 'rking/ag.vim'
Plugin 'vim-scripts/diffchar.vim'
Plugin 'stefandtw/quickfix-reflector.vim'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'nelstrom/vim-visual-star-search'

""""""""""""""
" Text Objects
" These bundles introduce new textobjects into vim,
" For example the Ruby one introduces the 'r' text object
" such that 'var' gives you Visual Around Ruby
"Plugin 'austintaylor/vim-indentobject'
"Plugin 'bootleq/vim-textobj-rubysymbol'
"Plugin 'coderifous/textobj-word-column.vim'
"Plugin 'kana/vim-textobj-datetime'
"Plugin 'kana/vim-textobj-entire'
"Plugin 'kana/vim-textobj-function'
"Plugin 'kana/vim-textobj-user'
"Plugin 'lucapette/vim-textobj-underscore'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'nelstrom/vim-textobj-rubyblock'
"Plugin 'thinca/vim-textobj-function-javascript'
"Plugin 'vim-scripts/argtextobj.vim'

""""""""""""""""""
" Vim Improvements
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'godlygeek/tabular'
Plugin 'mtth/scratch.vim'

Plugin 'Spaceghost/vim-matchit'

Plugin 'vim-scripts/increment.vim--Natter'

" Refactor multiple instances of text at once
Plugin 'kristijanhusak/vim-multiple-cursors'
" Start <C-n> in normal mode

" Someday figure out what these do:
"Plugin 'Keithbsmiley/investigate.vim'
"Plugin 'chrisbra/NrrwRgn'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'bogado/file-line'
"Plugin 'mattn/webapi-vim'
"Plugin 'tomtom/tlib_vim'
"Plugin 'vim-scripts/AnsiEsc.vim'
"Plugin 'vim-scripts/lastpos.vim'

" Some plugins I decided against:
"Plugin 'tsaleh/vim-align'
"Plugin 'vim-scripts/camelcasemotion'
"Plugin 'briandoll/change-inside-surroundings.vim'
"Plugin 'Raimondi/delimitMate'
"Plugin 'tpope/vim-abolish'
"Plugin 'tpope/vim-ragtag'
"Plugin 'Shougo/neocomplete'
"Plugin 'skwp/YankRing.vim'

""""""""""""
" tmux
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jby/tmux.vim'

""""""""""""
" Coding
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-endwise'

Plugin 'majutsushi/tagbar'
nmap \t :TagbarToggle<CR>

Plugin 'tomtom/tcomment_vim'
" comment current paragraph (block)
nmap <silent> gcp <c-_>p

Plugin 'DeleteTrailingWhitespace'

call vundle#end()            " required
" The remaining settings need to be defined after Vundle above config.
filetype plugin indent on
syntax on

""""""""""""
" Appearance

" Color
" During installation the desired colorscheme might not be available
if filereadable(globpath(&rtp, 'colors/gravity.vim'))
  set t_Co=256
  colorscheme gravity
else
  colorscheme default
endif

""""""""""""
" Git
" The tree buffer makes it easy to drill down through the directories of your
" git repository, but it’s not obvious how you could go up a level to the
" parent directory. Here’s a mapping of .. to the above command, but
" only for buffers containing a git blob or tree
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Every time you open a git object using fugitive it creates a new buffer. 
" This means that your buffer listing can quickly become swamped with 
" fugitive buffers. This prevents this from becomming an issue:

autocmd BufReadPost fugitive://* set bufhidden=delete

""""""""""""
" Languages

""""""""""""
" Project
call ctrlp_bdelete#init()
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" Default to filename searches
let g:ctrlp_by_filename = 1

" Don't jump to already open window. This is annoying if you are maintaining
" several Tab workspaces and want to open two windows into the same file.
let g:ctrlp_switch_buffer = 0

" Additional mapping for buffer search
nnoremap <silent> ,b :CtrlPBuffer<cr>

"Cmd-Shift-(M)ethod - jump to a method (tag in current file)
"Ctrl-m is not good - it overrides behavior of Enter
nnoremap <silent> <D-M> :CtrlPBufTag<CR>

""""""""""""
" Search

""""""""""""""
" Text Objects

""""""""""""""""""
" Vim Improvements

" open on the right so as not to compete with the nerdtree:
let g:gundo_right = 1 
" a little wider for wider screens:
let g:gundo_width = 60

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
source ~/.vim/functions/scratch_toggle.vim

au BufWinEnter *.txt setlocal nolist linebreak
au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
