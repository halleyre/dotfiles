{ ... }:

{
  services = {
    greetd = {
      enable = true;
      settings.default_session = {
        command = "tuigreet --user-menu --cmd 'niri-session'";
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
  };
}
