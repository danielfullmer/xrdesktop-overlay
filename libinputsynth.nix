{ stdenv, fetchFromGitLab, pkgconfig, meson, ninja, glib, xdotool, libX11, libXtst, libXi, libXext }:

stdenv.mkDerivation rec {
  pname = "libinputsynth";
  version = import ./version.nix;

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "libinputsynth";
    rev = version;
    sha256 = "0mia7myrr022djd1py21kf04i10a042gpq4s28g0xh0njsj30jb6";
  };

  postPatch = ''
    substituteInPlace meson.build --replace "'xdo', dirs : ['/usr/lib']" "'xdo', dirs : ['${xdotool}/lib']"
  '';

  nativeBuildInputs = [ pkgconfig meson ninja ];
  buildInputs = [ xdotool libX11 libXtst libXi libXext ]; # mutter stuff?
  propagatedBuildInputs = [ glib ];
}
