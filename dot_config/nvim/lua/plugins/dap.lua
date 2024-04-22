require('dap-go').setup {
    dap_configurations = {
    {
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
      connect = {
        host = "127.0.0.1",
        port = "43000"
      }
    },
  },
  delve = {
    port = "43000"
  },
}

require('dapui').setup {}
