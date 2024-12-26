{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ../../modules/home-manager/hyprland/hyprland.nix
    #../../modules/home-manager/nixvim/default.nix
  ];

  home = {
    username = "fiend";
    homeDirectory = "/home/fiend";
    stateVersion = "24.05";
    packages = [

      pkgs.libgccjit
      pkgs.python314

      (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      pkgs.luajitPackages.lua-lsp
      pkgs.markdown-oxide
      pkgs.marksman
      pkgs.pyright
      pkgs.stylua
      pkgs.pylint
      pkgs.cpplint
      pkgs.statix
      pkgs.black
      pkgs.isort
      pkgs.nixfmt-rfc-style

    ];

    file = {

    };

    sessionVariables = {

      EDITOR = "nvim";

    };

  };

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland.enable = true;

  #programs.nixvim.enable = true;

  programs.neovim =
    let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
      enable = true;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [

        plenary-nvim
        telescope-ui-select-nvim
        nui-nvim
        lspsaga-nvim
        luasnip
        cmp_luasnip
        cmp-cmdline
        cmp-buffer
        cmp-path
        cmp-nvim-lsp
        friendly-snippets
        mini-icons

        {
          plugin = comment-nvim;
          config = toLuaFile ../../modules/home-manager/nvim/lazy/comment.lua;
        }

        {
          plugin = cloak-nvim;
          config = toLuaFile ../../modules/home-manager/nvim/lazy/cloak.lua;
        }

        pkgs.vimPlugins.nvim-treesitter.withAllGrammars

        #{
        #   plugin = nvim-treesitter;
        #   config = toLuaFile ../../modules/home-manager/nvim/lazy/treesitter.lua;
        #}

        {
          plugin = nvim-cmp;
          config = toLuaFile ../../modules/home-manager/nvim/lazy/completion.lua;
        }

        {
          plugin = noice-nvim;
          config = toLuaFile ../../modules/home-manager/nvim/lazy/noice.lua;
        }

        {
          plugin = nvim-lspconfig;
          config = toLuaFile ../../modules/home-manager/nvim/lazy/lsp.lua;
        }

        vim-clang-format
        clangd_extensions-nvim
        {
          plugin = none-ls-nvim;
          config = toLuaFile ../../modules/home-manager/nvim/lazy/none-ls.lua;
        }

        {
          plugin = catppuccin-nvim;
          config = toLuaFile ../../modules/home-manager/nvim/lazy/theme.lua;
        }

        {
          plugin = telescope-nvim;
          config = toLuaFile ../../modules/home-manager/nvim/lazy/telescope.lua;
        }

        {
          plugin = feline-nvim;
          config = toLuaFile ../../modules/home-manager/nvim/lazy/statusBar.lua;
        }

        {
          plugin = oil-nvim;
          config = toLuaFile ../../modules/home-manager/nvim/lazy/oil.lua;
        }

      ];

      extraLuaConfig = ''
        ${builtins.readFile ../../modules/home-manager/nvim/init.lua}
        ${builtins.readFile ../../modules/home-manager/nvim/set.lua}
        ${builtins.readFile ../../modules/home-manager/nvim/remap.lua}
        ${builtins.readFile ../../modules/home-manager/nvim/keymap.lua}
      '';

      extraPackages = with pkgs; [
        xclip
        wl-clipboard
        luajitPackages.lua-lsp
        ripgrep
      ];

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };

}
