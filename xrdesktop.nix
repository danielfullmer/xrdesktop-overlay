{ stdenv, fetchFromGitLab, pkgconfig, meson, ninja, gxr, gtk-doc, docbook_xsl, glslang, python3, pythonPackages }:

stdenv.mkDerivation rec {
  pname = "xrdesktop";
  version = import ./version.nix;

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "xrdesktop";
    rev = version;
    sha256 = "0zzg53rlccyyndy8v7k2qs7j9xsa4hfm96g8lxqar63w3ivrqcss";
  };

  postPatch = ''
    chmod +x res/meson_post_install.py
    patchShebangs res/meson_post_install.py
  '';

  nativeBuildInputs = [
    pkgconfig meson ninja glslang gtk-doc docbook_xsl
    python3 pythonPackages.pygobject3
  ];
  propagatedBuildInputs = [ gxr ];

  #doCheck = true;
  #checkFlags = [ "--no-suite" "xr" "--no-suite" "post-install" ];
}
