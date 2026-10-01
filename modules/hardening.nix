{ pkgs, vars, ... }:

{

  environment.systemPackages = with pkgs;
  [
     usbutils
  ];

  services.usbguard = {
    enable = true;

    # i do not change setup frequently so might as well set it this way (cope)
    # keyboard
    # mouse
    # tablet
    # usb drive
    # usb hub (2.0 + 3.0)
    rules = ''
      allow id 320f:5055 hash "vx9LBJd7yccxq+hP+ldqOKq/iE3EDgNJ6YkGQbGB3jU="

      allow id 046d:c092 hash "3E8HhbH2wmfJPuTb0gwg77WXdI2tmnacmQqAOoq8EOo="

      allow id 056a:037a hash "pmIdgGam7gbwknaWoLWr4A4Tpb5e5WPQUKfucFPDOK0="

      allow id 0951:1666 hash "krsHe/ZmYEubMYoWc4FyECXxE5NK6KKEJsMVg96xNMg="

      allow id 0bda:5411 hash "yTbqZv2hoAVyAvzT1r5iqC45+9VweaiBs362Djdgi4w="
      allow id 0bda:0411 hash "oGSkyrwpw915cufoKYsWFDpC/yXWeu8PoOgQ2LYtB60="
    '';
  };

  security.polkit.enable = true;

  security.sudo.wheelNeedsPassword = true;

  # Dirty Frag 
  boot.extraModprobeConfig = ''
    install esp4 ${pkgs.coreutils}/bin/false
    install esp6 ${pkgs.coreutils}/bin/false
    install rxrpc ${pkgs.coreutils}/bin/false
  '';
  boot.blacklistedKernelModules = [
    "esp4"
    "esp6"
    "rxrpc"
  ];

  boot.kernel.sysctl = {
    "kernel.yama.ptrace_scope" = 1;
    "net.ipv4.conf.all.rp_filter" = 2;
    "net.ipv4.conf.default.rp_filter" = 2;
  };
}
