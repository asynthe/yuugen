{ config, pkgs, ... }: {

    # Fix for nixpkgs.allowUnfree = true
    # https://discourse.nixos.org/t/unfree-packages-on-flake-based-home-manager/30231
    
    nixpkgs.config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
    };
}