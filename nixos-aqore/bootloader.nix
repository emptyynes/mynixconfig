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

		binfmt.registrations.appimage = {
			wrapInterpreterInShell = false;
			interpreter = "${pkgs.appimage-run}/bin/appimage-run";
			recognitionType = "magic";
			offset = 0;
			mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
			magicOrExtension = ''\x7fELF....AI\x02'';
		};
	};
}
