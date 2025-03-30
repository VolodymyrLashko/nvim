return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = "main",
  lazy = false,
  dependencies = { "Mofiqul/vscode.nvim" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "javascript", "lua" },
      highlight = {
        enable = true,
      },
    })
  end,
}
