{ config, pkgs, emptypkgs, ... }:

{
	nixpkgs.config.permittedInsecurePackages = [
		"openssl-1.1.1w"
		"fluffychat-linux-1.22.1"
		"olm-3.2.16"
	];
	environment.systemPackages = with pkgs; [
		### desktop
		# browsers and network
		firefox
		qbittorrent
		nicotine-plus
		chromium
		amnezia-vpn
		obsidian
		# media
		gimp
		krita
		qpwgraph
		vlc
		jellyfin-media-player
		audacity
		# social
		telegram-desktop
		# programming
		sublime4
		# hardware
		corectrl
		# games
		prismlauncher
		# other
		appimage-run

		### terminal
		# shell
		fish
		# utils
		screen
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
		firebase-tools
		
		# libs
		ffmpeg
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

		wineWowPackages.stable
		wineWowPackages.waylandFull
		xwayland-satellite

		pciutils

		# other
		kdePackages.wallpaper-engine-plugin
		kdePackages.qtwebengine
		kdePackages.xwaylandvideobridge
		(pkgs.libsForQt5.callPackage ./hardware/deco01-v3-driver.nix {})
		cava
		(python3.withPackages (ps: with ps; [ websockets ]))
	] ++ (with pkgs.rocmPackages; [
		# rocm
		amdsmi
		aotriton
		rpp
		clr
		hipcc
		rocm-smi
		half
		hip-common
		rocm-runtime
		miopen
	]);

	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-emoji
		nerd-fonts.fira-code
	];

	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
		localNetworkGameTransfers.openFirewall = true;
	};

	nixpkgs.config.allowUnfree = true;

	programs.amnezia-vpn.enable = true;
}
