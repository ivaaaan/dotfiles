--require("gruvbox").setup({
--    contrast = "soft",
--    bold = false,
--})
--
--vim.cmd.colorscheme("gruvbox")
vim.o.termguicolors = true
vim.cmd.colorscheme "catppuccin"
require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    dim_inactive = {
	enabled = false,
    },
})
