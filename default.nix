{ config, pkgs, lib, ... }:

with lib;
{
  nixpkgs.overlays = [ (import ./overlay.nix) ];

  environment.systemPackages = with pkgs;
    let
      desktopManager = config.services.xserver.desktopManager;
    in
      optional desktopManager.gnome3.enable gnomeExtensions.xrdesktop
      ++ optionals desktopManager.plasma5.enable [ plasma5.kwin-effect-xrdesktop plasma5.kdeplasma-applets-xrdesktop qt5.qttools ];
}
