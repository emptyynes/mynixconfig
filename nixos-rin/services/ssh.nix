{ config, pkgs, ... }:

{
	services.openssh.enable = true;
	services.openssh.settings.AllowGroups = [ "remote" ];
}
