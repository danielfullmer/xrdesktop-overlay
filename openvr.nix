{ stdenv, fetchFromGitHub, cmake, SDL2, vulkan-loader }:

stdenv.mkDerivation rec {
  pname = "openvr";
  version = "1.7.15";

  src = fetchFromGitHub {
    owner = "ValveSoftware";
    repo = "openvr";
    rev = "v${version}";
    sha256 = "01kb0fq4dsyqznn6m3n272qr89g6i2vzp0srjmi6ldxz3w0rzmb2";
  };

  nativeBuildInputs = [ cmake ];

  # Steam's provided vrclient.so uses these libs, so let's link them in now so it can properly dlopen() vrclient.so
  # TODO: Alternatively, set rpath like in wine
  NIX_LDFLAGS = "-L${SDL2}/lib -lSDL2 -L${vulkan-loader}/lib -lvulkan";

  cmakeFlags = [ "-DBUILD_SHARED=1" ];
}
