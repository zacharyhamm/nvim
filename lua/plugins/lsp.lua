return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function ()
      require("rust-tools").setup({
        server = {
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
        }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/neodev.nvim" },
    config = function()
      -- Setup neovim lua configuration
      require("neodev").setup()
      -- require all language server modules
      require("servers.typescript")
      require("servers.eslint")
      require("servers.vue")
      require("servers.css")
      require("servers.html")
      require("servers.luals")
      require("servers.python")
      require("servers.json")
      require("servers.tailwind")
      require("servers.yaml")
      require("servers.prisma")
      require("servers.emmet")
      require("servers.gql")
      -- require("servers.rust")
      require("servers.go")
      require("servers.deno")
      require("servers.astro")

      -- Customization and appearance -----------------------------------------
      -- change gutter diagnostic symbols
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        virtual_text = false,
        float = {
          source = "always",
        },
        severity_sort = true,
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })
    end,
  },
}
