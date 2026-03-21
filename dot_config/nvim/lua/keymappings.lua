local map = require("utils").map

-- LSP and Telescope mappings
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gt", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", {})

map("n", "<space>rn", vim.lsp.buf.rename)
map("n", "<space>ca", vim.lsp.buf.code_action)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)

vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end)
vim.keymap.set("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end)
vim.keymap.set("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end)
vim.keymap.set("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end)
vim.keymap.set("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end)

map("n", "<Leader>gs", "<cmd> Git<CR>")
map("n", "<Leader>gp", "<cmd> Git push<CR>")
map("n", "<Space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")

map("n", "DH", "<cmd> DiffviewFileHistory %<cr>")
map("n", "DC", "<cmd> DiffviewClose<cr>")
map("n", "DO", "<cmd> DiffviewOpen<cr>")
