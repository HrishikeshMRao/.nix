{
  description = "Nixos config flake";

  inputs = {
    nvf.url = "github:notashelf/nvf";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
        url = "github:nix-community/nixvim";
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, hyprland, home-manager, nvf, ... }@inputs:
   let
     system = "x86_64-linux";
     pkgs = import nixpkgs {
       inherit system;
       config = {
         allowUnfree = true;
       };
     };
   in
   {
     nixosConfigurations = {
       maximal = nixpkgs.lib.nixosSystem {
         specialArgs = {inherit inputs system;};
         modules = [
           ./hosts/maximal/configuration.nix
           inputs.home-manager.nixosModules.default

         ];
       };
     };
   };
}
