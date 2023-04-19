return {
  {
    "folke/tokyonight.nvim",
    -- lazy = true,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts) -- opts here are passed from above
      local colors = require("tokyonight.colors").setup({})
      vim.cmd("highlight WinSeparator guifg=" .. colors.bg_highlight)

    end,
  },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    "shaunsingh/seoul256.nvim",
  },
  {
    "Mofiqul/vscode.nvim"
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = false,
        operators = false,
        comments = true,
        ...
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "hard", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.cmd([[colorscheme gruvbox]])
    end
  }
}
