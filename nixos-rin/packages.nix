{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		fish
		bat
		git
		btop
		ncdu
		nvtopPackages.amd
		temurin-bin
		screen
	];
	
	nixpkgs.config.allowUnfree = true;
}
