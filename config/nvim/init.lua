require("config.lazy")

-- Options
local set = vim.opt

set.relativenumber = true
set.number = true

set.tabstop = 4
set.shiftwidth = 4
set.autoindent = true
set.expandtab = true
set.clipboard = "unnamedplus"

-- Search settings
set.ignorecase = true
set.smartcase = true

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

