-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local nvim_lsp = require('lspconfig')
local language_servers = {
	gopls = {
		gopls = {
			env = {
				GOFLAGS = "-tags=integration_test,unit_test"
			}
		},
	},
	clangd = {},
	terraformls = {},
	pyright = {},
}

for server, config in pairs(language_servers) do
	local cap = vim.lsp.protocol.make_client_capabilities()
	cap = require('cmp_nvim_lsp').default_capabilities(cap)
	nvim_lsp[server].setup(vim.tbl_deep_extend('force', {
		on_attach = on_attach,
		capabilities = cap,
		settings = config
	}, config))
end
