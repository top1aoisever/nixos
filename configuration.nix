# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{vars, ...}: {
  imports =
    [ # Include the results of the hardware scan.

      ./hardware-configuration.nix # hw

      ./modules
    ];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  networking.hostName = vars.hostName;

  system.stateVersion = "26.05";

}

