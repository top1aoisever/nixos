{
  description = "NixOs larper edition";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-gaming.url = "github:fufexan/nix-gaming";

    radare2.url = "github:radareorg/radare2";

    agenix.url = "github:ryantm/agenix";
  };

  outputs = { self, nixpkgs, agenix, ... }@inputs:
    let
      vars = import ./vars;
    in
    {
      nixosModules.homer = ./homer/homer.nix;
      nixpkgs.overlays = [ inputs.radare2.overlays.default ];
      nixosConfigurations.${vars.hostName} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { 
          inherit vars; 
          inherit inputs; 
        };
        modules = [
          ./configuration.nix
          # symlink to home
          self.nixosModules.homer

          # agenix
          agenix.nixosModules.default
          {
            environment.systemPackages = [ agenix.packages.x86_64-linux.default ];
          }
        ];
      };
    };
}
