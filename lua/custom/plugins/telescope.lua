local data = assert(vim.fn.stdpath("data")) --[[@as string]]

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope-smart-history.nvim",
  },
  config = function()
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")

    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>sc", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>ss", ":Telescope resume<CR>", { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>st", builtin.help_tags, { desc = "Find Help Tags" })
    vim.keymap.set("n", "<leader>sh", ":Telescope history<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)

    require("telescope").setup({
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          width = 0.99,
          height = 0.99,
          preview_height = 0.65,
          preview_cutoff = 0,
          -- mirror = true,
          -- prompt_position = "top",
        },
        mappings = {
          i = {
            ["<M-j>"] = actions.move_selection_next,
            ["<M-k>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<M-n>"] = actions.cycle_history_next,
            ["<M-p>"] = actions.cycle_history_prev,
          },
          n = {
            ["<M-j>"] = actions.move_selection_next,
            ["<M-k>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<M-n>"] = actions.cycle_history_next,
            ["<M-p>"] = actions.cycle_history_prev,
          },
        },
        sort_mru = true,
      },
      pickers = {
        buffers = {
          sort_lastused = true,
          ignore_current_buffer = true,
        },
      },
      extensions = {
        fzf = {},
      },
    })

    require("telescope").load_extension("fzf")
    pcall(require("telescope").load_extension, "smart_history")
  end,
}
