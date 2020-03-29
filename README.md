# xrdesktop-overlay
NixOS overlay for [XRDesktop](https://www.collabora.com/news-and-blog/news-and-events/moving-the-linux-desktop-to-another-reality.html).

To use, add the following to `configuration.nix`:

```nix
{
  imports = [ (builtins.fetchTarball { url = "https://github.com/danielfullmer/xrdesktop-overlay/archive/master.tar.gz"; }) ];

  # At least one of the following:
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Also ensure SteamVR is working correctly:
  hardware.steam-hardware.enable = true;
  environment.systemPackages = [ steam ];
}
```

Then, follow the instructions [here](https://gitlab.freedesktop.org/xrdesktop/xrdesktop/wikis/howto).

### Current status:
`xrdesktop` has been tested working in Gnome, but there is currently an issue with KDE/Plasma.
This has been tested against nixpkgs commit `b7566d771544af8f581003455b87c32878e00933` (2020-02-21, nixos-unstable channel).
