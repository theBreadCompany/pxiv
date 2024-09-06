{ pkgs ? import <nixpkgs> { system = builtins.currentSystem; }
, lib ? pkgs.lib, rustPlatform ? pkgs.rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "pxiv";
  version = "0.1.0";

  src = ./.;

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  cargoSha256 = lib.fakeSha256; # Replace with the actual hash

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ pkgs.openssl ];

  meta = with lib; {
    description = "a pixiv embed helper";
    license = licenses.mit;
    maintainers = [ ];
  };
}
