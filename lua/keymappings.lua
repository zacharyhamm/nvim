local function register_mappings(mappings, default_options)
  for mode, mode_mappings in pairs(mappings) do
    for _, mapping in pairs(mode_mappings) do
      local options = #mapping == 3 and table.remove(mapping) or default_options
      local prefix, cmd = unpack(mapping)
      pcall(vim.keymap.set, mode, prefix, cmd, options)
    end
  end
end

local function telescope_find_files()
  require("telescope.builtin").find_files({ hidden = true })
end

local border_options = { float = { border = "rounded" } }

-- NOTE<cmd> <leader> prefixed mappings are in whichkey-settings.lua

local mappings = {
  n = {
    -- Normal mode
    -- Resize with arrows
    { "<C-Up>", "<cmd>resize -2<CR>", { silent = true } },
    { "<C-Down>", "<cmd>resize +2<CR>", { silent = true } },
    { "<C-Left>", "<cmd>vertical resize -2<CR>", { silent = true } },
    { "<C-Right>", "<cmd>vertical resize +2<CR>", { silent = true } },
    -- Ctrl + p fuzzy files
    { "<C-p>f", telescope_find_files },
    { "<C-p>b", "<cmd>Telescope buffers<CR>" },
    { "<C-p>g", "<cmd>Telescope live_grep<CR>" },
    { "<C-p>a", "<cmd>NvimTreeToggle <CR>" },
    -- escape clears highlighting
    { "<esc>", "<cmd>noh<cr><esc>" },
    -- hop words
    { "f", "<cmd>HopWord<cr>" },
    { "F", "<cmd>HopLine<cr>" },
    -- yank to end of line on Y
    { "Y", "y$" },
    -- lsp mappings
    { "K", vim.lsp.buf.hover },
    { "<C-k>", vim.lsp.buf.signature_help },
    {
      "[d",
      function()
        vim.diagnostic.goto_prev(border_options)
      end,
    },
    {
      "]d",
      function()
        vim.diagnostic.goto_next(border_options)
      end,
    },
    { "gD", vim.lsp.buf.declaration },
    { "gd", vim.lsp.buf.definition },
    { "gr", vim.lsp.buf.references },
    { "gi", vim.lsp.buf.implementation },
    -- bufferline
    { "H", "<cmd>BufferLineCyclePrev<CR>" },
    { "L", "<cmd>BufferLineCycleNext<CR>" },
    { "<C-d>", "<C-d>zz" },
    { "<C-u>", "<C-u>zz" },
    -- Remap for dealing with line wrap
    { "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true } },
    { "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true } },
    -- open link under cursor
    { "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>' },
    { "<C-t>n", "<cmd>tabnew<CR>"}
  },
  v = {
    -- Visual/Select mode
    -- Better indenting
    { "<", "<gv" },
    { ">", ">gv" },
    -- hop words
    { "f", require("hop").hint_words },
    -- moving text
    { "J", "<cmd>m '>+1<CR>gv=gv" },
    { "K", "<cmd>m '<-2<CR>gv=gv" },
  },
  x = {
    -- remap p to always paste from last yank
    { "<leader>p", '"_dP' },
  },
}

register_mappings(mappings, { silent = true, noremap = true })

-- S for search and replace in buffer
vim.cmd("nnoremap S :%s/")

-- hop in motion
local actions = { "d", "c", "<", ">", "y" }
for _, a in ipairs(actions) do
  vim.keymap.set("n", a .. "f", a .. "<cmd>lua require'hop'.hint_char1()<cr>")
end
