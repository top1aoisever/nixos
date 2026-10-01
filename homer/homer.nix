{ config, lib, pkgs, vars, ... }:

with lib;

let
  cfg = config.homer;

  mkLinkScript = name: entry: ''
    target_path="$HOME_DIR/${entry.target}"
    parent_dir="$(dirname "$target_path")"
    mkdir -p "$parent_dir"

    # If something already exists at the target and it is a REAL file/dir
    # (not already one of our symlinks), back it up rather than clobbering
    # or silently failing to nest correctly.
    if [ -e "$target_path" ] && [ ! -L "$target_path" ]; then
      echo "[homer] Backing up existing $target_path -> $target_path.pre-nix-backup"
      mv "$target_path" "$target_path.pre-nix-backup"
    fi

    ln -sfn "$REPO_DIR/${entry.source}" "$target_path"

    chown -h "${vars.userName}":users "$parent_dir"
    chown -h "${vars.userName}":users "$target_path"
  '';
in
{
  options.homer = {
    enable = mkEnableOption "declarative home dotfile linking";

    repo = mkOption {
      type = types.str;
      default = "nixos";
      description = "Name of the repo directory inside $HOME containing dotfiles.";
    };

    files = mkOption {

      type = types.attrsOf (types.submodule {

        options = {
          source = mkOption {
            type = types.str;
            description = "Path relative to the repo (file or directory).";
          };

          target = mkOption {
            type = types.str;
            description = "Path relative to $HOME (file or directory).";
          };
        };
      });

      default = { };
      description = "Dotfiles/directories to link or copy into the home directory.";
    };

  };

  config = mkIf cfg.enable {
    system.activationScripts.homer.text = ''
      HOME_DIR="${vars.homeDih}"
      REPO_DIR="$HOME_DIR/${cfg.repo}"


      if [ ! -d "$REPO_DIR" ]; then
        echo "[homer] WARNING: repo directory $REPO_DIR does not exist yet, skipping."
      else
        ${concatStringsSep "\n" (mapAttrsToList mkLinkScript cfg.files)}
      fi

      chown -h "${vars.userName}":users "$HOME_DIR/.config"
    '';
  };
}
