{ ... }:

{
  services = {
    cloudflared = {
      enable = true;
      tunnels = {
        "harrier_stow" = {
          credentialsFile = "/var/lib/cloudflared/2f7152ac-661d-4bb0-b8be-d87c30aedec6.json";
          ingress = {
            "ssh.jamesstow.dev" = "ssh://localhost:22"; # openssh
            "photos.jamesstow.dev" = "http://localhost:2283"; # immich
            "music.jamesstow.dev" = "http://localhost:4533"; # navidrome
            "notes.jamesstow.dev" = "http://localhost:12783"; # trilium
          };
          default = "http_status:404";
        };
      };
    };

    openssh = {
      enable = true;
      listenAddresses = [{ addr = "127.0.0.1"; }];
    };
    immich.enable = true;
    navidrome.enable = true;
    trilium-server.enable = true;
    trilium-server.port = 12783;
  };
}
