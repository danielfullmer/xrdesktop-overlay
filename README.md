# xrdesktop-overlay
NixOS overlay for [XRDesktop](https://www.collabora.com/news-and-blog/news-and-events/moving-the-linux-desktop-to-another-reality.html).

To use, add the following to `configuration.nix`:

```nix
{
  imports = [ (import (builtins.fetchTarball { url = "https://github.com/danielfullmer/xrdesktop-overlay/archive/master.tar.gz"; })) ];

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
`xrdesktop` with Gnome shell seems to be working well. `kwin_x11` crashes when enabling xrdesktop.

This has been tested against nixpkgs commit 239fffc90d792b5362a20ec1a009978de7b8f91a (2019-07-28).
Periodically, the nvidia drivers lock up my system when starting SteamVR while using a compositor (even without xrdesktop).
I've had slightly better luck with nvidia drivers 430.40--but it's still not stable for me. YMMV
