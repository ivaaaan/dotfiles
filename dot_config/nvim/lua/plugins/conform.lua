require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		c = { name = "clangd", timeout_ms = 500, lsp_format = "prefer" },
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { name = "rust_analyzer", timeout_ms = 500, lsp_format = "prefer" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		go = { name = "gopls", timeout_ms = 500, lsp_format = "prefer" },
		yaml = { "prettier" },
		json = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
		jsonc = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
	},
})
