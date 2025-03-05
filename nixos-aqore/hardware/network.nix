{ config, pkgs, ... }:

{
	networking = {
		networkmanager.enable = false;
		useDHCP = false;
		firewall.enable = false;
		interfaces = {
			eno1 = {
				ipv4.addresses = [{
					address = "192.168.0.2";
					prefixLength = 24;
				}];
			};
		};
		defaultGateway  = "192.168.0.1";
		nameservers  = [
			"109.174.1.58"
			"82.202.136.100"
			"1.1.1.1"
			"8.8.8.8"
		];
		interfaces.eno1.wakeOnLan.enable = true;
	};
}