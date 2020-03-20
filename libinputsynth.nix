{ stdenv, fetchFromGitLab, pkgconfig, meson, ninja, glib, xdotool, libX11, libXtst, libXi, libXext }:

stdenv.mkDerivation rec {
  pname = "libinputsynth";
  version = import ./version.nix;

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "libinputsynth";
    rev = version;
    sha256 = "0j6nxg6581c1s0dhl5d67dk7i8jrafmk829vp43j03ny5aajw8qy";
  };

  postPatch = ''
    substituteInPlace meson.build --replace "'xdo', dirs : ['/usr/lib']" "'xdo', dirs : ['${xdotool}/lib']"
  '';

  nativeBuildInputs = [ pkgconfig meson ninja ];
  buildInputs = [ xdotool libX11 libXtst libXi libXext ]; # mutter stuff?
  propagatedBuildInputs = [ glib ];
}
