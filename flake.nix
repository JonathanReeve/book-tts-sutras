{
  description = "A self-installing Clojure environment for the Sutra Book project.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      clj-install-version = "1.11.1.1429";
      clj-installer-url = "https://download.clojure.org/install/linux-install-${clj-install-version}.sh";
      clj-installer-name = "linux-install-${clj-install-version}.sh";
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.jdk17
          pkgs.curl
          pkgs.rlwrap
          pkgs.bash
          pkgs.cacert # For SSL access to Clojars
        ];

        shellHook = ''
          unset CLASSPATH
          export CLJ_CONFIG="$(pwd)/.clj-config"
          export CLJ_TOOLS_DIR=$(pwd)/.clj-tools
          
          if [ ! -f "$CLJ_TOOLS_DIR/bin/clojure" ]; then
            echo "Clojure tools not found. Installing version ${clj-install-version}..."
            curl -L -O ${clj-installer-url}
            chmod +x ${clj-installer-name}
            ./${clj-installer-name} --prefix $CLJ_TOOLS_DIR
            rm ${clj-installer-name}
            echo "Installation complete."
          fi
          
          export PATH="$CLJ_TOOLS_DIR/bin:$PATH"
          echo "Clojure environment is ready."
        '';
      };
    };
}
