return {
  "Mofiqul/vscode.nvim",
  lazy = false,
  opts = {
    style = "dark",
    group_overrides = {
      ["Normal"] = { bg = "#101010" },
      ["NormalFloat"] = { bg = "#252525" },
      ["SignColumn"] = { bg = "#101010" },
      ["VertSplit"] = { bg = "#101010" },
      ["StatusLine"] = { bg = "#101010" },
      ["WinSeparator"] = { bg = "#101010" },
      ["LineNr"] = { bg = "#101010", fg = "#555555" },
      ["CursorLineNr"] = { bg = "#101010", fg = "#ffffff" },

      -- Variables ["@variable"] = { fg = "#bdbdbd" },
      ["@variable.c_sharp"] = { link = "@variable" },
      ["@variable.member.c_sharp"] = { fg = "#65c3cc" },
      ["@variable.parameter"] = { fg = "#ed8796" },
      ["@variable.parameter.c_sharp"] = { link = "@variable.parameter" },

      ["@keyword.repeat"] = { fg = "#6c95eb", bold = true },
      ["@keyword.repeat.c_sharp"] = { link = "@keyword.repeat" },

      -- Boolean
      ["@boolean"] = { fg = "#6c95eb", italic = true },
      ["@boolean.c_sharp"] = { link = "@boolean" },

      -- Return
      ["@keyword.return"] = { fg = "#6c95eb" },
      ["@keyword.return.c_sharp"] = { link = "@keyword.return" },

      -- Method
      ["@function.method"] = { fg = "#38c596", bold = true },
      ["@function.method.call"] = { link = "@function.method" },
      ["@function.method.call.c_sharp"] = { link = "@function.method" },

      -- Types (mots clés)
      ["@keyword"] = { fg = "#6c95eb", italic = false },
      ["@keyword.conditional"] = { fg = "#6c95eb", italic = false },
      ["@keyword.conditional.c_sharp"] = { link = "@keyword.conditional" },

      -- Classes
      ["@lsp.type.class.cs"] = { fg = "#c191ff", bold = true },

      -- Number
      ["@number"] = { fg = "#e791bc", bold = true },
      ["@number.c_sharp"] = { link = "@number" },

      -- Comment
      ["Comment"] = { fg = "#85c46c", italic = true },
      ["@comment"] = { fg = "#85c46c", italic = true },

      -- Nvim tree
      ["NvimTreeNormal"] = { bg = "#101010" },
      ["NvimTreeNormalNC"] = { bg = "#101010" },
    },
  },
  config = function(_, opts)
    require("vscode").setup(opts)
    vim.cmd.colorscheme("vscode")
  end,
}
