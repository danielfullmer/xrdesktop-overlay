{ mkDerivation, lib, fetchFromGitLab, substituteAll, cmake, extra-cmake-modules, plasma-framework, kwin-effect-xrdesktop, qtbase, qttools, qtquickcontrols, kwindowsystem }:

mkDerivation rec {
  pname = "kwin-effect-xrdesktop";
  version = "0.12.1";

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "kdeplasma-applets-xrdesktop";
    rev = version;
    sha256 = "1snpayb02w3qp0zw5cy4xsnjzfihymasr0ldys8p1832avgr2rdj";
  };

  nativeBuildInputs = [ cmake extra-cmake-modules ];
  buildInputs = [ plasma-framework kwin-effect-xrdesktop qtbase qtquickcontrols kwindowsystem ];

  patches = [ (substituteAll { src = ./kdeplasma-applets-xrdesktop.patch; qdbus="${lib.getBin qttools}/bin/qdbus"; }) ];
}
