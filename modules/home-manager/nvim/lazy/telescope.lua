require("telescope").setup({
defaults = {
  mappings = {
    i = {
      ["<C-j>"] = require("telescope.actions").move_selection_next,
      ["<C-k>"] = require("telescope.actions").move_selection_previous,
    },
    n = {
      ["<C-j>"] = require("telescope.actions").move_selection_next,
      ["<C-k>"] = require("telescope.actions").move_selection_previous,
    },
  },
},
})

require("telescope.health").check()
-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

require("telescope").setup({
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
    },
})

require("telescope").load_extension("ui-select")

require("telescope").setup({
extensions = {
  ["ui-select"] = {
    require("telescope.themes").get_dropdown({}),
  },
},
})

require("telescope").load_extension("ui-select")
