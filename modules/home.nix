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

      # gtk3 = {
      #   source = "config/gtk-3.0/settings.ini";
      #   target = ".config/gtk-3.0/settings.ini";
      # };
      #
      # gtk4 = {
      #   source = "config/gtk-4.0/settings.ini";
      #   target = ".config/gtk-4.0/settings.ini";
      # };

      # qt5ct = {
      #   source = "config/qt5ct/qt5ct.conf";
      #   target = ".config/qt5ct/qt5ct.conf";
      # };
      #
      # qt6ct = {
      #   source = "config/qt6ct/qt6ct.conf";
      #   target = ".config/qt6ct/qt6ct.conf";
      # };

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

  # system.activationScripts.dotfiles.text = ''
  #   HOME=$(getent passwd "${vars.userName}" | cut -d: -f6)
  #   NIX_CONFIG_PATH="$HOME/nixos"
  #
  #
  #   # burn everything before reconfiguring
  #   rm "$HOME/.bashrc"
  #
  #   mkdir -p "$HOME/.config"
  #   chown -h "${vars.userName}":users "$HOME/.config"
  #
  #   mkdir -p "$HOME/.config/niri"
  #   ln -sfn $NIX_CONFIG_PATH/config/niri/config.kdl "$HOME/.config/niri/config.kdl"
  #
  #   mkdir -p "$HOME/.config/foot"
  #   ln -sfn $NIX_CONFIG_PATH/config/foot/foot.ini "$HOME/.config/foot/foot.ini"
  #
  #   ln -sfn $NIX_CONFIG_PATH/config/wallpapers "$HOME/.config/wallpapers"
  #
  #   ln -sfn $NIX_CONFIG_PATH/config/.bashrc "$HOME/.bashrc"
  #
  #   mkdir -p "$HOME/.config/nvim"
  #   ln -sfn $NIX_CONFIG_PATH/config/nvim/init.lua "$HOME/.config/nvim/init.lua"
  #
  #   mkdir -p "$HOME/.config/fastfetch"
  #   ln -sfn $NIX_CONFIG_PATH/config/fastfetch/config.jsonc "$HOME/.config/fastfetch/config.jsonc"
  #
  #   # reload desktop list
  #   rm -rf $HOME/.cache/tofi-drun
  #
  #   chown -h "${vars.userName}":users "$HOME/.config/niri" "$HOME/.config/foot" "$HOME/.config/wallpapers" "$HOME/.bashrc" "$HOME/.config/nvim" "$HOME/.config/fastfetch"
  #
  #   echo "user home directory reset"
  #   '';
}
