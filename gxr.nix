{ stdenv, fetchFromGitLab, pkgconfig, meson, ninja, glib, gulkan, openvr, gtk3, gtk-doc, docbook_xsl }:

stdenv.mkDerivation rec {
  pname = "gxr";
  version = import ./version.nix;

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "gxr";
    rev = version;
    sha256 = "0z1bgc32m9g4rsjn7sjg05d23irgf041dyk9ljwqj32i5paf2j3k";
  };

  nativeBuildInputs = [ pkgconfig meson ninja gtk-doc docbook_xsl ];
  propagatedBuildInputs = [ gulkan openvr gtk3 ];
}
