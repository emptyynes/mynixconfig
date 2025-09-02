{ config, pkgs, ... }:

{
	security.sudo = {
		enable = true;

		extraRules = [{
			commands = [
				{
					command = "/run/current-system/sw/bin/xp-pen-deco-01-v3-driver";
					options = [ "NOPASSWD" ];
				}
			];
			groups = [ "users" ];
		}];
	};
}