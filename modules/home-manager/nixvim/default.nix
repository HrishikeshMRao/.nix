{config, pkgs,...}:
{
  imports = [
    plugins/telescope.nix
    plugins/oil.nix
    plugins/catppuccin.nix
    plugins/completion.nix
    plugins/treesitter.nix
    plugins/lsp.nix
    plugins/noice.nix
    plugins/nix.nix
    plugins/none-ls.nix
    plugins/fold.nix
    plugins/git.nix
    ./keymaps.nix
  ];
  programs.nixvim = {
    clipboard.providers.xclip.enable = true;
    extraPackages = with pkgs; [
      ripgrep
      xclip
    ];
    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";  # Enable mouse control
      mousemodel = "extend"; # Mouse right-click extends the current selection
      splitbelow = true; # A new window is put below the current one
      splitright = true; # A new window is put right of the current one
      ignorecase = true; # When the search query is lower-case, match both lower and upper-case
      smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper case characters
      termguicolors = true; # Enables 24-bit RGB color in the |TUI|
      wrap = true;
      swapfile = false; 
      backup = false; 
      undofile = true;
      incsearch = true;
      scrolloff = 8;

      # Tab options
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;

      # Folding
      foldenable = true;
      foldmethod = "expr";
      foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()";
      foldtext = "";
      foldlevel = 99; # Folds with a level higher than this number will be closed
      foldlevelstart = 99;
      foldcolumn = "1";
    };
  };
}
