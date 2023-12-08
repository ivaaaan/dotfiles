function map(mode, lhs, rhs, opts)
    -- default options
    local options = { noremap = true }

    if opts then
        options = vim.tbl_extend('force', options, opts)
    end

    vim.keymap.set(mode, lhs, rhs, options)
end

local telescope = require('telescope')
local tbuiltin = require('telescope.builtin')

map('n', '<F4>', require('dapui').toggle)
map('n', '<F5>', require('dap').toggle_breakpoint)
map('n', '<F9>', require('dap').continue)

map('n', '<F1>', require('dap').step_over)
map('n', '<F2>', require('dap').step_into)
map('n', '<F3>', require('dap').step_out)

map('n', '<Leader>dsc', require('dap').continue)
map('n', '<Leader>dsv', require('dap').step_over)
map('n', '<Leader>dsi', require('dap').step_into)
map('n', '<Leader>dso', require('dap').step_out)

map('n', '<Leader>duf', function() 
  require('dap.ui.widgets').centered_float(widgets.scopes)
end)


map('n', '<Leader>dbc', function()
  require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) 
end)
map('n', '<Leader>dbm', function() 
  require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) 
end)
map('n', '<Leader>dbt', require('dap').toggle_breakpoint)

map('n', '<Leader>di', require('dapui').toggle)

map('v', '<Leader>rr', telescope.extensions.refactoring.refactors)

-- LSP and Telescope mappings
map('n', 'gD', vim.lsp.buf.declaration)
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gr', tbuiltin.lsp_references)
map('n', 'gi', tbuiltin.lsp_implementations)
map('n', '<space>rn', vim.lsp.buf.rename)
map('n', '<space>ca', vim.lsp.buf.code_action)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)

