{ self
, nixpkgs # <---- This `nixpkgs` has systems removed e.g. legacyPackages.zlib
, nain4
, ...
}: let
  inherit (nixpkgs.legacyPackages) pkgs;

  dev-shell-packages = with nain4;
    [ nain4.packages.nain4 ] ++
    deps.build-prop ++ deps.test ++ deps.run-prop
    ++ pkgs.lib.optionals pkgs.stdenv.isDarwin []
    ++ pkgs.lib.optionals pkgs.stdenv.isLinux  []
  ;

  in {

    packages.default = self.packages.nain4-library-example;

    # In principle, a library might not be monolithic, so it might provide
    # multiple packages, but we only have one for now.
    packages.nain4-library-example = pkgs.stdenv.mkDerivation {
      pname = "nain4-library-example";
      version = "0.0.0";
      src = "${self}/src";
      nativeBuildInputs = [ nain4.packages.nain4 ];
    };

    devShell = self.devShells.clang;

    devShells.clang = pkgs.mkShell.override { stdenv = nain4.packages.clang_16.stdenv; } {
      name = "nain4-library-example-devenv";
      packages = dev-shell-packages ++ [
        nain4.packages.nain4
        nain4.packages.clang_16
      ];
    };

  }
