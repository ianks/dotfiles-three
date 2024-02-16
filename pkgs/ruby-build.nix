# So you can run "impure" things like the below without too much hassle:
#   $ ruby-build 3.3.0 ~/.rubies/ruby-3.3
{ stdenvNoCC, fetchurl, makeWrapper }:

stdenvNoCC.mkDerivation rec {
  pname = "ruby-build";
  version = "20231225";

  src = fetchurl {
    url =
      "https://github.com/rbenv/ruby-build/archive/refs/tags/v${version}.tar.gz";
    sha256 = "6e97008a983c24aa4e8674e68a5e41abaa6a111adc318f02e237d16cc68b498e";
  };

  buildInputs = [ makeWrapper ];

  configurePhase = ''
    substituteInPlace bin/ruby-build --replace-fail /usr/local $out
  '';

  buildPhase = ''
    echo "nothing to build"
  '';

  installPhase = ''
    make install PREFIX=$out
    wrapProgram $out/bin/ruby-build \
      --set-default optflags "-O0" \
      --set-default debugflags "-g" \
      --set-default RUBY_DEVEL "yes" \
      --set-default RUBY_CONFIGURE_OPTS "--disable-install-doc --enable-install-static-library --enable-shared" \
      --add-flags "--keep" \
      --add-flags "--verbose"
  '';
}
