# dotfiles

uses [chezmoi](https://www.chezmoi.io/) to manage dotfiles and [homebrew](https://brew.sh/)/nix's [home-manager](https://github.com/nix-community/home-manager) to manage packages

## setup

### macos

prereqs:
- homebrew
- chezmoi

initalize chezmoi to install and manage dotfiles
```
chezmoi init --apply ryanlau
```

### non-macos

install [nix](https://nixos.org/) using the [determinate nix installer](https://determinate.systems/nix-installer/)
```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm
```

temporarily use chezmoi to fetch these dotfiles, dotfiles are permanently installed
```sh
nix run nixpkgs#chezmoi -- init ryanlau --apply --exclude=scripts
```

install home-manager and use it to permanently install packages/programs including chezmoi
```sh
nix run home-manager/master -- switch
```

run the chezmoi scripts that were ignored earlier 
```sh
chezmoi apply
```

## todo

- [ ] add configs for other programs
- [ ] use [nix-darwin](https://github.com/LnL7/nix-darwin) to manage configuration for macos
- [ ] use home-manager instead of chezmoi to manage configuration files
- [ ] write docs explaining purpose of every file
