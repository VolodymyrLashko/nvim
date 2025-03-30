vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  signs = true,
  update_in_insert = false,
})

vim.keymap.set("n", "<leader>j", vim.diagnostic.open_float, { noremap = true, silent = true })
