# A flake for `emacs-lsp-booster`

A nix flake for installing
[emacs-lsp-booster](https://github.com/blahgeek/emacs-lsp-booster).

## Installation

Add the input to your flake inputs, and enable the overlay:

``` nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/«version»";
    emacs-lsp-booster.url = "github:blahgeek/emacs-lsp-booster";
    # The emacs-lsp-booster flake itself depends on `nixpkgs` and
    # `flake-utils`; you might want to make both of these inputs
    # follow the ones in your configuration.
    #
    # emacs-lsp-booster.inputs.nixpkgs.follows = "nixpkgs";
    # emacs-lsp-booster.inputs.flake-utils.follows = "flake-utils";
  };
  outputs = { emacs-lsp-booster, ...}:
    let my-overlays = {
          nixpkgs.overlays = [
            «other-overlays»
            emacs-lsp-booster.overlays.default
          ];
        };
    in {
      nixosConfigurations.«hostname» = nixpkgs.lib.nixosSystem rec {
        system = «system»;
        modules = [
          «other-modules»
          my-overlays
        ];
      };
    };
}
```

You can then access the package as `nixpkgs.emacs-lsp-booster`,
e.g., by putting something like

``` nix
environment.systemPackages = [ pkgs.emacs-lsp-booster ];
```

into your `configuration.nix`.

**Important**: You will still have to configure Emacs to use `emacs-lsp-booster` for deserialisation,
see [here](https://github.com/blahgeek/emacs-lsp-booster/#configure-lsp-mode).

## TODOs

Any help/additional input is appreciated!

  + Should we add an option to automatically insert the necessary `lsp-mode` configuration into the user's Emacs file?

    + As a corollary: if we decide to do the above, we should also include `eglot` support.
