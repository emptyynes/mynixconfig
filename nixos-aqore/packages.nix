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
		ungoogled-chromium
		floorp
		qbittorrent
		nekoray
		nicotine-plus
		# media
		gimp
		kdenlive
		celluloid
		obs-studio
		flameshot
		qpwgraph
		vlc
		# social
		telegram-desktop
		fluffychat
		gajim
		mumble
		# programming
		sublime4
		android-studio
		jetbrains.idea-community-bin
		# hardware
		corectrl
		# games
		prismlauncher
		haguichi
		logmein-hamachi
		# other
		appimage-run

		### terminal
		# shell
		fish
		# utils
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

	# virtualisation.virtualbox.host.enable = true;
	# virtualisation.virtualbox.host.enableExtensionPack = true;
	# users.extraGroups.vboxusers.members = [ "almiriqi" ];
	
	nixpkgs.config.allowUnfree = true;

	programs.corectrl.gpuOverclock.enable = true;
	# programs.corectrl.gpuOverclock.ppfeaturemask = true;
	# programs.corectrl.gpuOverclock.ppfeaturemask = "0xffffffff";
}
