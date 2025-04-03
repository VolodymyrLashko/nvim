return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = "main",
  lazy = false,
  dependencies = { "Mofiqul/vscode.nvim" },
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "angular", "scss" })
    end
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      pattern = { "*.component.html", "*.container.html" },
      callback = function()
        vim.treesitter.start(nil, "angular")
      end,
    })
  end,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "javascript", "lua", "angular" },
      highlight = {
        enable = true,
      }
    })
  end,
}
