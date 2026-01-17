local filetypes = { 'rust', 'javascript', 'c', 'python', 'go', 'lua', 'toml'}
require('nvim-treesitter').install(filetypes)


for _, ft in ipairs(filetypes) do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = { ft },
    callback = function() vim.treesitter.start() end,
  })
end
