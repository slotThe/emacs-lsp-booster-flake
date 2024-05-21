{ fetchFromGitHub, rustPlatform, lib, ... }:

rustPlatform.buildRustPackage rec {
  pname = "emacs-lsp-booster";
  version = "0.2.1";

  cargoSha256 = "CvIJ56QrIzQULFeXYQXTpX9PoGx1/DWtgwzfJ+mljEI=";

  src = fetchFromGitHub {
    owner = "blahgeek";
    repo = pname;
    rev = "v${version}";
    sha256 = "uP/xJfXQtk8oaG5Zk+dw+C2fVFdjpUZTDASFuj1+eYs=";
  };

  # The tests contain what are essentially benchmarks—it seems prudent not to
  # stress our users' computers in that way every time they build the package.
  doCheck = false;

  meta = with lib; {
    description = "Improve performance of Emacs LSP servers by converting JSON to bytecode";
    homepage = "https://github.com/${src.owner}/${pname}";
    changelog = "https://github.com/${src.owner}/${pname}/releases/tag/${version}";
    license = [ licenses.mit ];
    maintainers = [];
    mainProgram = "emacs-lsp-booster";
  };
}
