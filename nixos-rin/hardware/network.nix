{ config, pkgs, ... }:

{
	networking = {
		networkmanager.enable = false;
		useDHCP = false;
		firewall.enable = false;
		interfaces = {
			enp2s0f1 = {
				ipv4.addresses = [{
					address = "192.168.0.3";
					prefixLength = 24;
				}];
			};
		};
		defaultGateway  = "192.168.0.1";
		nameservers  = [ "1.1.1.1" "8.8.8.8" ];
	};
}
