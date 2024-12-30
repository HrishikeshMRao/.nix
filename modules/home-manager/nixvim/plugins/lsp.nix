{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      keymaps = {
        silent = true;
        diagnostic = {
          "<C-j>" = "goto_next";
          "<C-k>" = "goto_prev";
        };
        lspBuf = {
          K = "hover";
          "<leader>lr" = "references";
          "<leader>ld" = "definition";
          "<leader>li" = "implementation";
          "<leader>lt" = "type_definition";
          "<leader>ca" = "code_action";
        };
      };
      servers = {
        nixd.enable = true;
        clangd.enable = true;
        cmake.enable = true;
        markdown_oxide.enable = true;
        yamlls.enable = true;
        jsonls.enable = true;
        bashls.enable = true;
      };
    };
  };
}
