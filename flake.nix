{
  description = "Tool to check there is internet access";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        package_name = "check-internet";
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.default = pkgs.writeShellApplication {
          name = package_name;
          runtimeInputs = [
            pkgs.inetutils
          ];
          text = builtins.readFile ./check-internet.sh;
        };
      }
    );
}
