{ config, pkgs, ... }: {

  imports = [
    
    ./basic.nix # Basic core server configuration.
    ./settings.nix # Nix daemon configuration.
    ./timers.nix # Enable custom systemd services / timers.

    # Is this really needed on a flake?
    ./remove/hardware-configuration.nix # Include the results of the hardware scan.
  ];

}
