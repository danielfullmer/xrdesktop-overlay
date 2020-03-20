{ stdenv, fetchFromGitLab, pkgconfig, meson, ninja, glib, gulkan, openvr, gtk3, gtk-doc, docbook_xsl }:

stdenv.mkDerivation rec {
  pname = "gxr";
  version = import ./version.nix;

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "gxr";
    rev = version;
    sha256 = "1rd9a349grydi0x22f38dfjr1q8a7p4m3hlpm2mzj7qvibblajq0";
  };

  nativeBuildInputs = [ pkgconfig meson ninja gtk-doc docbook_xsl ];
  propagatedBuildInputs = [ gulkan openvr gtk3 ];
}
