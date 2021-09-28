local map = vim.api.nvim_set_keymap
local o = {
  none   = { expr = false, noremap = true,  nowait = false },
  expr   = { expr = true,  noremap = true,  nowait = false },
  remap  = { expr = false, noremap = false, nowait = false },
  nowait = { expr = false, noremap = true,  nowait = true  },
}

map('n', '<leader>fa', '<cmd>lua require"telescope.builtin".builtin()<cr>', o.none)
map('n', '<leader>fb', '<cmd>lua require"telescope.builtin".buffers{show_all_buffers = true}<cr>', o.none)
map('n', '<leader>fc', '<cmd>lua require"telescope.builtin".command_history()<cr>', o.none)
map('n', '<leader>ff', '<cmd>lua require"telescope.builtin".find_files()<cr>', o.none)
map('n', '<leader>fg', '<cmd>lua require"telescope.builtin".live_grep()<cr>', o.none)
map('n', '<leader>fh', '<cmd>lua require"telescope.builtin".help_tags()<cr>', o.none)
map('n', '<leader>fl', '<cmd>lua require"telescope.builtin".lsp_workspace_diagnostics()<cr>', o.none)
map('n', '<leader>fm', '<cmd>lua require"telescope.builtin".marks()<cr>', o.none)
map('n', '<leader>fo', '<cmd>lua require"telescope.builtin".oldfiles()<cr>', o.none)
map('n', '<leader>fp', '<cmd>lua require"telescope".extensions.project.project{change_dir = true}<cr>', o.none)
map('n', '<leader>fr', '<cmd>lua require"telescope.builtin".lsp_references()<cr>', o.none)
map('n', '<leader>fs', '<cmd>lua require"telescope".extensions.aerial.aerial()<cr>', o.none)

-- TODO explicitly define gitsigns mappings

map('n', '<leader>yh', '<cmd>lua require"nvim-tree".toggle()<cr>', o.none)
map('n', '<leader>yl', '<cmd>lua require"aerial".toggle()<cr>', o.none)
map('n', '<leader>yc', '<cmd>lua require"mappings".toggle_colorcolumn()<cr>', o.none)
map('n', '<leader>yp', '<cmd>lua require"mappings".toggle_paste()<cr>', o.none)

map('n', '<leader>sn', '<cmd>TSTextobjectSwapNext @parameter.inner<cr>', o.none)
map('n', '<leader>sp', '<cmd>TSTextobjectSwapPrevious @parameter.inner<cr>', o.none)

map('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<cr>', o.none)
map('n', '<leader>dc', '<cmd>lua require"dap".continue()<cr>', o.none)
map('n', '<leader>ddb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints()<cr>', o.none)
map('n', '<leader>ddf', '<cmd>lua require"telescope".extensions.dap.frames()<cr>', o.none)
map('n', '<leader>ddv', '<cmd>lua require"telescope".extensions.dap.variables()<cr>', o.none)
map('n', '<leader>df', '<cmd>lua require"dap".step_out()<cr>', o.none)
map('n', '<leader>dn', '<cmd>lua require"dap".step_over()<cr>', o.none)
map('n', '<leader>dq', '<cmd>lua require"dap".close()<cr>', o.none)
map('n', '<leader>dr', '<cmd>lua require"dap".repl.toggle()<cr>', o.none)
map('n', '<leader>ds', '<cmd>lua require"dap".step_into()<cr>', o.none)

map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>', o.none)
map('n', '<leader>c', '<cmd>lua require"mappings".synstack()<cr>', o.none)
map('n', '<leader>l', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', o.none)
map('n', '<leader>t', '<cmd>lua require"mappings".train()<cr>', o.none)
map('n', '<leader>p', ':lua print(vim.inspect(  ))<left><left><left>', o.none)

map('n', 'ga', '<plug>(EasyAlign)', o.remap)
map('v', 'ga', '<plug>(EasyAlign)', o.remap)
map('n', 'g-', '<cmd>%s`\\s\\+$``e<cr>``', o.none)

-- FN SHORTCUTS

map('n', '<f3>', '<cmd>lua require"gitsigns".blame_line()<cr>', o.none)
map('n', '<f4>', '<cmd>lua require"gitsigns".preview_hunk()<cr>', o.none)
map('n', '<f5>', '<cmd>wa<cr><cmd>lua require"FTerm".open()<cr><c-u>make build<cr>', o.none)
map('n', '<f6>', '<cmd>wa<cr><cmd>lua require"FTerm".open()<cr><c-u>make start<cr>', o.none)
map('n', '<f7>', '<cmd>wa<cr><cmd>lua require"FTerm".open()<cr><c-u>make debug<cr>', o.none)
map('n', '<f8>', '<cmd>wa<cr><cmd>lua require"FTerm".open()<cr><c-u>make check<cr>', o.none)
map('n', '<f9>', '<cmd>lua require"FTerm".open()<cr>', o.none)
map('n', '<f10>', '<cmd>let @+ = expand("%:p")<cr><cmd>echo "Copied: ".expand("%:p")<cr>', o.none)

map('t', '<f5>', '<c-\\><c-n><cmd>wa<cr>a<c-u>make build<cr>', o.none)
map('t', '<f6>', '<c-\\><c-n><cmd>wa<cr>a<c-u>make start<cr>', o.none)
map('t', '<f7>', '<c-\\><c-n><cmd>wa<cr>a<c-u>make debug<cr>', o.none)
map('t', '<f8>', '<c-\\><c-n><cmd>wa<cr>a<c-u>make check<cr>', o.none)
map('t', '<f9>', '<c-\\><c-n><cmd>lua require"FTerm".toggle()<cr>', o.none)

-- MISCELLANEOUS

map('n', 'q:', '<nop>', o.none)
map('n', 'q', '<nop>', o.none)
map('n', 'Q', 'q', o.none)

map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', o.none)  -- better keyword lookup
map('n', 'Y', 'y$', o.none)  -- yank until end-of-line, recommended in help-doc
map('v', '/', '<esc>/\\%V', o.none)  -- search within range
map('n', '-', '$', o.none)  -- dollar sign is hard to reach
map('v', '-', '$', o.none)  -- dollar sign is hard to reach
map('n', '<c-c>', '<c-a>', o.none)  -- <c-a> is my tmux prefix key

-- NAVIGATE

map('n', '[l', '<cmd>lua require"mappings".prev_diagnostic()<cr>', o.none)
map('n', ']l', '<cmd>lua require"mappings".next_diagnostic()<cr>', o.none)
map('n', '[h', '<cmd>lua require"gitsigns".prev_hunk()<cr>', o.none)
map('n', ']h', '<cmd>lua require"gitsigns".next_hunk()<cr>', o.none)
map('n', '[s', '<cmd>lua require"aerial".prev_item()<cr>', o.none)
map('n', ']s', '<cmd>lua require"aerial".next_item()<cr>', o.none)

map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', o.none)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', o.none)
map('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<cr>', o.none)

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

-- OTHER MODES

map('c', '<c-c>', '<esc>', o.none)
map('c', '<c-_>', '<cr>:%s`<C-r>/``gc<left><left><left>', o.none)
map('c', 'w!!', 'w !sudo tee % >/dev/null', o.none)

map('i', '<leader>flag', '⚑', o.none)
map('n', '<leader><leader>', '<esc><cmd>let @/="<<<<<<<"<cr>n', o.none)
map('v', '<leader><leader>', '<esc><cmd>let @/="<<<<<<<"<cr>n', o.none)
map('i', '<leader><leader>', '<esc><cmd>let @/="<<<<<<<"<cr>n', o.none)

-- <c-o>,yp to toggle paste mode
map('i', '<leader>dbg', 'println!<c-o>,yp("{:?}", &);<c-o>T&<c-o>,yp', o.remap)

map('i', '<leader>*', '<c-g>u<esc>[s1z=`]a<c-g>u', o.none)
map('i', '<leader>"', '<c-r>', o.none)
map('i', '<leader>[', '<left>', o.none)
map('i', '<leader>]', '<right>', o.none)

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
  local synstack = vim.fn.synstack(row, col + 1)
  local groups = vim.fn.map(synstack, 'synIDattr(v:val, "name")')
  print(vim.inspect(groups))

  local syntax = vim.fn.synID(row, col + 1, 1)
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

function M.toggle_colorcolumn()
  local cc = vim.wo.colorcolumn
  vim.wo.colorcolumn = (cc ~= '80,81') and '80,81' or ''
end

function M.toggle_paste()
  vim.o.paste = not vim.o.paste
end

function M.prev_diagnostic()
  local enabled = #vim.lsp.buf_get_clients(0) ~= 0
  if not enabled then
    return nil
  end

  local _, client = next(vim.lsp.buf_get_clients(0))
  local counts = {
    error = vim.lsp.diagnostic.get_count(0, 'Error', client.id),
  }

  vim.lsp.diagnostic.goto_prev {
    severity_limit = (counts.error > 0) and 'Error' or 'Warning'
  }
end

function M.next_diagnostic()
  local enabled = #vim.lsp.buf_get_clients(0) ~= 0
  if not enabled then
    return nil
  end

  local _, client = next(vim.lsp.buf_get_clients(0))
  local counts = {
    error = vim.lsp.diagnostic.get_count(0, 'Error', client.id),
  }

  vim.lsp.diagnostic.goto_next {
    severity_limit = (counts.error > 0) and 'Error' or 'Warning'
  }
end

return M
