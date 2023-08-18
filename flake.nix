{
  description = "asynthe's system flake";

outputs = inputs @ {
  self,
  nixpkgs,
  nixpkgs-stable,
  nix-on-droid,
  nix-darwin,
  home-manager,
  nix-gaming,
  ...
}: let
  username = "asynthe";
  username_mac = "ben";
  hostname = "genkai";

  x64_system = "x86_64-linux";
  x64_darwin = "x86_64-darwin";

  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  
  in {

nixosConfigurations = {
  genkai = nixpkgs.lib.nixosSystem {
    system = "genkai";
    specialArgs = {inherit username inputs;};

    modules = [
      ./nix/system/laptop
      # HARDWARE-CONFIGURATION.NIX HERE?

      # Home Manager as a Module
      #home-manager.nixosModules.home-manager
      #{
      #home-manager = {
      #useGlobalPkgs = true;
      #useUserPackages = true;
      #users.${username} = import ./nix/home/linux/home.nix;
      #};
      #}
    ];
    };
  };

  # Testing Specialargs on Home Manager Module
  #nixosConfigurations.${hostname} = { nixpkgs.lib.nixosSystem rec {
  #({ config, lib, ... }: {
  #options.home-manager.users = lib.mkOption {
  #type = with lib.types; attrsOf (submoduleWith {
  #specialArgs = { super = config; inherit helix; };
  #});
  #};
  #})

nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
  modules = [./nix/nix-on-droid];
};

# macOS configuration
#darwinConfigurations =
#let
#system = x64_darwin;
#specialArgs =
#{
#inherit username_mac;
#nixpkgs = import nixpkgs {
#inherit system;
#config.allowUnfree = true;
#};
#}
#// inputs;
#base_args = {
#inherit nix-darwin home-manager system specialArgs nixpkgs;
#};
#in {
#macos = macosSystem (base_args // {
#darwin-modules = [
#./system/macos
#];
#home-module = import ./home/darwin;
#});
#};

# Home Manager as a Standalone
homeConfigurations = {
  ${username} = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = {inherit username inputs;};
    modules = [./home/linux/home.nix];
  };
};

}; 
  inputs = {
    # Main
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    nix-on-droid = {
      url = "github:t184256/nix-on-droid/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
      };

    # Home
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; 
      # Follows the nixpkgs channel defined before, 
      # to avoid different versions of nixpkgs deps problems.
    };

    # Repos
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nix-gaming.url = "github:fufexan/nix-gaming";
    hyprland.url = "github:hyprwm/Hyprland";
    #helix.url = "github:helix-editor/helix/23.05";

    # For MacOS
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-23.05-darwin";
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
  };

  nixConfig = {
      experimental-features = [ "nix-command" "flakes" "recursive-nix" ]; # Enable flakes.
      systemFeatures = [ "recursive-nix" ];
      substituters = [
        "https://cache.nixos.org/" # The main cache, you can replace w one closer to you.
        "https://hyprland.cachix.org"
      ];
      extra-subtituters = [
        # Nix community's cache server
        "https://nix-community.cachix.org"
        "https://nixpkgs-wayland.cachix.org"
      ];

      extra-trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" # Hyprland
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E=" # Cuda Maintaners, nvidia
      ];
  };
}
