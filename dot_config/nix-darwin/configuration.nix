{ config, pkgs, ...}:
{
	# Set Git commit hash for darwin-version.
	# system.configurationRevision = self.rev or self.dirtyRev or null;

	# Used for backwards compatibility, please read the changelog before changing.
	# $ darwin-rebuild changelog
	system.stateVersion = 6;

	# The platform the configuration will be used on.
	nixpkgs.hostPlatform = "aarch64-darwin";

	# Enable flakes
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Set Nix Default User Range
	ids.uids.nixbld = 31000;
	ids.gids.nixbld = 450;

	# Set home directory
	users.users."ryan.lau".home = "/Users/ryan.lau";

	# Set primary user
	system.primaryUser = "ryan.lau";

	# Set custom configuration.nix location
	environment.darwinConfig = "/Users/ryan.lau/.config/nix-darwin";

	# Download homebrew packages
	homebrew = {
		enable = true;
		brews = [
			"borders"
			"chezmoi"
			"eza"
			"fastfetch"
			"fd"
			"fzf"
			"gnupg"
			"mise"
			"neovim"
			"sketchybar"
			"tmux"
			"zoxide"
		];
		casks = [
			"aerospace"
			"font-commit-mono-nerd-font"
			"ghostty"
			"google-chrome"
			"jordanbaird-ice"
			"keeper-password-manager"
			"raycast"
			"shottr"
			"visual-studio-code"
		];
		taps = [
			"nikitabobko/homebrew-tap"
			"FelixKratz/homebrew-formulae"
		];
	};

	# Set system settings
	system = {
		defaults = {
			NSGlobalDomain = {
				_HIHideMenuBar = false;
				AppleInterfaceStyle = "Dark"; # dark mode
				AppleICUForce24HourTime = true;
				"com.apple.swipescrolldirection" = false; # enable natural scrolling direction
				InitialKeyRepeat = 15; # start repeating characters after 15ms
				KeyRepeat = 2; # repeat characters every 2ms
				ApplePressAndHoldEnabled = false; # disable accent character suggestion on key hold
				"com.apple.keyboard.fnState" = true; # use function keys as function keys by default
			};
			menuExtraClock.ShowSeconds = true;
			WindowManager.EnableStandardClickToShowDesktop = false;
			dock = {
				autohide = true;
				autohide-delay = 0.0;
				autohide-time-modifier = 0.0;
				tilesize = 24;
				orientation = "right";
				show-recents = false;
				persistent-apps = [
					{
						app = "/Applications/Microsoft Teams.app";
					}
					{
						app = "/Applications/Google Chrome.app";
					}
					{
						app = "/Applications/Ghostty.app";
					}
				];
				wvous-bl-corner = 5;
				wvous-br-corner = 4;
				wvous-tl-corner = 2;
				wvous-tr-corner = 12;
			};
			finder = {
				AppleShowAllExtensions = true; # show file extensions
				AppleShowAllFiles = true; # show hidden files
				CreateDesktop = false; # do not show icons on desktop
				ShowPathbar = true; # show path breadcrumbs
				ShowStatusBar = true; # show status bar with item/disk space stats
			};
			CustomUserPreferences = {
				# https://github.com/nix-darwin/nix-darwin/issues/518#issuecomment-2629087091
				"com.apple.symbolichotkeys" = {
					AppleSymbolicHotKeys = {
						# Disable 'Cmd + Space' for Spotlight Search
						"64" = {
							enabled = false;
						};
						# Disable 'Cmd + Alt + Space' for Finder search window
						"65" = {
							enabled = false;
						};
					};
				};
			};
		};
		keyboard = {
			enableKeyMapping = true;
			remapCapsLockToControl = true;
		};
	};
}
