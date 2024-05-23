{ pkgs, ...}: 
# hello-shell.nix
pkgs.stdenv.mkDerivation {
  name = "percentile-feedback";
  src = ./.;
  buildInputs = [
    pkgs.python3
  ];
  installPhase = ''
    mkdir $out
    cp *.js $out
    cp index.html $out
    mkdir $out/bin
    echo '#!/bin/sh' > $out/bin/percentile-feedback
    echo "${pkgs.python3}/bin/python -m http.server 8083 --bind rfnash-thinkpad-wsl.musicmaker1118.gmail.com.beta.tailscale.net -d $out" >> $out/bin/percentile-feedback
    chmod +x $out/bin/percentile-feedback
  '';
}
