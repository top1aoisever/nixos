{ pkgs, ... }: {
  fonts = {
    # only my fonts get to stay here
    enableDefaultPackages = false;

    fontDir.enable = true;

    packages = with pkgs; [
      nerd-fonts.symbols-only # symbols
      nerd-fonts.iosevka # goated
      nerd-fonts.iosevka-term # larping font

      # fallback
      source-sans
      source-serif

      # the daddy of fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
    ];

    fontconfig = {
      antialias = true;
      hinting.enable = false;
      subpixel = {
        rgba = "rgb";
      };

      defaultFonts = {
        serif = [
          "Iosevka Nerd Font Propo"
          "Noto Serif"
          "Source Serif 4"
          "Noto Serif CJK SC" 
          "Noto Serif CJK TC"
        ];
        sansSerif = [
          "Iosevka Nerd Font Propo"
          "Noto Sans"
          "Source Sans 3"
          "Noto Sans CJK SC"
          "Noto Sans CJK TC"
        ];
        monospace = [
          "Iosevka Nerd Font Propo"
          "Noto Sans Mono"
          "Source Sans"
          "Noto Sans Mono CJK SC"
          "Noto Sans Mono CJK TC"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };

  };
}
