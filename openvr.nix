{ stdenv, fetchFromGitHub, cmake, SDL2, vulkan-loader }:

stdenv.mkDerivation rec {
  pname = "openvr";
  version = "1.10.30";

  src = fetchFromGitHub {
    owner = "ValveSoftware";
    repo = "openvr";
    rev = "v${version}";
    sha256 = "0vqyf4h09c8g9lbp935pwxgky0516qiz8s6zrbh5b1wjg8n0ivpg";
  };

  nativeBuildInputs = [ cmake ];

  # Steam's provided vrclient.so uses these libs, so let's link them in now so it can properly dlopen() vrclient.so
  # TODO: Alternatively, set rpath like in wine
  NIX_LDFLAGS = "-L${SDL2}/lib -lSDL2 -L${vulkan-loader}/lib -lvulkan";

  cmakeFlags = [ "-DBUILD_SHARED=1" ];
}
