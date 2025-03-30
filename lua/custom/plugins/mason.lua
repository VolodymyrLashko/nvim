local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "<leader>am", vim.lsp.buf.code_action, opts)
  vim.keymap.set("v", "<leader>am", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gU", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gu", require("telescope.builtin").lsp_references, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
end

return {
  { "williamboman/mason.nvim", config = true },

  -- Mason-LSP bridge (connects Mason with LSPConfig)
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
        },
        automatic_installation = true,
      })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = { "stylua" }, -- Automatically installs stylua
      })
    end,
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            format = {
              enable = false,
            },
          },
        },
      })

      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
      })

      -- Cleanup keymap
      vim.keymap.set("n", "<leader>ll", function()
        vim.lsp.buf.format()
      end, { desc = "Format current buffer" })
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
        },
      })
      vim.keymap.set("n", "<leader>ll", function()
        vim.lsp.buf.format({ async = true })
      end, { desc = "Format current buffer" })
    end,
  },
}
