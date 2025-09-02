{ config, pkgs, ... }:

{
	home.username = "almiriqi";
	home.homeDirectory = "/home/almiriqi";

	home.stateVersion = "25.05";

	home.packages = (import ./packages.nix) pkgs;

	# home.sessionVariables = { };
	fonts.fontconfig.enable = true;
	
	programs.home-manager.enable = true;

	programs.git = {
		enable = true;
		userName  = "AlmiriQ";
		userEmail = "al.quali.4ef@gmail.com";
	};
}