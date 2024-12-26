# A custom nix config file to configure a user space for the main user
# This can be included within the configuration.nix file to build the os

{ lib, config, pkgs, ... }:

let 
	cfg = config.main-user;
in
{
	options.main-user = {
		enable = lib.mkEnableOption "enable user module";
		userName = lib.mkOption {
			default = "fiend";
			description = "username"; 
		};
	};
	
	config = lib.mkIf cfg.enable {
		users.users.${cfg.userName} = {
			isNormalUser = true;
			initialPassword = "pw123";
			description = "fiend";
			extraGroups = ["wheel"];	
			packages = with pkgs; [
				firefox
				tree	
			];
		};
	};
}
