{ mkDerivation, lib, fetchFromGitLab, substituteAll, cmake, extra-cmake-modules, plasma-framework, kwin-effect-xrdesktop, qtbase, qttools, qtquickcontrols, kwindowsystem }:

mkDerivation rec {
  pname = "kwin-effect-xrdesktop";
  version = import ./version.nix;

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "kdeplasma-applets-xrdesktop";
    rev = version;
    sha256 = "0sygyx6ai80sj2x3znra2axy6fd26qv2fgqr8lynfh53n312hc1v";
  };

  nativeBuildInputs = [ cmake extra-cmake-modules ];
  buildInputs = [ plasma-framework kwin-effect-xrdesktop qtbase qtquickcontrols kwindowsystem ];

  patches = [ (substituteAll { src = ./kdeplasma-applets-xrdesktop.patch; qdbus="${lib.getBin qttools}/bin/qdbus"; }) ];
}
