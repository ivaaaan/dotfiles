vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind

		if name == "chadtree" and (kind == "install" or kind == "update") then
			vim.system({ "python3", "-m", "chadtree", "deps" }, { cwd = ev.data.path }):wait()
		end

		if name == "LuaSnip" and (kind == "install" or kind == "update") then
			vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path }):wait()
		end

		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	"https://github.com/hashivim/vim-terraform",
	"https://github.com/nvim-lua/plenary.nvim",
	{ src = "https://github.com/ms-jpq/chadtree", version = "chad" },
	"https://github.com/ray-x/lsp_signature.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/dhruvasagar/vim-table-mode",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/nvim-neotest/nvim-nio",
	{ src = "https://github.com/ibhagwan/fzf-lua", version = "main" },
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.x") },
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/sindrets/diffview.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/github/copilot.vim",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
	"https://github.com/mrcjkb/rustaceanvim",
	"https://github.com/ray-x/go.nvim",
	"https://github.com/ray-x/guihua.lua",
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/leoluz/nvim-dap-go",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/folke/persistence.nvim",
	"https://github.com/sainnhe/gruvbox-material",
})

vim.g.mapleader = ","
vim.g.cmdheight = 2
vim.g.incsearch = true
vim.g.hlsearch = true
vim.g.encoding = "UTF-8"
vim.g.table_mode_corner_corner = "|"

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.splitright = true

vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

require("lsp")
require("keymappings")
require("commands")

require("plugins.autopairs")
require("plugins.chadtree")
require("plugins.conform")
require("plugins.colorscheme")
require("plugins.context")
require("plugins.dap")
require("plugins.diffview")
require("plugins.fzf")
require("plugins.gitsigns")
require("plugins.go")
require("plugins.lsp_signature")
require("plugins.treesitter")
require("plugins.trouble")
require("plugins.persistence")

vim.cmd("highlight Normal ctermbg=NONE")
vim.cmd("highlight nonText ctermbg=NONE")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

vim.keymap.set("n", "<leader>v", "<cmd>CHADopen<cr>")

vim.keymap.set("", "<Space>t", ":vsplit term://fish<cr>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+yg_')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>yy", '"+yy')

vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>P", '"+P')

vim.keymap.set("n", "<C-Left>", ":tabprevious<CR>")
vim.keymap.set("n", "<C-Right>", ":tabnext<CR>")
vim.keymap.set("n", "<C-t>", ":tabnew<CR>")
vim.keymap.set("n", "<C-x>", ":tabclose<CR>")

vim.keymap.set("", "<up>", "<C-w><up>")
vim.keymap.set("", "<down>", "<C-w><down>")
vim.keymap.set("", "<left>", "<C-w><left>")
vim.keymap.set("", "<right>", "<C-w><right>")
