{ config, pkgs, ... }: {

  # Enable OpenGL
  hardware.opengl = {
    enable = true; # vulkan
    driSupport = true; # vulkan + wine
    driSupport32Bit = true;
    #setLdLibraryPath = true; # gaming extra
    #extraPackages32 = with pkgs.pkgsi686Linux; [libva]; # gaming extra
  };
  
  # Completely disable NVIDIA graphics and use integrated.
  #hardware.nvidiaOptimus.disable = true; 

  # Specify your system's drivers.
  services.xserver.videoDrivers = ["nvidia"];

  # NVIDIA Configuration
  hardware.nvidia = {
    modesetting.enable = true; # Required
    nvidiaSettings = true;
    # Driver version (stable, beta, production [install 535], vulkan_beta, legacy_390, legacy_340)
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    # Nvidia open source kernel module, not nouveau.
    open = true;

    #forceFullCompositionPipeline = true; # Fix screen tearing
  };

  # Bus ID Values
  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      glibc
      glxinfo # Check if running on gpu.
      zenith-nvidia
      nvtop-nvidia
      vulkan-tools
   
      #virtualgl
      #nvidia-offload
      #linuxKernel.packages.linux_6_2.bbswitch
      #libva
      #libva-utils
      #libdrm
      #mesa #mesa-demos
    ;
  };
}