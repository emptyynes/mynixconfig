{ config, pkgs, ... }:

{
	boot = {
		initrd.kernelModules = [ "amdgpu" ];
		loader = {
			efi = {
				canTouchEfiVariables = true;
				efiSysMountPoint = "/boot";
			};
			grub = {
				enable = true;
				device = "/dev/sda1";
				efiSupport = true;
				configurationLimit = 10;
				gfxmodeEfi = "1920x1080";
				forceInstall = true;
				extraEntries = ''
					menuentry "UEFI Firmware Setup" {
						fwsetup
					}
				'';
			};
		};
	};
}