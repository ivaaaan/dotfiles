local lsp_signature = require("lsp_signature")
lsp_signature.setup {}

vim.keymap.set({ 'n' }, '<Leader>k', function()
     vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })
