{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		fish
		bat
		git
		btop
		ncdu
		nvtopPackages.amd
	];
	
	nixpkgs.config.allowUnfree = true;
}
