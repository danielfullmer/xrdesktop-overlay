{ mkDerivation, fetchFromGitLab, cmake, extra-cmake-modules, xrdesktop, graphene, libinputsynth, kwin, epoxy }:

mkDerivation rec {
  pname = "kwin-effect-xrdesktop";
  version = import ./version.nix;

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "kwin-effect-xrdesktop";
    rev = version;
    sha256 = "1v3f1hxbq462550hcb81xf2gm36j085zs1xa3cchmwdyvy433far";
  };

  nativeBuildInputs = [ cmake extra-cmake-modules ];
  buildInputs = [ xrdesktop graphene libinputsynth kwin epoxy ];
}
