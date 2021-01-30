local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    cmd 'packadd packer.nvim'
end

cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt=true}

    -- COLORSCHEME
    use 'andreypopp/vim-colors-plain'
    use {'junegunn/seoul256.vim', config=function()
        vim.g.seoul256_background = 234
    end}

    -- LINTING
    use {'w0rp/ale', config=function()
        vim.g.ale_sign_column_always = 1
        vim.g.ale_sign_error = '×'
        vim.g.ale_sign_warning = '△'
        vim.g.ale_c_gcc_options = '-Iinclude'
        vim.g.ale_c_parse_makefile = 1
        vim.g.ale_python_flake8_options = '--ignore E501,E221,E241,E272'
        vim.g.ale_pattern_options = {['.java$'] = {ale_enabled = 0}}
        vim.g.ale_rust_cargo_check_tests = 1
    end}

    -- AUTO-COMPLETE
    use {'lifepillar/vim-mucomplete', config=function()
        vim.g['mucomplete#enable_auto_at_startup'] = 1
        vim.g['mucomplete#no_mappings'] = 1
        vim.g['mucomplete#spel#max'] = 5
    end}

    -- SYNTAX-HIGHLIHGT
    use {'sheerun/vim-polyglot', config=function()
        vim.g.vim_markdown_math = 1
        vim.g.vim_markdown_folding_disabled = 1
        vim.g.vim_markdown_new_list_item_indent = 0
        vim.g.csv_no_conceal = 1
    end}

    -- BRACKET-MATCHING
    use {'tpope/vim-sexp-mappings-for-regular-people', requires='guns/vim-sexp', config=function()
        vim.g.sexp_enable_insert_mode_mappings = 0
    end}
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'cohama/lexima.vim'

    -- MOTION & OBJECTS
    use 'tpope/vim-commentary'         -- gc
    use 'christoomey/vim-sort-motion'  -- gs
    use 'junegunn/vim-easy-align'      -- ga

    -- TAGS-GENERATION
    use {'ludovicchabant/vim-gutentags', config=function()
        vim.g.gutentags_project_root = {'.tags'}
        vim.g.gutentags_ctags_tagfile = '.tags'
        vim.g.gutentags_file_list_command = {
            markers = { ['.git'] = 'git ls-files', ['.hg']  = 'hg files' }
        }
    end}

    -- MISCELLANEOUS
    use 'wakatime/vim-wakatime'
    use 'derekwyatt/vim-fswitch'

    -- USER-INTERFACE
    use 'kshenoy/vim-signature'
    use {'airblade/vim-gitgutter', config=function()
        vim.g.gitgutter_map_keys = 0
    end}

    use {'scrooloose/nerdtree', config=function()
        vim.g.NERDTreeBookmarksFile = vim.fn.stdpath'data'..'/nerdtree'
        vim.g.NERDTreeShowBookmarks = 1
        vim.g.NERDTreeNaturalSort = 1
        vim.g.NERDTreeChDirMode = 2
        vim.g.NERDTreeDirArrowExpandable = '▶'
        vim.g.NERDTreeDirArrowCollapsible = '▼'
    end}
    use {'Xuyuanp/nerdtree-git-plugin', after='nerdtree', config=function()
        vim.g.NERDTreeGitStatusIndicatorMapCustom = {
            Modified  = '~',
            Staged    = '*',
            Untracked = '+',
            Renamed   = ':',
            Unmerged  = '!',
            Deleted   = '-',
            Dirty     = '×',
            Unknown   = '?',
        }
    end}

    use {'lvht/tagbar-markdown', after='tagbar'}
    use {'majutsushi/tagbar', config=function()
        vim.g.tagbar_autofocus = 1
        vim.g.tagbar_sort = 0
    end}

    -- TODO other status line plugin?
    use {'itchyny/lightline.vim', run=function()
        local dir = vim.fn.stdpath('data')..
            '/site/pack/packer/start/lightline.vim/autoload/lightline/colorscheme/'
        local file = vim.fn.stdpath('config')..'/road.vim'
        vim.cmd(string.format('!cp %s %s', file, dir))
    end, config=function()
        vim.g['lightline'] = {
            colorscheme = 'road',
            subseparator = { left = '', right = '\\ue0b3' },
            component = { readonly = '[%R]', modified = '[%M]' },
        }
    end}

end)
