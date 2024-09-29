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
			 analyses = {
				unusedparams = true,
			 },
			 staticcheck = true,
			 gofumpt = true,
			 buildFlags =  {"-tags=integration"}

		},
	},
	clangd = {},
	terraformls = {},
	pyright = {},
	texlab = {},
	["ts_ls"] = {},
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

local capabilities = require('cmp_nvim_lsp').default_capabilities({
	workspace = {
		didChangeWatchedFiles = {
			dynamicRegistration = true
		}
	},
})
for server, config in pairs(language_servers) do
	local config = vim.tbl_deep_extend('force', {
		on_attach = on_attach,
		settings = config,
		capabilities = capabilities
	}, config)
	nvim_lsp[server].setup(config)
end

require("luasnip.loaders.from_vscode").lazy_load()
