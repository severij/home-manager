{ username, ...}:
{
  enable = true;
  userName = username;
  extraConfig = {
    diff.colorMoved = "zebra";
    github.user = username;
    pull.rebase = true;
    push.default = "current";
    rebase.autosquash = true;
    rerere = {
      autoupdate = true;
      enabled = true;
    };
  };
}
