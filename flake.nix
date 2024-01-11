{
  description = "A flake for ghub:blahgeek/emacs-lsp-booster";

  inputs = {
    nixpkgs.url     = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    let overlay = final: prev: {
          emacs-lsp-booster = final.callPackage ./default.nix { };
        };
    in {
      overlays.default = overlay;
    } // flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs {
            inherit system;
            overlays = [ overlay ];
          };
      in {
        packages.default = pkgs.emacs-lsp-booster;
      }
    );
}
