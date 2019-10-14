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
`xrdesktop` has been tested working in both Gnome and KDE/Plasma.
This has been tested against nixpkgs commit `525eaf407d4edb329ea48f6dc9c6590fb73c779a` (2019-08-03).
