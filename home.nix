{ config, pkgs, nix-colors, username, ... }:
let
  nixGLWrap = pkg: pkgs.runCommand "${pkg.name}-nixgl-wrapper" {} ''
    mkdir $out
    ln -s ${pkg}/* $out
    rm $out/bin
    mkdir $out/bin
    for bin in ${pkg}/bin/*; do
     wrapped_bin=$out/bin/$(basename $bin)
     echo "exec ${pkgs.lib.getExe pkgs.nixgl.nixGLIntel} $bin \$@" > $wrapped_bin
     chmod +x $wrapped_bin
    done
  '';
in
{
  imports = [ nix-colors.homeManagerModules.default ];

  home = {
    inherit username;
    stateVersion = "23.05"; # Read HM release notes before changing.
    homeDirectory = "/home/${username}";
    packages = with pkgs; [
      bottom
      iosevka
      lua-language-server
      (nerdfonts.override { fonts = [ "Iosevka" ]; })
      nil
      tmux
    ];
    sessionVariables = {
      PATH = "$PATH:$HOME/.local/bin";
      XDG_DATA_DIRS = "$XDG_DATA_DIRS:$HOME/.nix-profile/share";
    };
  };

  fonts.fontconfig.enable = true;

  colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;
  
  programs = {
    home-manager.enable = true; # Let Home Manager install and manage itself.
    alacritty = import ./programs/alacritty { inherit config pkgs nixGLWrap; };
    bash = import ./programs/bash;
    git = import ./programs/git { inherit username; };
    neovim = import ./programs/neovim { inherit config pkgs; };
  };
}
