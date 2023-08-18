{ config, pkgs, ... }:

{

  # Audio configuration
  # See more at https://nixos.wiki/wiki/PipeWire
  # See more at https://nixos.wiki/wiki/PulseAudio

  #users.users.asynthe.extraGroups = [ "audio" ];
  sound = {
    enable = true;
    mediaKeys.enable = true;
  };
  hardware.bluetooth.enable = true;

  # PIPEWIRE
  security.rtkit.enable = true;
  hardware.pulseaudio = {
    enable = false;
    support32Bit = true; # for gaming fix
  };

  services.pipewire = {
    enable = true;
    audio.enable = true; # use as primary sound server
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true; # use JACK applications
    wireplumber.enable = true;
  };
  # JACK - 
  #services.jack = {
    #jackd.enable = true;
    #alsa.enable = false;
    #loopback = {
      #enable = true;
      #dmixConfig = ''
      #  period_size 2048
      #'';
    #};
  #};

}
