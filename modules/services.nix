{

  # audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
  };

  security.rtkit.enable = true;

  services.printing.enable = true;

  # ssh
  services.openssh.enable = true;

}
