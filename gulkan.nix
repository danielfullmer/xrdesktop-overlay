{ stdenv, fetchFromGitLab, glib, gdk_pixbuf, vulkan-loader, vulkan-headers, graphene, cairo, meson, ninja, pkgconfig, glslang, gtk-doc, docbook_xsl }:

stdenv.mkDerivation rec {
  pname = "gulkan";
  version = import ./version.nix;

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "gulkan";
    rev = version;
    sha256 = "1sd66bz0kmgr3wn6113rbmh8qxis69b2ndlhlyaym5mrbvv12f7r";
  };

  nativeBuildInputs = [ pkgconfig meson ninja glslang gtk-doc docbook_xsl ];
  propagatedBuildInputs = [ glib gdk_pixbuf vulkan-loader vulkan-headers graphene cairo ];
}
