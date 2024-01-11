{ pkgs, fetchFromGitHub, rustPlatform, lib, ... }:

rustPlatform.buildRustPackage rec {
  pname = "emacs-lsp-booster";
  version = "0.1.1";

  cargoSha256 = "sha256-quqhAMKsZorYKFByy2bojGgYR2Ps959Rg/TP8SnwbqM=";

  src = fetchFromGitHub {
    owner = "blahgeek";
    repo = pname;
    rev = "b98b873226b587bd1689b2073ea114d8eaa3676f";
    hash = "sha256-uJ4EKBLZ95Ig2dpocB/vduYXj3eKg20tXKa1KDl2DAU=";
  };

  nativeBuildInputs = with pkgs; [
    emacs  # For tests
  ];

  meta = with lib; {
    description = "Improve performance of Emacs LSP servers by converting JSON to bytecode";
    homepage = "https://github.com/${src.owner}/${pname}";
    changelog = "https://github.com/${src.owner}/${pname}/releases/tag/${version}";
    license = [ licenses.mit ];
    maintainers = [];
    mainProgram = "emacs-lsp-booster";
  };
}
