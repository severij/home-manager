{ config, pkgs, nixGLWrap, ...}:
{
  enable = true;
  package = nixGLWrap pkgs.alacritty;
  settings = {
    key_bindings = [
      {
        key = "Space";
        mods = "Control";
        chars = "\\x00";
      }
    ];
    font = {
      normal = {
        family = "Iosevka NF";
        style = "Regular";
      };
      size = 14;
    };
    colors = with config.colorScheme.colors; {
      primary = {
        background = "0x${base00}";
        foreground = "0x${base06}";
      };
      cursor = {
        cursor = "0x${base06}";
        text = "0x${base06}";
      };
      normal = {
        black = "0x${base00}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base06}";
        yellow = "0x${base09}";
      };
      bright = {
        black = "0x${base00}";
        red = "0x${base08}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        white = "0x${base06}";
        yellow = "0x${base0A}";
      };
    };
  };
}
