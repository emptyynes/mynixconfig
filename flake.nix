{
	description = "Almiriq!Iwasaki's Flake!";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.11";
		emptypkgs.url = "github:emptyynes/NER";
	};

	outputs = { self, nixpkgs, emptypkgs, ... }:
	let
		lib = nixpkgs.lib;
		linux64 = "x86_64-linux";
	in {
		nixosConfigurations = {
			aqore = lib.nixosSystem {
				system = linux64;
				modules = [
					./nixos-aqore/main.nix
				];
			};

			rin = lib.nixosSystem {
				system = linux64;
				modules = [
					./nixos-rin/main.nix
				];
			};
		};
	};
}