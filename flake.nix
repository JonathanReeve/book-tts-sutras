
{
  description = "A Typst project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    typix = {
      url = "github:loqusion/typix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    # Example of downloading icons from a non-flake source
    # font-awesome = {
    #   url = "github:FortAwesome/Font-Awesome";
    #   flake = false;
    # };
  };

  outputs = inputs @ {
    nixpkgs,
    typix,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (pkgs) lib;

      typixLib = typix.lib.${system};

      src = lib.cleanSource ./src;
      commonArgs = {
        typstSource = "sutra_book.typ";

        fontPaths = [
          "${pkgs.roboto}/share/fonts/truetype"
          "${pkgs.noto-fonts-cjk-sans}/share/fonts/opentype"
          "${pkgs.noto-fonts-cjk-serif}/share/fonts/opentype"
          "${pkgs.libertinus}/share/fonts/opentype"
          "${pkgs.eb-garamond}/share/fonts"
        ];

        virtualPaths = [
          # Add paths that must be locally accessible to typst here
          # {
          #   dest = "icons";
          #   src = "${inputs.font-awesome}/svgs/regular";
          # }
        ];
      };

      commonArgsHtml = commonArgs // { output = "html"; };
      commonArgsPdf = commonArgs // { output = "pdf"; };

      # Build Typst projects in the Nix store
      html-drv = typixLib.buildTypstProject (commonArgsHtml // { inherit src; });
      ino-pdf-drv = typixLib.buildTypstProject (commonArgsPdf // { inherit src; inputs = [ "show-ino-notation=true" ]; });
      print-pdf-drv = typixLib.buildTypstProject (commonArgsPdf // { inherit src; inputs = [ "show-ino-notation=false" ]; });

      # Watch a project and recompile on changes (for default development)
      watch-script = typixLib.watchTypstProject commonArgs;
    in {
      checks = {
        inherit html-drv ino-pdf-drv print-pdf-drv watch-script;
      };

      packages = {
        default = html-drv; # Default package is the HTML build
        html = html-drv;
        ino-pdf = ino-pdf-drv;
        print-pdf = print-pdf-drv;
      };

      apps = rec {
        default = watch; # Default app is watch
        watch = flake-utils.lib.mkApp { drv = watch-script; };
      };

      devShells.default = typixLib.devShell {
        inherit (commonArgs) fontPaths virtualPaths;
        packages = [
          watch-script
          pkgs.poppler-utils
          pkgs.gnumake
        ];
      };
    });
}
