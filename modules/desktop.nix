{lib, pkgs, ...}: {

  environment.systemPackages = with pkgs; [

    hypridle # idle management

    awww # wallpaper

    tofi # app launcher

    brightnessctl # control brightness
    gammastep # display color temperature
    wl-gammarelay-rs

    waybar # bar widget
    quickshell # to create custom widgets

    foot # wayland terminal

    vlc # audio player

    xwayland-satellite # xwayland to work with niri

    # notification handling
    libnotify

    anki # flashcard app
    goldendict-ng # dictionary reader

    keepassxc # password manager

    librewolf # firefox-based browser 
    brave # chromium-based

    thunar # file manager (xfce)

    mousepad # simple text editor
    qimgv   # another image viewer (!)
    kdePackages.okular # document viewer (kde)
    onlyoffice-desktopeditors # microsoft office replacement

    localsend # airdrop but based

    thunderbird # email client
    hydroxide # proton mail bridge to use /w thunderbirb

    adw-gtk3
    colloid-icon-theme

    pywalfox-native

    graphite-cursors # cursor theme

    glib
    gsettings-desktop-schemas
    nwg-look

    matugen # material color generator

    # download videos (yt-dlp frontend)
    video-downloader

    # make videos
    obs-studio

    # online calling
    zoom-us
  ];

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  # systemd.user.services.polkit-kde-authentication-agent-1 = {
  #   description = "polkit-kde-authentication-agent-1";
  #   wantedBy = [ "graphical-session.target" ];
  #   wants = [ "graphical-session.target" ];
  #   after = [ "graphical-session.target" ];
  #   serviceConfig = {
  #     Type = "simple";
  #     ExecStart = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
  #     Restart = "on-failure";
  #     RestartSec = 1;
  #     TimeoutStopSec = 10;
  #   };
  # };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

  services = {
    gvfs.enable = true; # trash, mount, ...
    tumbler.enable = true; # thumbnail preview for thunar
  };

  programs.dconf.enable = true; # low-level config

  programs.niri.enable = true;
  # services.desktopManager.plasma6.enable = true;

  xdg.mime.defaultApplications = {
    "image/*" = [ "qimgv.desktop" ];
    "application/pdf" = ["org.kde.okular.desktop"];
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config = {
      niri = {
        default = lib.mkForce [ "gtk" "gnome" ];
        "org.freedesktop.impl.portal.FileChooser" = lib.mkForce [ "gtk" "gnome" ];
      };
    };
  };
}
