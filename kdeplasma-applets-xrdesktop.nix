{ mkDerivation, lib, fetchFromGitLab, substituteAll, cmake, extra-cmake-modules, plasma-framework, kwin-effect-xrdesktop, qtbase, qttools, qtquickcontrols, kwindowsystem }:

mkDerivation rec {
  pname = "kwin-effect-xrdesktop";
  version = import ./version.nix;

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "kdeplasma-applets-xrdesktop";
    rev = version;
    sha256 = "1njc54rc9hjzcsaf7hwq18xsq20hp8hicsnrwgjdbkps0f4s4hh2";
  };

  nativeBuildInputs = [ cmake extra-cmake-modules ];
  buildInputs = [ plasma-framework kwin-effect-xrdesktop qtbase qtquickcontrols kwindowsystem ];

  patches = [ (substituteAll { src = ./kdeplasma-applets-xrdesktop.patch; qdbus="${lib.getBin qttools}/bin/qdbus"; }) ];
}
