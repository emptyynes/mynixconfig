{
	description = "Almiriq!Iwasaki's Flake!";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }:
	let
		lib = nixpkgs.lib;
		linux64 = "x86_64-linux";
	in {
		nixosConfigurations = {
			aqore = lib.nixosSystem {
				system = linux64;
				modules = [
					./nixos-aqore/main.nix
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.almiriqi = ./home-manager/almiriqi/home.nix;
					}
				];
			};
		};
	};
}
