local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    cmd 'packadd packer.nvim'
end

cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- SELF-CONTAINED
    use {'wbthomason/packer.nvim', opt=true}

    -- TREE-SITTER
    use {'nvim-treesitter/playground', after='nvim-treesitter'}
    use {'nvim-treesitter/nvim-treesitter-refactor', after='nvim-treesitter'}
    use {'nvim-treesitter/nvim-treesitter-textobjects', after='nvim-treesitter'}
    use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate', config=function()
        require 'treesitter'
    end}

    -- LANGUAGE-SERVER
    use {'neovim/nvim-lspconfig', config=function()
        local lsp = require 'lspconfig'
        lsp.pyls.setup {}
    end}
    use {'ojroques/nvim-lspfuzzy', requires={'junegunn/fzf', 'junegunn/fzf.vim'},
        after='nvim-lspconfig', run=':call fzf#install()', config=function()
        local lspfuzzy = require 'lspfuzzy'
        lspfuzzy.setup {}
    end}

    -- TELESCOPE
    use {'nvim-telescope/telescope.nvim', requires={'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}, config=function()
        local remap = vim.api.nvim_set_keymap
        local opts = { silent = true, noremap = true }
        remap('n', '<leader>ff', '<cmd>lua require"telescope.builtin".find_files()<cr>', opts)
        remap('n', '<leader>fg', '<cmd>lua require"telescope.builtin".live_grep()<cr>' , opts)
        remap('n', '<leader>fb', '<cmd>lua require"telescope.builtin".buffers()<cr>'   , opts)
        remap('n', '<leader>fh', '<cmd>lua require"telescope.builtin".help_tags()<cr>' , opts)
    end}

    -- COLORSCHEME
    use {'tjdevries/gruvbuddy.nvim', requires='tjdevries/colorbuddy.vim'}
    use {'/home/redbug312/.config/nvim/cactusbuddy',
        requires = {'tjdevries/colorbuddy.vim', 'glepnir/galaxyline.nvim'},
        config=function()
            vim.g.cactusbuddy_galaxyline_enabled = true
            require('colorbuddy').colorscheme('cactusbuddy')
        end
    }

    -- AUTO-COMPLETE
    use {'lifepillar/vim-mucomplete', config=function()
        vim.g['mucomplete#enable_auto_at_startup'] = 1
        vim.g['mucomplete#no_mappings'] = 1
        vim.g['mucomplete#spel#max'] = 5
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

end)
