{
  description = "euler";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      # haskellDeps = with pkgs; [
      #   ghc
      #   haskellPackages.brittany
      #   haskellPackages.haskell-language-server
      #   cabal-install
      # ];
      # cdeps = with pkgs; [clang gnumake lldb];
      racketDeps = with pkgs; [racket];
    in {
      devShells.default =
        pkgs.mkShell {buildInputs = racketDeps;};
    });
}
