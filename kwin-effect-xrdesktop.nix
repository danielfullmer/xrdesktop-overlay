{ mkDerivation, fetchFromGitLab, cmake, extra-cmake-modules, xrdesktop, graphene, libinputsynth, kwin, epoxy }:

mkDerivation rec {
  pname = "kwin-effect-xrdesktop";
  version = import ./version.nix;

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xrdesktop";
    repo = "kwin-effect-xrdesktop";
    rev = version;
    sha256 = "10psq049mz6aag2kn211h20kma21ilh17zhbijmmlhmk2nsajjzs";
  };

  nativeBuildInputs = [ cmake extra-cmake-modules ];
  buildInputs = [ xrdesktop graphene libinputsynth kwin epoxy ];
}
