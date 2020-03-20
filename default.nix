{ config, pkgs, lib, ... }:

with lib;
{
  nixpkgs.overlays = [ (import ./overlay.nix) ];

  environment.systemPackages = with pkgs;
    let
      desktopManager = config.services.xserver.desktopManager;
    in
      optionals desktopManager.plasma5.enable [ plasma5.kwin-effect-xrdesktop plasma5.kdeplasma-applets-xrdesktop ];

  services.xserver.desktopManager.gnome3.sessionPath = [ pkgs.gnomeExtensions.xrdesktop ];
}
