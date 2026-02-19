local map = require("utils").map

local dap = require("dap")
local dap_go = require("dap-go")

dap_go.setup()

dap.adapters.delve = function(callback, config)
    if config.mode == 'remote' and config.request == 'attach' then
        callback({
            type = 'server',
            host = config.host or '127.0.0.1',
            port = config.port or '38697'
        })
    else
        callback({
            type = 'server',
            port = '${port}',
            executable = {
                command = 'dlv',
                args = { 'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output=dap' },
                detached = vim.fn.has("win32") == 0,
            }
        })
    end
end


-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  } 
}

map("n", "<Leader>dc", function()
	dap.continue()
end)

map("n", "<Leader>dC", function()
	dap.run_to_cursor()
end)

map("n", "<Leader>db", function()
	dap.toggle_breakpoint()
end)

map("n", "<Leader>dT", function()
	dap.terminate()
end)

map("n", "<Leader>dt", function()
	dap_go.debug_test()
end)

map("n", "<leader>dr", function() 
	dap.repl.open()
end)


