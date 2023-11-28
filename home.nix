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
      clojure-lsp
      iosevka
      lua-language-server
      (nerdfonts.override { fonts = [ "Iosevka" ]; })
      nil
      pyright
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
    kitty = {
      enable = true;
      font = {
        name = "Iosevka";
        size = 16;
      };
      settings = with config.colorScheme.colors; {
        background = "#${base00}";
        foreground = "#${base05}";
        color0  = "#${base00}";
        color1  = "#${base01}";
        color2  = "#${base02}";
        color3  = "#${base03}";
        color4  = "#${base04}";
        color5  = "#${base05}";
        color6  = "#${base06}";
        color7  = "#${base07}";
        color8  = "#${base08}";
        color9  = "#${base09}";
        color10 = "#${base0A}";
        color11 = "#${base0B}";
        color12 = "#${base0C}";
        color13 = "#${base0D}";
        color14 = "#${base0E}";
        color15 = "#${base0F}";
      };
    };
    lf = import ./programs/lf;
    pistol.enable = true;
    neovim = import ./programs/neovim { inherit config pkgs; };
  };
}
