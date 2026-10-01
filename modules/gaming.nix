{pkgs, inputs, ...}: 
{
  environment.systemPackages = [
    inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-stable
  ];
  hardware.opentabletdriver = {
    enable = true;

    daemon.enable = false;
  };

  programs.steam.enable = true;
  programs.gamemode.enable = true;
}
