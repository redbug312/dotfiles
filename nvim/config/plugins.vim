call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-dispatch'
Plug 'severin-lemaignan/vim-minimap'
let g:minimap_highlight='Visual'

" COLORSCHEME
Plug 'andreypopp/vim-colors-plain'
Plug 'cocopon/iceberg.vim'
Plug 'vim-scripts/AfterColors.vim'

" LINTING
Plug 'w0rp/ale'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '×'
let g:ale_sign_warning = '△'
" let g:ale_python_flake8_options = '--ignore E127,E221,E501,E731'
let g:ale_python_flake8_options = '--ignore E501,E221,E241,E272'
let g:ale_c_gcc_options = '-Iinclude'
let g:ale_javascript_eslint_executable = '~/.local/share/npm/bin/eslint'
let g:ale_pattern_options = {'\.java$': {'ale_enabled': 0}}
let g:ale_rust_cargo_check_tests = 1

" AUTO-COMPLETE
Plug 'lifepillar/vim-mucomplete'
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#no_mappings = 1
let g:mucomplete#spel#max = 5
imap <TAB>   <Plug>(MUcompleteFwd)
imap <S-TAB> <Plug>(MUcompleteBwd)
set completeopt+=menuone,noselect,noinsert
set shortmess+=c

" SYNTAX-HIGHLIGHT
Plug 'sheerun/vim-polyglot', {'commit': '43085dc'}
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0
let g:csv_no_conceal = 1

" BRACKET-MATCHING
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'cohama/lexima.vim'
let g:sexp_enable_insert_mode_mappings = 0

" MOTION & TEXTOBJS
Plug 'tpope/vim-commentary'             " gc
Plug 'christoomey/vim-sort-motion'      " gs
Plug 'junegunn/vim-easy-align'          " ga
Plug 'vim-scripts/ReplaceWithRegister'  " gr

Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'    " ab ib
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-indent'    " ai ii
Plug 'kana/vim-textobj-user' | Plug 'sgur/vim-textobj-parameter' " aa ia
let g:vim_textobj_parameter_mapping = 'a'
omap ab <Plug>(textobj-entire-a)
omap ib <Plug>(textobj-entire-i)
xmap ab <Plug>(textobj-entire-a)
xmap ib <Plug>(textobj-entire-i)

" TAGS-GENERATION
Plug 'ludovicchabant/vim-gutentags', {'commit': 'eb9e57f'}
let g:gutentags_project_root = ['.tags']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_file_list_command = {
    \ 'markers': {
    \   '.git': 'git ls-files',
    \   '.hg': 'hg files', }, }

" MISCELLANEOUS
Plug 'wakatime/vim-wakatime'
Plug 'derekwyatt/vim-fswitch'

" USER-INTERFACE
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0

" Plug 'Shougo/defx.nvim'
" Plug 'kristijanhusak/defx-git'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeBookmarksFile = $HOME.'/.config/nvim/nerdtree'
let g:NERDTreeIndicatorMapCustom = {
    \ 'Modified' : '~',
    \ 'Staged'   : '*',
    \ 'Untracked': '+',
    \ 'Renamed'  : ':',
    \ 'Unmerged' : '!',
    \ 'Deleted'  : '-',
    \ 'Dirty'    : '×',
    \ 'Unknown'  : '?', }

Plug 'majutsushi/tagbar'
Plug 'tenfyzhong/tagbar-markdown.vim'
let g:tagbar_autofocus = 1

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
let g:lightline#ale#indicator_warnings = ' △'
let g:lightline#ale#indicator_errors = '×'
let g:lightline#ale#indicator_ok = '■'
let g:lightline = {}
let g:lightline.colorscheme = 'road'
let g:lightline.subseparator = { 'left': "", 'right': "\ue0b3" }
let g:lightline.active = {
    \   'right': [['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'lineinfo'],
    \             ['percent'],
    \             ['fileformat', 'fileencoding', 'filetype']], }
let g:lightline.inactive = {
    \   'left': [[], ['filename', 'modified']],
    \   'right': [], }
let g:lightline.component = {
    \   'readonly': '[%R]',
    \   'modified': '[%M]', }
let g:lightline.component_expand = {
    \   'linter_checking': 'lightline#ale#checking',
    \   'linter_warnings': 'lightline#ale#warnings',
    \   'linter_errors': 'lightline#ale#errors',
    \   'linter_ok': 'lightline#ale#ok', }
let g:lightline.component_type = {
    \   'readonly': 'warning',
    \   'linter_checking': 'left',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'left', }

call plug#end()
