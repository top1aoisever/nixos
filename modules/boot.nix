{pkgs, inputs, ...}: {

  boot = {
    loader = {
      # grub = {
      #   enable = true;
      #   efiSupport = true;
      #   useOSProber = true;
      #   device = "nodev";
      # };
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 3;
      };
    };

    loader.timeout = 10;

  };

}
