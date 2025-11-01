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
		gopls = {
			buildFlags = { "-tags=integration" },
		},
	},
	clangd = {},
	terraformls = {},
	basedpyright = {},
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
			enable = true,
		},
	},
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
}

 -- local cmp = require'cmp'

  -- cmp.setup({
  --   snippet = {
  --     expand = function(args)
  --       require('luasnip').lsp_expand(args.body) 
  --     end,
  --   },
  --   window = {
  --     -- completion = cmp.config.window.bordered(),
  --     -- documentation = cmp.config.window.bordered(),
  --   },
  --   mapping = cmp.mapping.preset.insert({
  --     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  --     ['<C-f>'] = cmp.mapping.scroll_docs(4),
  --     ['<C-Space>'] = cmp.mapping.complete(),
  --     ['<C-e>'] = cmp.mapping.abort(),
  --     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --   }),
  --   sources = cmp.config.sources({
  --     { name = 'nvim_lsp' },
  --     { name = 'luasnip' },
  --   }, {
  --     { name = 'buffer' },
  --   })
  -- })
  --
--
--
--
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
