{ stdenv, fetchFromGitLab, glib, gdk_pixbuf, vulkan-loader, vulkan-headers, graphene, cairo, meson, ninja, pkgconfig, glslang, gtk-doc, docbook_xsl, gnome3 }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-xrdesktop";
  version = "${stdenv.lib.versions.majorMinor gnome3.gnome-shell.version}.0-xrdesktop-${import ./version.nix}";

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "gnome-shell-extension-xrdesktop";
    rev = version;
    sha256 = {
      "3.28.0-xrdesktop-0.14.0" = "0000000000000000000000000000000000000000000000000000000000000000";
      "3.34.0-xrdesktop-0.14.0" = "18gyhq1lpg5kxljb9wa3xkikrpfqfsiy7lzlxk93f23xbx8gqkwp";
      "3.36.0-xrdesktop-0.14.0" = "0000000000000000000000000000000000000000000000000000000000000000";
    }.${version};
  };

  nativeBuildInputs = [ pkgconfig meson ninja ];
}
