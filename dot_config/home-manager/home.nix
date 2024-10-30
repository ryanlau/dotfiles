{ config, pkgs, ... }:

{
  home.username = "ryan";
  home.homeDirectory = "/home/ryan";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
		chezmoi
		eza
		fastfetch
		fnm
		fzf
		gcc
		go
		lua
		neovim
		zoxide
		zsh
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
