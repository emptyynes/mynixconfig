{ config, pkgs, ... }:

{
	imports = [
		./bootloader.nix
		./users.nix
		./packages.nix
		./services/ssh.nix
		./services/syncthing-service.nix
		./services/sudo.nix
		./hardware/hardware-configuration.nix
		./hardware/audio.nix
		./hardware/graphics.nix
		./hardware/network.nix
		./locale.nix
	];

	networking.hostName = "aqore-nix";

	system.stateVersion = "25.05";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	nixpkgs.config.allowUnfree = true;
}
