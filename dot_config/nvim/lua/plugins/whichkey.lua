local which_key = require('which-key')

which_key.setup {}


which_key.register({
    d = {
        name = "Debug",
        s = {
            name = "Step",
            c = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
            v = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
            i = { "<cmd>lua require('dap').step_into()<CR>", "Step Into" },
            o = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
        },
        r = {
            name = "Repl",
            o = { "<cmd>lua require('dap').repl.open()<CR>", "Open" },
            l = { "<cmd>lua require('dap').repl.run_last()<CR>", "Run Last" },
        },
        b = {
            name = "Breakpoints",
            c = {
                "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
                "Breakpoint Condition",
            },
            m = {
                "<cmd>lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
                "Log Point Message",
            },
            t = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Create" },
        },
        i = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle" },
    },
}, { prefix = "<leader>" })
