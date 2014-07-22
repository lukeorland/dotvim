" Ignore these files when completing
set wildignore+=*.pyc,eggs/**,*.egg-info/**

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

" White characters
set autoindent
set tabstop=4
set softtabstop=4
set textwidth=79
set shiftwidth=4
set expandtab

let g:ycm_filetype_blacklist = {}

let g:syntastic_python_checkers = ['pylint', 'flake8']

"let g:pymode_lint_write = 0

" python.vim plugin
let python_highlight_all = 1
