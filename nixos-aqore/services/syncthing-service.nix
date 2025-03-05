{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    group = "users";
    user = "almiriqi";
    dataDir = "/home/almiriqi/Documents";
    configDir = "/home/almiriqi/Documents/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "navidrome" = { id = "DQPTUGI-4EJ2T5R-636TDR5-UXQ2NS4-MMRALLC-CJ3OWXS-HVEDM4Q-VST6UAE"; };
        "karter_kein" = { id = "7OJ2HAS-HBAYEYH-6KZKOSR-HR4BV45-GNJBTKB-S25GBWV-B7AZOAW-FKGKIAP"; };
      };
      folders = {
        "Music" = {
          path = "/home/almiriqi/Music";
          devices = [ "navidrome" ];
        };
      };
    };
  };
}