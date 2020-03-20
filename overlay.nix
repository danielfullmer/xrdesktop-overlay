self: super: {
  openvr = super.callPackage ./openvr.nix {};
  openvrSamples = super.callPackage ./openvr-samples.nix {};

  gulkan = super.callPackage ./gulkan.nix {};
  gxr = super.callPackage ./gxr.nix {};
  libinputsynth = super.callPackage ./libinputsynth.nix {};
  xrdesktop = super.callPackage ./xrdesktop.nix {};

  plasma5 = super.plasma5.overrideScope' (plasma-self: plasma-super: rec {
    # Ensure the kwin-effect-xrdesktop plugin runnin in kwin has access to xrdesktop gsettings-schemas
    kwin = plasma-super.kwin.overrideAttrs (attrs: {
      qtWrapperArgs = [ ''--prefix XDG_DATA_DIRS  : ${self.xrdesktop}/share/gsettings-schemas/${self.xrdesktop.name}'' ];
    });

    kwin-effect-xrdesktop = super.libsForQt5.callPackage ./kwin-effect-xrdesktop.nix {};
    kdeplasma-applets-xrdesktop = super.libsForQt5.callPackage ./kdeplasma-applets-xrdesktop.nix { inherit kwin-effect-xrdesktop; }; # Probably not the right way to do this.
  });

  gnome3 = super.gnome3.overrideScope' (gnome-self: gnome-super: {
    gnome-shell = gnome-super.gnome-shell.overrideAttrs (attrs: rec {
      version = "${gnome-super.gnome-shell.version}-xrdesktop-${import ./version.nix}";

      src = super.fetchgit { # fetchFromGitLab doesn't accept fetchSubmodules?
        url  = "https://gitlab.freedesktop.org/xrdesktop/gnome-shell";
        rev = version;
        sha256 = {
          "3.28.4-xrdesktop-0.14.0" = "0000000000000000000000000000000000000000000000000000000000000000";
          "3.34.4-xrdesktop-0.14.0" = "0snspbn0lijxc2pnwhb7bjrs5kdaybv2gv31f4k3gm8fcl50q6ns";
          "3.36.0-xrdesktop-0.14.0" = "0000000000000000000000000000000000000000000000000000000000000000";
        }.${version};
        fetchSubmodules = true;
      };

      nativeBuildInputs = attrs.nativeBuildInputs ++ [ self.xrdesktop self.libinputsynth ];
    });
  });

  gnomeExtensions = super.gnomeExtensions // {
    xrdesktop = super.callPackage ./gnome-shell-extension-xrdesktop.nix {};
  };
}
