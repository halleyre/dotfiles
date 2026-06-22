{ ... }:

{
  services = {
    cloudflared = {
      enable = true;
      # tunnels = {
      #   "harrier_stow" = {
      #     credentialsFile = "/var/lib/cloudflared/?.json";
      #     ingress = {
      #       "ssh.jamesstow.dev" = "ssh://localhost:22"; # openssh
      #     };
      #     default = "http_status:404";
      #   };
      # };
    };

    openssh = {
      enable = true;
      # listenAddresses = [{ addr = "127.0.0.1"; }];
    };
  };
}
