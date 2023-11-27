# home-manager

## Installation

1. Install [Nix package manager](https://nixos.org/download):
    ```sh
    sh <(curl -L https://nixos.org/nix/install) --daemon
    ```
3. Enable [Flakes](https://nixos.wiki/wiki/Flakes) if not already enabled. Add the following line to `~/.config/nix/nix.conf` or `/etx/nix/nix.conf`:
    ```
    experimental-features = nix-command flakes
    ```
4. Clone the repo:
    ```sh
    git clone git@github.com:severij/home-manager
    ```
5. cd into the directory created by `git clone`. Make sure the username `$USER` matches one of the `homeConfigurations` in `flake.nix`.
6. Run
    ```sh
    nix run . -- switch --flake .
    ```
   After `home-manager` is installed, you can use command
    ```sh
    home-manager switch
    ```
## Post-installation
After Home Manager has been installed, you can build and activate the current configuration with the command
```sh
home-manager switch
```
