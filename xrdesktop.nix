{ stdenv, fetchFromGitLab, pkgconfig, meson, ninja, gxr, gtk-doc, docbook_xsl, glslang, python3 }:

stdenv.mkDerivation rec {
  pname = "xrdesktop";
  version = import ./version.nix;

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "xrdesktop";
    rev = version;
    sha256 = "1jvh9cfpx2i6n5fhysy18j7siwf1jwiajg54r1afx819psiz1wy2";
  };

  postPatch = ''
    chmod +x res/meson_post_install.py
    patchShebangs res/meson_post_install.py
  '';

  nativeBuildInputs = [ pkgconfig meson ninja glslang gtk-doc docbook_xsl python3 ];
  propagatedBuildInputs = [ gxr ];
}
