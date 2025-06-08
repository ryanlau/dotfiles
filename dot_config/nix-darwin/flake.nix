{
	description = "Example nix-darwin system flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
		nix-darwin.url = "github:nix-darwin/nix-darwin";
		nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		nix-homebrew.url = "github:zhaofengli/nix-homebrew";
		homebrew-core = {
			url = "github:homebrew/homebrew-core";
			flake = false;
		};
		homebrew-cask = {
			url = "github:homebrew/homebrew-cask";
			flake = false;
		};
		aerospace = {
			url = "github:nikitabobko/homebrew-tap";
			flake = false;
		};
	};

	outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew, homebrew-core, homebrew-cask, aerospace }:
		{
			darwinConfigurations."P9PCJYXV4K" = nix-darwin.lib.darwinSystem {
				modules = [
					./configuration.nix
					home-manager.darwinModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users."ryan.lau" = ./home.nix;

					}
					nix-homebrew.darwinModules.nix-homebrew
					{
						nix-homebrew = {
							enable = true;
							user = "ryan.lau";
							taps = {
								"homebrew/homebrew-core" = homebrew-core;
								"homebrew/homebrew-cask" = homebrew-cask;
								"nikitabobko/homebrew-aerospace" = aerospace;
							};
							autoMigrate = true;
						};
					}
				];
			};
		};
}
