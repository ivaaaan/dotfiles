function map(mode, lhs, rhs, opts)
    -- default options
    local options = { noremap = true }

    if opts then
        options = vim.tbl_extend('force', options, opts)
    end

    vim.keymap.set(mode, lhs, rhs, options)
end


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


-- LSP and Telescope mappings
map('n', 'gD', vim.lsp.buf.declaration)
map('n', 'gd', vim.lsp.buf.definition)
map('n', '<space>rn', vim.lsp.buf.rename)
map('n', '<space>ca', vim.lsp.buf.code_action)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

--fzf-lua
local fzflua = require("fzf-lua")

map('n', '<Leader>ff', fzflua.files)
map('n', '<Leader>fg', fzflua.live_grep_native)
map('n', '<Leader>gc', fzflua.git_bcommits)
map('n', '<Leader>wd', fzflua.lsp_document_symbols)
map('n', '<Leader>ww', fzflua.lsp_live_workspace_symbols)
map('n', '<Leader>m', fzflua.marks)
map('n', 'gr', fzflua.lsp_references)
map('n', 'gi', fzflua.lsp_implementations)
map('n', 'gR', fzflua.lsp_definitions)
map('n', '<Space>ca', fzflua.lsp_code_actions)
map('n', '<Leader>gb', fzflua.git_branches)
map('n', '<Leader>//', fzflua.resume)


map('n', '<Leader>gs', '<cmd> Git<CR>')
map('n', '<Leader>gp', '<cmd> Git push<CR>')
