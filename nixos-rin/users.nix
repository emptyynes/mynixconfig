{ config, pkgs, ... }:

{
	users.groups.remote = {};

	users.users = {
		maria = {
			isNormalUser = true;
			description = "Maria Arusu";
			extraGroups = [ "wheel" "remote" ];
			initialPassword = "airam";
		};
		root = {
			initialPassword = "toor";
		};
	};

	nix.settings.trusted-users = [ "maria" ];
}
