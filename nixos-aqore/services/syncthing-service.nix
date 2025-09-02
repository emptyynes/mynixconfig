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
        "navidrome" = { id = "2RHPUCN-AHBDAVY-6LLTGOY-SQIOFF6-S2YQAEA-GW3ZZFO-VEYS6HY-KI5MNQV"; };
        # "karter_kein" = { id = "7OJ2HAS-HBAYEYH-6KZKOSR-HR4BV45-GNJBTKB-S25GBWV-B7AZOAW-FKGKIAP"; };
        "likho" = { id = "FGFH7II-IX7RTPY-VNDJRDJ-CILUQMZ-W3KVCNW-MPWCNZD-RJI4O54-G5HSQAN"; };
      };
      folders = {
        "empty-music" = {
          path = "/home/almiriqi/Music";
          devices = [ "navidrome" ];
        };
        "SDModel" = {
          path = "/home/almiriqi/replica/models";
          devices = [ "likho" ];
        };
      };
    };
  };
}