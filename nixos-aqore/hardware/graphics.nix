{ config, pkgs, ... }:

{
	hardware.graphics.enable = true;
	hardware.graphics.enable32Bit = true;
	hardware.amdgpu.opencl.enable = true;
	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.wayland.enable = true;
	services.desktopManager.plasma6.enable = true;
}