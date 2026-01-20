{ ... }:

{
  services = {
    greetd.enable = true;
    greetd.settings.default_session = {
      command = "tuigreet --user-menu --cmd 'niri-session'";
    };
  };
}
