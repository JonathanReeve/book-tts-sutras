{
  description = "A Typst environment for the Sutra Book project.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.typst
          pkgs.bash
        ];
      };

      packages.${system}.build = pkgs.writeShellApplication {
        name = "build-sutra-book";
        runtimeInputs = [ pkgs.typst ];
        text = ''
          #!/usr/bin/env bash
          set -euo pipefail

          echo "Building HTML..."
          typst compile --features html src/sutra_book.typ public/sutra_book.html --input output="html"

          echo "Building PDF..."
          typst compile src/sutra_book.typ public/sutra_book.pdf --input output="pdf"

          echo "Build complete. Outputs are in public/"
        '';
      };

      apps.${system}.default = {
        type = "app";
        program = "${self.packages.${system}.build}/bin/build-sutra-book";
      };
    };
}
