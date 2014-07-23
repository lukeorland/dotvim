set nocompatible
filetype on
filetype off

" Utils {{{
source ~/.vim/functions/util.vim
" }}}

let mapleader = ","
let maplocalleader = "\\"

" VUNDLE {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
" }}}

" PACKAGES and FILETYPE-SPECIFIC SETTINGS {{{

" _. General {{{
" TODO: uncomment when I know what these do:
"Plugin 'editorconfig/editorconfig-vim'

"Plugin 'rking/ag.vim'
"nnoremap <leader>a :Ag -i<space>

"Plugin 'matthias-guenther/hammer.vim'
"nmap <leader>p :Hammer<cr>

Plugin 'tsaleh/vim-align'
"Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
"Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-unimpaired'
"Plugin 'maxbrunsfeld/vim-yankstack'
"Plugin 'tpope/vim-eunuch'

Plugin 'scrooloose/nerdtree'
nmap <C-i> :NERDTreeToggle<CR>
"map <C-n> :NERDTreeToggle<CR>
" Keep NERDTree window fixed between multiple toggles
"set winfixwidth
let NERDTreeIgnore = ['\.pyc$']
" open a NERDTree automatically when vim starts up if no files were specified:
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

Plugin 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_new_tab = 0
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0


" TODO: what's this?
"Plugin 'kana/vim-textobj-user'

Plugin 'vim-scripts/YankRing.vim'
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
let g:yankring_history_dir = '~/.vim/tmp/'
nmap <leader>y :YRShow<cr>

Plugin 'michaeljsmith/vim-indent-object'
let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown"]

Plugin 'Spaceghost/vim-matchit'
Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = ''

Plugin 'd11wtq/ctrlp_bdelete.vim'
" A relevant command is called below.

Plugin 'vim-scripts/scratch.vim'

Plugin 'troydm/easybuffer.vim'
nmap <leader>be :EasyBufferToggle<enter>

Plugin 'terryma/vim-multiple-cursors'
" }}}

" _. Fancy {{{
call g:Check_defined('g:airline_left_sep', '')
call g:Check_defined('g:airline_right_sep', '')
call g:Check_defined('g:airline_branch_prefix', '')

Plugin 'bling/vim-airline'

"Plugin 'xsunsmile/showmarks.git'
" I don't like this plugin that much.
"let g:showmarks_enable = 1
"hi! link ShowMarksHLl LineNr
"hi! link ShowMarksHLu LineNr
"hi! link ShowMarksHLo LineNr
"hi! link ShowMarksHLm LineNr
" }}}

" _. Indent {{{
"Plugin 'Yggdroot/indentLine'
"set list lcs=tab:\|\
"let g:indentLine_color_term = 111
"let g:indentLine_color_gui = '#DADADA'
"let g:indentLine_char = 'c'
""let g:indentLine_char = '∙▹¦'
"let g:indentLine_char = '∙'
" }}}

" _. OS {{{
"Plugin 'zaiste/tmux.vim'
"Plugin 'benmills/vimux'
"map <Leader>rp :VimuxPromptCommand<CR>
"map <Leader>rl :VimuxRunLastCommand<CR>
"
"map <LocalLeader>d :call VimuxRunCommand(@v, 0)<CR>
" }}}

" _. Coding {{{
Plugin 'Valloric/YouCompleteMe'

Plugin 'majutsushi/tagbar'
nmap \t :TagbarToggle<CR>

Plugin 'gregsexton/gitv'

Plugin 'joonty/vdebug'

Plugin 'scrooloose/nerdcommenter'
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>

" TODO: What's splice.vim?
"Plugin 'sjl/splice.vim'

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

"" http://stackoverflow.com/a/18685821/492631
"function! g:UltiSnips_Complete()
"    call UltiSnips#ExpandSnippet()
"    if g:ulti_expand_res == 0
"        if pumvisible()
"            return "\<C-n>"
"        else
"            call UltiSnips#JumpForwards()
"            if g:ulti_jump_forwards_res == 0
"               return "\<TAB>"
"            endif
"        endif
"    endif
"    return ""
"endfunction
"
"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-e>"
"" this mapping Enter key to <C-y> to chose the current highlight item 
"" and close the selection list, same as other IDEs.
"" CONFLICT with some plugins like tpope/Endwise
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

Plugin 'tpope/vim-fugitive'
nmap <leader>g :Ggrep
" ,f for global git serach for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

Plugin 'scrooloose/syntastic'
"let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby'], 'passive_filetypes': ['html', 'css', 'slim'] }
let g:syntastic_auto_loc_list = 0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

" --

Plugin 'vim-scripts/Reindent'

autocmd FileType gitcommit set tw=68 spell
autocmd FileType gitcommit setlocal foldmethod=manual
" }}}

" _. Python {{{
" Plugins configured in .vim/ftplugin/python.vim
"Plugin 'klen/python-mode'  " syntax, rope, auto-trim whitespace, etc., annoying

Plugin 'python.vim'
Plugin 'python_match.vim'
Plugin 'vim-python-pep8-indent'

"Plugin 'pythoncomplete'  " Superceded by YouCompleteMe
" }}}

" _. Ruby {{{
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'tpope/vim-rails'
"Plugin 'nelstrom/vim-textobj-rubyblock'
"Plugin 'ecomba/vim-ruby-refactoring'
"
"autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et
"autocmd FileType ruby,eruby,yaml setlocal foldmethod=manual
"autocmd User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

"set ofu=syntaxcomplete#Complete
"let g:rubycomplete_buffer_loading = 0
"let g:rubycomplete_classes_in_global = 1

" }}}

" _. Clang {{{
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'LucHermitte/clang_indexer'
"Plugin 'newclear/lh-vim-lib'
"Plugin 'LucHermitte/vim-clang'
"Plugin 'devx/c.vim'
" }}}

" _. HTML {{{
"Plugin 'tpope/vim-haml'
"Plugin 'juvenn/mustache.vim'
Plugin 'tpope/vim-markdown'
Plugin 'digitaltoad/vim-jade'
Plugin 'slim-template/vim-slim'

au BufNewFile,BufReadPost *.jade setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
" }}}

" _. CSS {{{
Plugin 'wavded/vim-stylus'
Plugin 'lunaru/vim-less'
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>
" }}}

" _. JS {{{
Plugin 'kchmck/vim-coffee-script'
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

Plugin 'alfredodeza/jacinto.vim'
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" }}}

" _. Color {{{
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


" Color {{{
" During installation the desired colorscheme might not be avalable
"if filereadable(globpath(&rtp, 'colors/gruvbox.vim'))
"if filereadable(globpath(&rtp, 'colors/molokai.vim'))
if filereadable(globpath(&rtp, 'colors/kolor.vim'))
  "colorscheme gruvbox
  "colorscheme molokai
  colorscheme kolor
else
  colorscheme default
endif
" }}}

" _. call commands after loading plugins {{{
call ctrlp_bdelete#init()
" }}}

" }}}

" General {{{
filetype plugin indent on
syntax on

" Set 5 lines to the cursor - when moving vertically
set scrolloff=0

" It defines where to look for the buffer user demanding (current window, all
" windows in other tabs, or nowhere, i.e. open file from scratch every time) and
" how to open the buffer (in the new split, tab, or in the current window).

" This orders Vim to open the buffer.
" TODO: huh?
"set switchbuf=useopen

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}

" Mappings {{{

" Yank from current cursor position to end of line
map Y y$
" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <leader>yo "*y
" Paste content from OS's clipboard
nnoremap <leader>po "*p

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" better ESC
inoremap <C-k> <Esc>

nmap <silent> <leader>hh :set invhlsearch<CR>
nmap <silent> <leader>ll :set invlist<CR>
nmap <silent> <leader>nn :set invnumber<CR>
nmap <silent> <leader>pp :set invpaste<CR>
nmap <silent> <leader>ii :set invrelativenumber<CR>

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Source current line
vnoremap <leader>L y:execute @@<cr>
" Source visual selection
nnoremap <leader>L ^vg_y:execute @@<cr>

" Fast saving and closing current buffer without closing windows displaying the
" buffer
nmap <leader>wq :w!<cr>:Bclose<cr>

" }}}

" . abbrevs {{{
"
"iabbrev z@ oh@zaiste.net

" . }}}

" Settings {{{
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

" _ backups {{{
if has('persistent_undo')
  set undodir=~/.vim/tmp/undo//     " undo files
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup
set noswapfile
" _ }}}

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
"if executable('zsh')
  "set shell=zsh\ -l
"endif
set shell=bash\ -i

set showcmd

set exrc
set secure

set matchtime=2

set completeopt=longest,menuone,preview

" White characters {{{
set autoindent
set textwidth=80
set shiftwidth=4
set tabstop=4
set wrap
set formatoptions=qrnc1
if exists('+colorcolumn')
  set colorcolumn=80
endif
" filetype-specific settings are under .vim/ftplugin/
" }}}

set visualbell

" Completion behaves like bash
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildmenu
set wildmode=list:longest,full

set dictionary=/usr/share/dict/words
" }}}

" Triggers {{{

" Save when losing focus
au FocusLost    * :silent! wall
"
" When vimrc is edited, reload it
autocmd! BufWritePost vimrc source ~/.vimrc

" }}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END
" }}}

" Trailing whitespace {{{
"" Only shown when not in insert mode so I don't go insane.
"augroup trailing
    "au!
    "au InsertEnter * :set listchars-=trail:␣
    "au InsertLeave * :set listchars+=trail:␣
"augroup END
set listchars=tab:↦\ ,trail:◦,precedes:˂,extends:˃

" Remove trailing whitespaces when saving
" Wanna know more? http://vim.wikia.com/wiki/Remove_unwanted_spaces
" If you want to remove trailing spaces when you want, so not automatically,
" see
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Display_or_remove_unwanted_whitespace_with_a_script.
"autocmd BufWritePre * :%s/\s\+$//e
" Using DeleteTrailingWhitespace plugin instead of the above.

" }}}

" . searching {{{

" sane regexes
"nnoremap / /\v
"vnoremap / /\v

set ignorecase
set smartcase
set showmatch
"set gdefault
set hlsearch

" Spacebar unhighlights search results.
"noremap <leader><space> :noh<cr>:call clearmatches()<cr>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>"
"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" Don't jump when using * for search
"nnoremap * *<c-o>

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

" Highlight word {{{
" TODO: figure out what this is:
"nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
"nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
"nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
"nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>
" }}}

" }}}

" Navigation & UI {{{

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

" Easy buffer navigation
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Bubbling lines
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" }}}

" . folding {{{

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

" }}}

" Quick editing {{{

nnoremap <leader>ev <C-w>s<C-w>j:e $MYVIMRC<cr>
nnoremap <leader>es <C-w>s<C-w>j:e ~/.vim/snippets/<cr>
nnoremap <leader>eg <C-w>s<C-w>j:e ~/.gitconfig<cr>
nnoremap <leader>ez <C-w>s<C-w>j:e ~/.zshrc<cr>
nnoremap <leader>et <C-w>s<C-w>j:e ~/.tmux.conf<cr>

" --------------------

" }}}

" _ Vim {{{
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}

" EXTENSIONS {{{

" _. Scratch {{{
source ~/.vim/functions/scratch_toggle.vim
" }}}

" _. Buffer Handling {{{
source ~/.vim/functions/buffer_handling.vim
" }}}

" _. Tab {{{
source ~/.vim/functions/insert_tab_wrapper.vim
" }}}

" _. Text Folding {{{
source ~/.vim/functions/my_fold_text.vim
" }}}

" _. Gist {{{
" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
" TODO: I think this is broken since the gist API changed?
"vnoremap <leader>G :w !gist -p -t %:e \| pbcopy<cr>
" }}}

" }}}

" TEXT OBJECTS {{{

" Shortcut for [] motion
" TODO: What are these supposed to do?
"onoremap ir i[
"onoremap ar a[
"vnoremap ir i[
"vnoremap ar a[

" }}}
