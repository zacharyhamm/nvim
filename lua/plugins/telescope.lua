return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    opts = {
      defaults = {
        file_ignore_patterns = { ".git/", "node_modules/", "env/" }, -- ignore git
        winblend = 0,
      },
    },
    keys = {
      {
        "<leader><space>",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        desc = "Find Files (root dir)",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
    end,
  },
}
