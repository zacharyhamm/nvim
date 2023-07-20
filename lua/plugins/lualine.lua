return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = true,
        components_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        theme = "powerline",
        globalstatus = false,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { { "filename", file_status = true, path = 1 } },
        -- lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { { "filename", file_status = true, path = 1 } },
        -- lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = { "fugitive", "nvim-tree" },
    },
  },
}
