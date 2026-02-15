vim.keymap.set('n', '<leader>gw', function()
  local output = vim.fn.systemlist('git worktree list --porcelain')
  local worktrees = {}

  for _, line in ipairs(output) do
    local path = line:match('^worktree (.+)')
    if path then
      table.insert(worktrees, path)
    end
  end

  require('fzf-lua').fzf_exec(worktrees, {
    prompt = 'Worktrees❯ ',
    actions = {
      ['default'] = function(selected)
        local path = selected[1]
        -- Change global working directory
        vim.cmd('cd ' .. vim.fn.fnameescape(path))
        -- Close all buffers
        vim.cmd('%bdelete!')
        -- Open the root directory (or swap for a file picker)
        vim.cmd('edit ' .. vim.fn.fnameescape(path))
      end,
    },
  })
end)
