{pkgs, config, ...}: {
  networking.networkmanager.enable = true;

  networking.networkmanager.wifi.macAddress = "stable-ssid";
  networking.networkmanager.ethernet.macAddress = "stable-ssid";

  # Quad9 DNS
  networking.networkmanager.dns = "systemd-resolved";
  networking.nameservers = [ "9.9.9.9#dns.quad9.net" "149.112.112.112#dns.quad9.net" ];

  services.resolved = {
    enable = true;

    settings.Resolve = {
      DNS = [ "9.9.9.9#dns.quad9.net" "149.112.112.112#dns.quad9.net" ];
      DNSOverTLS = true;
      DNSSEC = true;
    };
  };

  # wireshark
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;

    dumpcap.enable = true;
    usbmon.enable = true;
  };

  networking.nftables.enable = true;
  networking.firewall.backend = "nftables";
  networking.firewall.enable = false;
  networking.firewall.checkReversePath = false;

  networking.firewall.allowedTCPPorts = [
    53317 # localsend port
    1143 # imap
  ];

  networking.firewall.allowedUDPPorts = [];

  # setup VPNs here

  networking.wg-quick.interfaces = {
    proton-ca = {
      configFile = config.age.secrets.proton-ca.path;
      autostart = false;
    };

    proton-jp = {
      configFile = config.age.secrets.proton-jp.path;
      autostart = false;
    };

    proton-nl = {
      configFile = config.age.secrets.proton-nl.path;
      autostart = false;
    };

    proton-sg = {
      configFile = config.age.secrets.proton-sg.path;
      autostart = false;
    };

    proton-us = {
      configFile = config.age.secrets.proton-us.path;
      autostart = false;
    };

    proton-ro = {
      configFile = config.age.secrets.proton-ro.path;
      autostart = false;
    };
  };

  users.groups.wireguardvpn = {};

  security.polkit = {
    extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (subject.isInGroup("wireguardvpn") &&
            action.id == "org.freedesktop.systemd1.manage-units" && 
            action.lookup("unit") && 
            action.lookup("unit").startsWith("wg-quick-")) {
          return polkit.Result.YES;
        }
      });
    '';
  };

}
