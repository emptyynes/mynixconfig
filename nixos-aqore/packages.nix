{ config, pkgs, emptypkgs, ... }:

{
	nixpkgs.config.permittedInsecurePackages = [
		"openssl-1.1.1w"
		"fluffychat-linux-1.22.1"
		"olm-3.2.16"
	];
	environment.systemPackages = with pkgs; [
		# EMPTYY
		# emptypkgs.hello

		# desktop
		firefox
		(vivaldi.overrideAttrs
			(oldAttrs: {
				dontWrapQtApps = false;
				dontPatchELF = true;
				nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
			})
		)
		wavebox
		gimp
		telegram-desktop
		kotatogram-desktop
		sublime4
		obs-studio
		qbittorrent
		flameshot
		qpwgraph
		nekoray
		corectrl
		vlc
		dino
		gajim
		mumble
		android-studio
		fluffychat
		lutris-unwrapped
		temurin-jre-bin
		prismlauncher


		# terminal
		fish
		bat
		zoxide
		git
		btop
		ncdu
		nvtopPackages.amd
		file
		tree
		wget
		unzip
		zip
		unrar
		neofetch
		python312Packages.fonttools
		nodemon
		
		# libs
		ffmpeg
		vivaldi-ffmpeg-codecs
		vulkan-tools

		# programming
		bun
		nodejs
		lua54Packages.lua
		lua54Packages.luacheck
		love
		gnumake
		cmake
		gcc

		# fonts
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-emoji
		fira-code
		fira-code-symbols
		nerdfonts

		wineWowPackages.stable
		wineWowPackages.waylandFull
	];

	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
		localNetworkGameTransfers.openFirewall = true;
	};

	virtualisation.virtualbox.host.enable = true;
	virtualisation.virtualbox.host.enableExtensionPack = true;
	users.extraGroups.vboxusers.members = [ "almiriqi" ];
	
	nixpkgs.config.allowUnfree = true;

	programs.corectrl.gpuOverclock.enable = true;
	# programs.corectrl.gpuOverclock.ppfeaturemask = true;
	# programs.corectrl.gpuOverclock.ppfeaturemask = "0xffffffff";
}
