{ config, pkgs, ... }:

{
	imports = [
		./bootloader.nix
		./users.nix
		./packages.nix
		./services/ssh.nix
		./hardware/hardware-configuration.nix
		./hardware/network.nix
		./locale.nix
	];

	networking.hostName = "rin";

	system.stateVersion = "24.11";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
