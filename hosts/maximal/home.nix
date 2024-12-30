{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ../../modules/home-manager/hyprland/hyprland.nix
    ../../modules/home-manager/nixvim/default.nix
  ];

  home = {
    username = "fiend";
    homeDirectory = "/home/fiend";
    stateVersion = "24.05";
    packages = [
      pkgs.keepassxc
      pkgs.syncthing
    ];

    file = {

    };

    sessionVariables = {

    };

  };

  programs = {
    home-manager.enable = true;
    nixvim = {
      enable = true;
      defaultEditor = true;
      vimdiffAlias = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  wayland.windowManager.hyprland.enable = true;
}
