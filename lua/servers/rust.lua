require("lspconfig").rust_analyzer.setup({
  settings = {
    ['rust-analyzer'] = {
      imports = {
        granularity = {
          group = "module"
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        }
      },
      procMacro = { enable = true };
    }
  }
})
