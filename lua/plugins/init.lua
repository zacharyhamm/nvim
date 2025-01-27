return {
  -- NOTE: plugins here require little to no configuratin

  "tpope/vim-fugitive",
  "tpope/vim-surround",

  -- NOTE: disabled for now as not working with nvim window bindings
  -- "knubie/vim-kitty-navigator",
  "windwp/nvim-autopairs",
  "windwp/nvim-spectre", -- Spectre for find and replace
  "mhartington/formatter.nvim",
  "delphinus/vim-firestore",
  "andweeb/presence.nvim",
  "kyazdani42/nvim-web-devicons",
  "ziglang/zig.vim",

  -- Useful status updates for LSP
  { "j-hui/fidget.nvim", tag = "legacy", opts = { window = { border = "rounded", blend = 0 } } },

  { "numToStr/Comment.nvim", opts = {} },
--  "rmagatti/auto-session",
  "airblade/vim-gitgutter",
  "weilbith/nvim-code-action-menu",
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  },
}
