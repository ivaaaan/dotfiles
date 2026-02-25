vim.api.nvim_create_user_command('Review', function()
  vim.cmd('DiffviewOpen origin/main...HEAD')
end, {})
