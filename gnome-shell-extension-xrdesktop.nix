{ stdenv, fetchFromGitLab, glib, gdk_pixbuf, vulkan-loader, vulkan-headers, graphene, cairo, meson, ninja, pkgconfig, glslang, gtk-doc, docbook_xsl }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-xrdesktop";
  version = import ./version.nix;

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "gnome-shell-extension-xrdesktop";
    rev = version;
    sha256 = "0alw9mhngma168adgkmlpphvfh4dhhi5hhksl2mkz5q9gsq7f9gf";
  };

  nativeBuildInputs = [ pkgconfig meson ninja ];
}
