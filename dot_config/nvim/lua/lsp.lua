-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

local language_servers = {
	gopls = {
	   filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
	   gopls = {
	      analyses = {
		unusedparams = true,
	      },
	      staticcheck = true,
	      gofumpt = true,
	    },
    	},
	clangd = {},
	terraformls = {},
	basedpyright = {
		settings = {
			basedpyright = {
				analysis = {
				  typeCheckingMode = "basic",
				},
			},
		}
	},
	texlab = {},
	["ts_ls"] = {},
	html = {
		format = {
			templating = true,
			wrapLineLength = 120,
			wrapAttributes = "auto",
		},
		hover = {
			documentation = true,
			references = true,
		},
	},
	yamlls = {
	  yaml = {
	    validate = true,
	    schemaStore = {
	      enable = true,
	      url = "https://www.schemastore.org/api/json/catalog.json",
	    },
	  },
	},
}

local ls = require("luasnip")

ls.filetype_extend("javascript", { "javascriptreact", "typescriptreact" })
ls.filetype_extend("go", { "go" })

require("luasnip.loaders.from_vscode").lazy_load()

require("blink.cmp").setup({
    keymap = {
        preset = 'default' ,
	['<CR>'] = {'accept', 'fallback'},
	['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
	['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
	['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },
    completion = { documentation = { auto_show = true } },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    snippets = { preset = 'luasnip'},
    signature = { enabled = true }

})

for server, config in pairs(language_servers) do
	local config = vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		settings = config,
	}, config)
	vim.lsp.config(server, config)
	vim.lsp.enable(server)
end



require("luasnip.loaders.from_vscode").lazy_load()
