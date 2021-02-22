local map = vim.api.nvim_set_keymap
local o = {
  none   = { expr = false, noremap = true,  nowait = false },
  expr   = { expr = true,  noremap = true,  nowait = false },
  remap  = { expr = false, noremap = false, nowait = false },
  nowait = { expr = false, noremap = true,  nowait = true  },
}

map('n', '<leader>fa', '<cmd>lua require"telescope.builtin".builtin()<cr>', o.none)
map('n', '<leader>fb', '<cmd>lua require"telescope.builtin".buffers{show_all_buffers = true}<cr>', o.none)
map('n', '<leader>ff', '<cmd>lua require"telescope.builtin".find_files()<cr>', o.none)
map('n', '<leader>fg', '<cmd>lua require"telescope.builtin".live_grep()<cr>', o.none)
map('n', '<leader>fh', '<cmd>lua require"telescope.builtin".help_tags()<cr>', o.none)
map('n', '<leader>fo', '<cmd>lua require"telescope.builtin".oldfiles()<cr>', o.none)
map('n', '<leader>fp', '<cmd>lua require"telescope".extensions.project.project{change_dir = true}<cr>', o.none)
map('n', '<leader>fq', '<cmd>lua require"telescope.builtin".quickfix()<cr>', o.none)

-- TODO explicitly define gitsigns mappings

map('n', '<leader>yh', '<cmd>lua require"nvim-tree".toggle()<cr>', o.none)
map('n', '<leader>yl', '<cmd>TagbarToggle<cr>', o.none)

map('n', '<leader>c', '<cmd>lua require"mappings".synstack()<cr>', o.none)
map('n', '<leader>t', '<cmd>lua require"mappings".train()<cr>', o.none)
map('n', '<leader>p', ':lua print(vim.inspect(  ))<left><left><left>', o.none)

map('n', '<leader>a', '<plug>(EasyAlign)', o.remap)
map('v', '<leader>a', '<plug>(EasyAlign)', o.remap)
map('n', '<leader>-', '<cmd>%s`\\s\\+$``e<cr>``', o.none)

-- FN SHORTCUTS

map('n', '<f3>', '<cmd>lua require"gitsigns".blame_line()<cr>', o.none)
map('n', '<f4>', '<cmd>lua require"gitsigns".preview_hunk()<cr>', o.none)
map('n', '<f5>', '<cmd>wa<cr><cmd>make build<cr>', o.none)
map('n', '<f6>', '<cmd>wa<cr><cmd>make start<cr>', o.none)
map('n', '<f7>', '<cmd>wa<cr><cmd>make debug<cr>', o.none)
map('n', '<f8>', '<cmd>wa<cr><cmd>make check<cr>', o.none)
map('n', '<f9>', '<cmd>vsplit term://fish<cr>A', o.none)
map('n', '<f10>', '<cmd>let @+ = expand("%:p")<cr><cmd>echo "Copied: ".expand("%:p")<cr>', o.none)

-- MISCELLANEOUS

map('n', 'q:', '<nop>', o.none)
map('n', 'q', '<nop>', o.none)
map('n', 'Q', 'q', o.none)

map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', o.none)  -- better keyword lookup
map('n', 'Y', 'y$', o.none)  -- yank to end-of-line, suggested in help-doc
map('v', '/', '<esc>/\\%V', o.none)  -- search within range
map('n', '-', '$', o.none)  -- dollar sign is hard to reach
map('n', '<c-c>', '<c-a>', o.none)  -- <c-a> is tmux prefix key now

-- NAVIGATE

map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', o.none)
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', o.none)

map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', o.none)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', o.none)

map('t', '<c-h>', '<c-\\><c-n><c-w>h', o.none)
map('t', '<c-j>', '<c-\\><c-n><c-w>j', o.none)
map('t', '<c-k>', '<c-\\><c-n><c-w>k', o.none)
map('t', '<c-l>', '<c-\\><c-n><c-w>l', o.none)
map('n', '<c-h>', '<c-w>h', o.none)
map('n', '<c-j>', '<c-w>j', o.none)
map('n', '<c-k>', '<c-w>k', o.none)
map('n', '<c-l>', '<c-w>l', o.none)
map('v', '<c-h>', '<gv', o.none)
map('v', '<c-j>', 'xp`[V`]', o.none)
map('v', '<c-k>', 'xkP`[V`]', o.none)
map('v', '<c-l>', '>gv', o.none)
map('v', '<c-l>', '>gv', o.none)

-- OTHER MODES

map('c', '<c-c>', '<esc>', o.none)
map('c', '<c-_>', '<cr>:%s`<C-r>/``gc<left><left><left>', o.none)
map('c', 'w!!', 'w !sudo tee % >/dev/null', o.none)

map('i', '<leader>flag', '⚑', o.none)
map('n', '<leader><leader>', '<esc><cmd>let @/="⚑"<cr>ncl', o.none)
map('v', '<leader><leader>', '<esc><cmd>let @/="⚑"<cr>ncl', o.none)
map('i', '<leader><leader>', '<esc><cmd>let @/="⚑"<cr>ncl', o.none)

map('i', '<leader>*', '<c-g>u<esc>[s1z=`]a<c-g>u', o.none)
map('i', '<leader>"', '<c-r>', o.none)
map('i', '<leader>[', '<left>', o.none)
map('i', '<leader>]', '<right>', o.none)

map('i', '<c-w>',   '<c-\\><c-O>db', o.none)
map('i', '<Tab>',   'pumvisible() ? "\\<C-n>" : "\\<Tab>"', o.expr)
map('i', '<s-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', o.expr)

-- FUNCTIONS

local M = {}

function M.synstack()
  if pcall(vim.treesitter.get_parser, 0) then
    local playground = require 'nvim-treesitter-playground.hl-info'
    playground.show_hl_captures()
  end

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local synstack = vim.fn.synstack(row, col)
  local groups = vim.fn.map(synstack, 'synIDattr(v:val, "name")')
  print(vim.inspect(groups))

  local syntax = vim.fn.synID(row, col+1, 1)
  local target = vim.fn.synIDtrans(syntax)
  if syntax ~= 0 then
    vim.cmd('hi '..vim.fn.synIDattr(syntax, 'name'))
  end
  if target ~= 0 then
    vim.cmd('hi '..vim.fn.synIDattr(target, 'name'))
  end
end

function M.train()
  local training = require 'train'
  local movements = {
    '(',  ')',  '{',  '}',
    '[[', ']]', '[]', '][', '[(', '])', '[{', ']}',
    '[m', ']m', '[M', ']M', '[#', ']#', '[/', ']/',
  }
  training.show_matches(movements)
end

return M
