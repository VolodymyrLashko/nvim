vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { noremap = false, silent = true })

-- Set up LSP hover with scrollable popups
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single", -- You can choose "single", "double", etc.
  max_width = 80, -- Adjust width for your terminal
  max_height = 20, -- Adjust height if the content is too long
})
