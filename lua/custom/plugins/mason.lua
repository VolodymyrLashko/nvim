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

local setupAngular = function(lspconfig)
  local ok, mason_registry = pcall(require, "mason-registry")
  if not ok then
    vim.notify("mason-registry could not be loaded")
    return
  end

  local angularls_path = mason_registry.get_package("angular-language-server"):get_install_path()

  local cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    table.concat({
      angularls_path,
      vim.uv.cwd(),
    }, ","),
    "--ngProbeLocations",
    table.concat({
      angularls_path .. "/node_modules/@angular/language-server",
      vim.uv.cwd(),
    }, ","),
  }

  local config = {
    on_attach = on_attach,
    cmd = cmd,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_new_config = function(new_config, new_root_dir)
      new_config.cmd = cmd
    end,
  }

  lspconfig.angularls.setup(config)
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
          "angularls",
          "cssls",
          "cssmodules_ls",
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
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "html",
          "scss",
        },
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          typescript = {
            format = {
              insertSpaceBeforeFunctionParenthesis = true,
              tabSize = 4,
              indentSize = 4,
            },
          },
        },
        javascript = {
          format = {
            insertSpaceBeforeFunctionParenthesis = true,
            tabSize = 4,
            indentSize = 4,
          },
        },
      })

      lspconfig.cssls.setup({
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          css = { validate = true },
          scss = { validate = true },
          less = { validate = true },
        },
      })

      lspconfig.cssmodules_ls.setup({
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      setupAngular(lspconfig)

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
