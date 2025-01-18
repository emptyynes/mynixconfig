{ config, pkgs, ... }:

{
	boot = {
		initrd.kernelModules = [ "amdgpu" ];
		loader = {
			efi = {
				canTouchEfiVariables = true;
				efiSysMountPoint = "/boot/efi";
			};
			grub = {
				enable = true;
				device = "nodev";
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
