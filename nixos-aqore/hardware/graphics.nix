{ config, pkgs, ... }:

{
	hardware.graphics.enable = true;
	hardware.graphics.enable32Bit = true;
	hardware.amdgpu.opencl.enable = true;

	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.wayland.enable = true;

	services.desktopManager.plasma6.enable = true;

	# programs.niri.enable = true;

	programs.hyprland.enable = true;
	programs.hyprland.xwayland.enable = true;

	systemd.tmpfiles.rules = [
		"L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];

    hardware.graphics.extraPackages = with pkgs; [
    	rocmPackages.clr.icd
	];

	hardware.amdgpu.overdrive.enable = true;
	hardware.amdgpu.overdrive.ppfeaturemask = "0xffffffff";
}
