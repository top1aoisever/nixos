{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    dmidecode # hardware info
  ];

  services.fwupd.enable = true;
  services.tlp.enable = true;
  services.tlp.pd.enable = true;
}
