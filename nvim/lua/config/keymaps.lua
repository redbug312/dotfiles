local map = vim.keymap.set

function custom(name)
  return function() require("config.keymaps")[name]() end
end

map('n', '<leader>yc', custom("toggle_colorcolumn"))
map('n', '<leader>yd', custom("toggle_docs"))
map('n', '<leader>yp', custom("toggle_paste"))
map('n', '<leader>yw', custom("toggle_wrap"))

map('n', '<f10>', '<cmd>let @+ = expand("%:p")<cr><cmd>echo "Copied: ".expand("%:p")<cr>')

map('n', '<leader>a', vim.lsp.buf.code_action)
map('n', '<leader>l', function() vim.diagnostic.open_float { border = 'single' } end)
map('n', '<leader>p', ':lua=')

-- MISCELLANEOUS

map('n', 'q:', '<nop>')
map('n', 'q', '<nop>')
map('n', 'Q', 'q')

map('n', 'K', vim.lsp.buf.hover)  -- better keyword lookup
map('n', 'Y', 'y$')  -- yank until end-of-line, recommended in help-doc
map('v', '/', '<esc>/\\%V')  -- search within range
map('n', '-', '$')  -- dollar sign is hard to reach
map('v', '-', '$')  -- dollar sign is hard to reach
map('n', '<c-c>', '<c-a>')  -- <c-a> is my tmux prefix key
map('n', 'g-', '<cmd>%s`\\s\\+$``e<cr><cmd>let @/="<<<<<<<"<cr>``')

-- NAVIGATE

map('n', '[l', custom("prev_diagnostic"))
map('n', ']l', custom("next_diagnostic"))

map('n', 'gD', vim.lsp.buf.declaration)
map('n', 'gd', vim.lsp.buf.definition)
map('n', '<c-]>', vim.lsp.buf.definition)

map('t', '<c-h>', '<c-\\><c-n><c-w>h')
map('t', '<c-j>', '<c-\\><c-n><c-w>j')
map('t', '<c-k>', '<c-\\><c-n><c-w>k')
map('t', '<c-l>', '<c-\\><c-n><c-w>l')
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')
map('v', '<c-h>', '<gv')
map('v', '<c-j>', 'xp`[V`]')
map('v', '<c-k>', 'xkP`[V`]')
map('v', '<c-l>', '>gv')

-- OTHER MODES

map('c', '<c-c>', '<esc>')
map('c', '<c-_>', '<cr>:%s`<C-r>/``gc<left><left><left>')
map('c', 'w!!', 'w !sudo tee % >/dev/null')

-- map('i', '<leader>flag', '⚑')
map('n', '<leader><leader>', '<esc><cmd>let @/="<<<<<<<"<cr>n')
map('v', '<leader><leader>', '<esc><cmd>let @/="<<<<<<<"<cr>n')
map('i', '<leader><leader>', '<esc><cmd>let @/="<<<<<<<"<cr>n')

-- <c-o>,yp to toggle paste mode
map('i', '<leader>print', '<c-g>uprintln!("{:?}", );<left><left><c-g>u')

map('i', '<leader>*', '<c-g>u<esc>[s1z=`]a<c-g>u')  -- fix last misspelled word
map('i', '<leader>"', '<c-r>')
map('i', '<leader>[', '<left>')
map('i', '<leader>]', '<right>')

local M = {}

function M.toggle_colorcolumn()
  local cc = vim.wo.colorcolumn
  vim.wo.colorcolumn = (cc ~= '81,82') and '81,82' or ''
end

function M.toggle_wrap()
  vim.opt.wrap = not vim.opt.wrap._value
end

function M.toggle_paste()
  vim.opt.paste = not vim.opt.paste._value
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
    float = { border = 'single' },
    cursor_position = { row - 1, 0 },
    severity = (next(errors) ~= nil) and diag.severity.ERROR or diag.severity.WARN
  }
end

function M.next_diagnostic()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local diag = vim.diagnostic
  local errors = diag.get(0, {
    severity = diag.severity.ERROR
  })
  diag.goto_next {
    float = { border = 'single' },
    cursor_position = { row + 1, 0 },
    severity = (next(errors) ~= nil) and diag.severity.ERROR or diag.severity.WARN
  }
end

return M
