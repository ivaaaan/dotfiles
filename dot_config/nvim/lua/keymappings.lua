function map(mode, lhs, rhs, opts)
	-- default options
	local options = { noremap = true }

	if opts then
		options = vim.tbl_extend("force", options, opts)
	end

	vim.keymap.set(mode, lhs, rhs, options)
end

-- LSP and Telescope mappings
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gd", vim.lsp.buf.definition)
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

--fzf-lua
local fzflua = require("fzf-lua")

map("n", "<Leader>ff", fzflua.files)
map("n", "<Leader>fg", fzflua.live_grep_native)
map("n", "<Leader>gc", fzflua.git_bcommits)
map("n", "<Leader>wd", fzflua.lsp_document_symbols)
map("n", "<Leader>ww", fzflua.lsp_live_workspace_symbols)
map("n", "<Leader>xx", fzflua.lsp_workspace_diagnostics)
map("n", "T", fzflua.tabs)
map("n", "<Leader>m", fzflua.marks)
map("n", "gr", fzflua.lsp_references)
map("n", "gi", fzflua.lsp_implementations)
map("n", "gR", fzflua.lsp_definitions)
map("n", "<Space>ca", fzflua.lsp_code_actions)
map("n", "<Leader>gb", fzflua.git_branches)
map("n", "<Leader>gf", fzflua.git_files)
map("n", "<Leader>//", fzflua.resume)
map("n", "<Leader>gs", "<cmd> Git<CR>")
map("n", "<Leader>gp", "<cmd> Git push<CR>")
map("n", "<Space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")

map("n", "DH", "<cmd> DiffviewFileHistory %<cr>")
