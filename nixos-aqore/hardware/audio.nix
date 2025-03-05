{ config, pkgs, ... }:

{
	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		audio.enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
		extraConfig.pipewire = {
			"10-clock-rate" = {
				"context.properties" = {
					"default.clock.rate" = 96000;
					"default.clock.allowed-rates" = [ 44100 48000 96000 ];
					"audio.format" = "FLOAT32LE";
				};
			};
		};
	};
}