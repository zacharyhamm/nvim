require("lspconfig").rust_analyzer.setup({
  settings = {
    ['rust-analyzer'] = {
      procMacro = { enable = true };
    }
  }
})
