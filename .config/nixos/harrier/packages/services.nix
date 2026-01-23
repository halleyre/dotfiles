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
            "music-draft.jamesstow.dev" = "http://localhost:5030"; # soulseek
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
    navidrome = {
      enable = true;
      settings = {
        MusicFolder = "/var/lib/slskd/downloads";
      };
    };
    slskd = {
      enable = true;
      domain = null;
      environmentFile = "/var/lib/slskd/slskd.yml";
      settings.directories.downloads = "/var/lib/slskd/downloads";
      settings.shares.directories = [ ];
      settings.slskd.openFirewall = true;
    };
    trilium-server = {
      enable = true;
      port = 12783;
    };
  };

  users.users.navidrome.extraGroups = [ "slskd" ];
}
