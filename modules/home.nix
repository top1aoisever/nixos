# home.nix
# shoutout my boy claude
{ pkgs, vars, config, lib, ... }:

{

  homer = {
    enable = true;

    repo = "nixos";

    files = {
      niri = {
        source = "config/niri/config.kdl";
        target = ".config/niri/config.kdl";
      };

      foot = {
        source = "config/foot/foot.ini";
        target = ".config/foot/foot.ini";
      };

      hypridle = {
        source = "config/hypr/hypridle.conf";
        target = ".config/hypr/hypridle.conf";
      };

      hyprlock = {
        source = "config/hypr/hyprlock.conf";
        target = ".config/hypr/hyprlock.conf";
      };

      gammastep = {
        source = "config/gammastep/config.ini";
        target = ".config/gammastep/config.ini";
      };

      waybar = {
        source = "config/waybar";
        target = ".config/waybar";
      };

      mako = {
        source = "config/mako/config";
        target = ".config/mako/config";
      };

      matugen = {
        source = "config/matugen";
        target = ".config/matugen";
      };

      quickshell = {
        source = "config/quickshell";
        target = ".config/quickshell";
      };

      gtk2 = {
          source = "config/gtkrc-2.0";
          target = ".config/gtkrc-2.0";
      };

      gtk3 = {
        source = "config/gtk-3.0";
        target = ".config/gtk-3.0";
      };

      gtk4 = {
        source = "config/gtk-4.0";
        target = ".config/gtk-4.0";
      };

      qt5ct = {
        source = "config/qt5ct";
        target = ".config/qt5ct";
      };

      qt6ct = {
        source = "config/qt6ct";
        target = ".config/qt6ct";
      };

      gitconfig = {
          source = "config/.gitconfig";
          target = ".gitconfig";
      };

      bashrc = {
        source = "config/.bashrc";
        target = ".bashrc";
      };

      neovim = {
        source = "config/nvim/init.lua";
        target = ".config/nvim/init.lua";
      };

      fastfetch = {
        source = "config/fastfetch/config.jsonc";
        target = ".config/fastfetch/config.jsonc";
      };

      scripts = {
        source = "scripts";
        target = ".scripts";
      };

      tablet-presets = {
        source = "config/tablet-area";
        target = ".config/tablet-area";
      };
    };
  };
}
