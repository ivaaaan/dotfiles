local filetypes =
	{ "rust", "javascript", "c", "python", "go", "lua", "toml", "terraform", "yaml", "json", "markdown", "make" }
local treesitter = require("nvim-treesitter")
treesitter.install(filetypes)
treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})

for _, ft in ipairs(filetypes) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { ft },
		callback = function()
			vim.treesitter.start()
		end,
	})
end
