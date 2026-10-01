{pkgs, ...}: {
  time.timeZone = "Asia/Ho_Chi_Minh";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocales = [ "ja_JP.UTF-8/UTF-8" "vi_VN/UTF-8" ];

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";

    fcitx5 = {
      waylandFrontend = true;
      ignoreUserConfig = true;
      addons = with pkgs; [
        fcitx5-gtk
        qt6Packages.fcitx5-qt

        qt6Packages.fcitx5-unikey
        fcitx5-mozc
      ];
      settings = {
        inputMethod = {
          "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              DefaultIM = "keyboard-us";
            };
            "Groups/0/Items/0".Name = "keyboard-us";
            "Groups/0/Items/1".Name = "unikey";
            "Groups/0/Items/2".Name = "mozc";
        };
      };
    };
  };

}
