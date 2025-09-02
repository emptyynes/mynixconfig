{ config, pkgs, ... }:

let
  aagl-gtk-on-nix = import (builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz");
in
{
	imports = [
		aagl-gtk-on-nix.module
	];
	imports = [
		./bootloader.nix
		./users.nix
		./packages.nix
		./services/ssh.nix
		# ./services/minecraft.nix
		./hardware/hardware-configuration.nix
		./hardware/network.nix
		./locale.nix
	];

	networking.hostName = "rin";

	system.stateVersion = "24.11";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	programs.an-anime-game-launcher.enable = true;

	nixpkgs.config.allowUnfree = true;
}
