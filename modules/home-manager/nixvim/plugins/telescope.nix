{
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
      extensions = {
        ui-select = {
          enable = true;
          settings.specific_opts.codeactions = true;
        };
        fzf-native.enable = true;
        file-browser.enable = true;
      };
      keymaps = {
        "<leader>sf" = {
          action = "find_files";
          options = {
            silent = true;
            noremap = true;
            desc = "Search files";
          };
        };
        "<leader>/" = {
          action = "live_grep";
          options = { desc = "Telescope live grep"; };
        };
      };
      settings.defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "^.node-modules/"
        ];
        set_env.COLORTERM = "truecolor";
        mappings = {
          i = {
            "<C-j>".__raw = "require('telescope.actions').move_selection_next";
            "<C-k>".__raw = "require('telescope.actions').move_selection_previous";
          };
          n = {
            "<C-j>".__raw = "require('telescope.actions').move_selection_next";
            "<C-k>".__raw = "require('telescope.actions').move_selection_previous";
          };
        };
      };
    };
    web-devicons.enable = true;
  };
}
