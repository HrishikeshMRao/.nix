{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = [

      # Oil access outside its buffer
      {
        key = "<leader>-";
        mode = "n";
        action = ":Oil<CR>";
        options = {
          silent = true;
          noremap = true;
          desc = "oil";
        };
      }

      # None-ls formatting
      {
        key = "<leader>f";
        mode = "n";
        action.__raw = ''
          function()
            vim.lsp.buf.format()
          end
        '';
        options = {
          silent = true;
          noremap = true;
          desc = "[l]SP [f]ormat whole document";
        };
      }

      # Remaps
      {
        key = "<leader>y";
        mode = ["n" "x"];
        action = "\"+y";
        options = {
          silent = true;
          noremap = true;
          desc = "Yank to the clipboard";
        };
      }

    ];

  };
}
