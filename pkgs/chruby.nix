{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "chruby";
  version = "0.3.9";

  src = fetchurl {
    url =
      "https://github.com/postmodern/chruby/releases/download/v${version}/chruby-${version}.tar.gz";
    sha256 = "7220a96e355b8a613929881c091ca85ec809153988d7d691299e0a16806b42fd";
  };

  installPhase = ''
    make install PREFIX=$out
  '';

  postInstall = ''
    mkdir -p $out/share/doc/chruby
    cp -r README.md LICENSE $out/share/doc/chruby
  '';
}
