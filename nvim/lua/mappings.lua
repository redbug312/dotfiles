local map = vim.api.nvim_set_keymap
local o = {
    none  = { silent = true, noremap = true  },
    remap = { silent = true, noremap = false },
}

map('n', '<leader>tfd', '<cmd>lua require"telescope.builtin".find_files()<cr>', o.none)
map('n', '<leader>trg', '<cmd>lua require"telescope.builtin".live_grep()<cr>' , o.none)
map('n', '<leader>tbf', '<cmd>lua require"telescope.builtin".buffers()<cr>'   , o.none)
map('n', '<leader>tht', '<cmd>lua require"telescope.builtin".help_tags()<cr>' , o.none)
