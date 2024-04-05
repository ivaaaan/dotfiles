local coq = require('coq')

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
	texlab = {},
	["rust_analyzer"] = {
	    imports = {
		granularity = {
		    group = "module",
		},
		prefix = "self",
	    },
	    cargo = {
		buildScripts = {
		    enable = true,
		},
	    },
	    procMacro = {
		enable = true
	    },
	}
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
for server, config in pairs(language_servers) do
	local config = vim.tbl_deep_extend('force', {
		on_attach = on_attach,
		settings = config,
		capabilities = capabilities
	}, config)
	-- nvim_lsp[server].setup(coq.lsp_ensure_capabilities(config))
	nvim_lsp[server].setup(config)
end
