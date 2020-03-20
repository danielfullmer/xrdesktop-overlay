{ stdenv, fetchFromGitLab, glib, gdk_pixbuf, vulkan-loader, vulkan-headers, graphene, cairo, meson, ninja, pkgconfig, json-glib, glslang, gtk-doc, docbook_xsl }:

stdenv.mkDerivation rec {
  pname = "gulkan";
  version = import ./version.nix;

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "gulkan";
    rev = version;
    sha256 = "12n5d259mh5h58yi26g2jq0dhybw2gwx7ha75jmlrnq3ccrkfb00";
  };

  nativeBuildInputs = [ pkgconfig meson ninja glslang gtk-doc docbook_xsl ];
  propagatedBuildInputs = [ glib gdk_pixbuf vulkan-loader vulkan-headers graphene cairo json-glib ];
}
