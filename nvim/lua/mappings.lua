local map = vim.keymap.set
local o = {
  none   = { expr = false, noremap = true,  nowait = false },
  expr   = { expr = true,  noremap = true,  nowait = false },
  remap  = { expr = false, noremap = false, nowait = false },
  nowait = { expr = false, noremap = true,  nowait = true  },
}

map('n', '<leader>fa', require'telescope.builtin'.builtin, o.none)
map('n', '<leader>fb', require'telescope.builtin'.buffers, o.none)
map('n', '<leader>ff', require'telescope.builtin'.find_files, o.none)
map('n', '<leader>fg', require'telescope.builtin'.live_grep, o.none)
map('n', '<leader>fh', require'telescope.builtin'.highlights, o.none)
map('n', '<leader>fl', require'telescope.builtin'.diagnostics, o.none)
map('n', '<leader>fm', require'telescope.builtin'.marks, o.none)
map('n', '<leader>fo', require'telescope.builtin'.oldfiles, o.none)
map('n', '<leader>fp', require'telescope'.extensions.project.project, o.none)
map('n', '<leader>fr', require'telescope.builtin'.lsp_references, o.none)
map('n', '<leader>fs', require'telescope'.extensions.aerial.aerial, o.none)

map('n', '<leader>hs', require'gitsigns'.stage_hunk, o.none)
map('n', '<leader>hr', require'gitsigns'.reset_hunk, o.none)
map('n', '<leader>hu', require'gitsigns'.undo_stage_hunk, o.none)

map('n', '<leader>yb', require'gitsigns'.toggle_current_line_blame, o.none)
map('n', '<leader>yc', function() require'mappings'.toggle_colorcolumn() end, o.none)
map('n', '<leader>yd', function() require'mappings'.toggle_docs() end, o.none)
map('n', '<leader>yg', require'gitsigns'.toggle_deleted, o.none)
map('n', '<leader>yh', require'nvim-tree'.toggle, o.none)
map('n', '<leader>yl', require'aerial'.toggle, o.none)
map('n', '<leader>yp', function() require'mappings'.toggle_paste() end, o.none)
map('n', '<leader>yw', function() require'mappings'.toggle_wrap() end, o.none)

map('n', '<leader>sn', '<cmd>TSTextobjectSwapNext @parameter.inner<cr>', o.none)
map('n', '<leader>sp', '<cmd>TSTextobjectSwapPrevious @parameter.inner<cr>', o.none)

map('n', '<leader>db', require'dap'.toggle_breakpoint, o.none)
map('n', '<leader>dc', require'dap'.continue, o.none)
map('n', '<leader>ddb', require'telescope'.extensions.dap.list_breakpoints, o.none)
map('n', '<leader>ddf', require'telescope'.extensions.dap.frames, o.none)
map('n', '<leader>ddv', require'telescope'.extensions.dap.variables, o.none)
map('n', '<leader>df', require'dap'.step_out, o.none)
map('n', '<leader>dn', require'dap'.step_over, o.none)
map('n', '<leader>dq', require'dap'.close, o.none)
map('n', '<leader>dr', require'dap'.repl.toggle, o.none)
map('n', '<leader>ds', require'dap'.step_into, o.none)

map('n', '<leader>a', vim.lsp.buf.code_action, o.none)
map('n', '<leader>c', function() require'mappings'.synstack() end, o.none)
map('n', '<leader>l', function() vim.diagnostic.open_float{border='single'} end, o.none)
map('n', '<leader>t', function() require'mappings'.train() end, o.none)
map('n', '<leader>p', ':lua=', o.none)

map('n', 'ga', '<plug>(EasyAlign)', o.remap)
map('v', 'ga', '<plug>(EasyAlign)', o.remap)
map('n', 'g-', '<cmd>%s`\\s\\+$``e<cr>``', o.none)

-- FN SHORTCUTS

map('n', '<f3>', require'gitsigns'.blame_line, o.none)
map('n', '<f4>', require'gitsigns'.preview_hunk, o.none)
map('n', '<f5>', function() require'FTerm'.scratch{cmd='make build'} end, o.none)
map('n', '<f6>', function() require'FTerm'.scratch{cmd='make start'} end, o.none)
map('n', '<f7>', function() require'FTerm'.scratch{cmd='make debug'} end, o.none)
map('n', '<f8>', function() require'FTerm'.scratch{cmd='make check'} end, o.none)
map('n', '<f9>', require'FTerm'.open, o.none)
map('n', '<f10>', '<cmd>let @+ = expand("%:p")<cr><cmd>echo "Copied: ".expand("%:p")<cr>', o.none)

map('t', '<f5>', function() require'FTerm'.run'make build' end, o.none)
map('t', '<f6>', function() require'FTerm'.run'make start' end, o.none)
map('t', '<f7>', function() require'FTerm'.run'make debug' end, o.none)
map('t', '<f8>', function() require'FTerm'.run'make check' end, o.none)
map('t', '<f9>', require'FTerm'.toggle, o.none)

-- MISCELLANEOUS

map('n', 'q:', '<nop>', o.none)
map('n', 'q', '<nop>', o.none)
map('n', 'Q', 'q', o.none)

                 vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                   vim.lsp.handlers.hover, {
                     -- Use a sharp border with `FloatBorder` highlights
                     border = "single"
                   }
                 )

map('n', 'K', vim.lsp.buf.hover, o.none)  -- better keyword lookup
map('n', 'Y', 'y$', o.none)  -- yank until end-of-line, recommended in help-doc
map('v', '/', '<esc>/\\%V', o.none)  -- search within range
map('n', '-', '$', o.none)  -- dollar sign is hard to reach
map('v', '-', '$', o.none)  -- dollar sign is hard to reach
map('n', '<c-c>', '<c-a>', o.none)  -- <c-a> is my tmux prefix key

-- NAVIGATE

map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<cr>'", o.expr)
map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<cr>'", o.expr)
map('n', '[l', function() require'mappings'.prev_diagnostic() end, o.none)
map('n', ']l', function() require'mappings'.next_diagnostic() end, o.none)
map('n', '[h', require'gitsigns'.prev_hunk, o.none)
map('n', ']h', require'gitsigns'.next_hunk, o.none)
map('n', '[s', function() require'aerial'.next(-1) end, o.none)
map('n', ']s', function() require'aerial'.next(1) end, o.none)

map('n', 'gD', vim.lsp.buf.declaration, o.none)
map('n', 'gd', vim.lsp.buf.definition, o.none)
map('n', '<c-]>', vim.lsp.buf.definition, o.none)

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
map('i', '<leader>print', '<c-g>uprintln!("{:?}", );<left><left><c-g>u', o.none)

map('i', '<leader>*', '<c-g>u<esc>[s1z=`]a<c-g>u', o.none)  -- fix last misspelled word
map('i', '<leader>"', '<c-r>', o.none)
map('i', '<leader>[', '<left>', o.none)
map('i', '<leader>]', '<right>', o.none)

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
  vim.wo.colorcolumn = (cc ~= '81,82') and '81,82' or ''
end

function M.toggle_wrap()
  vim.o.wrap = not vim.o.wrap
end

function M.toggle_paste()
  vim.o.paste = not vim.o.paste
end

function M.toggle_docs()
  local colorbuddy = require('colorbuddy')
  local Color, c, Group, g, s = colorbuddy.setup()
  if g["@string.docstring"].parent.name == 'darker' then
    Group.new('@string.docstring', c.blue, c.none, s.none)
  else
    Group.new('@string.docstring', c.darker, c.none, s.none)
  end
end

function M.prev_diagnostic()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local diag = vim.diagnostic
  local errors = diag.get(0, {
    severity = diag.severity.ERROR
  })
  diag.goto_prev {
    float = {border = 'single'},
    cursor_position = {row - 1, 0},
    sevirity = (next(errors) ~= nil) and diag.ERROR or diag.WARN
  }
end

function M.next_diagnostic()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local diag = vim.diagnostic
  local errors = diag.get(0, {
    severity = diag.severity.ERROR
  })
  diag.goto_next {
    float = {border = 'single'},
    cursor_position = {row + 1, 0},
    sevirity = (next(errors) ~= nil) and diag.ERROR or diag.WARN
  }
end

return M
