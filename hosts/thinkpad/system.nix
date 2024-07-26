{
    networking.hostName = "thinkpad";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = true;
    time.timeZone = "Australia/Perth";

    /* Options to create
    system.virtualization = [ "libvirt" "virtualbox" "vmware" ];
    */

    meta = {
        # -------------- System - Main --------------
        system.user = "ben";
        system.type = "laptop";
        #system.disk = "/dev/nvme0n1";
        system.language = "both"; # english, japanese, both
        system.keyboard = true;
        system.ssd = true;
        
        # Set up by `meta.system.type`, options: laptop, server
        #system.nix.settings = "laptop";
        #system.networking.type = "laptop";
        #system.users = "laptop";

        # -------------- Boot --------------
        boot.banner = "simple_cat"; # simple_cat, hentai
        boot.bootloader = "systemd-boot";
        boot.cleantmp = true;
        boot.silent = false;
        #boot.secure = false;

        # -------------- Driver --------------
        #driver.displaylink = true;
        #driver.nvidia.enable = true;
        #driver.nvidia.cache = true;

        # -------------- Audio --------------
        audio.bluetooth = true;
        audio.musnix = false;
        audio.pipewire.enable = true;
        audio.pipewire.lowlatency = false;

        # -------------- Gaming --------------
        #gaming.steam = true;
        #gaming.gamemode = true;
        #gaming.controller = true;

        # -------------- Services --------------
        #services.android.enable = true;
        #services.docker.enable = true;
        #services.endlessh.enable = true;
        #services.flatpak.enable = true;
        #services.grafana.enable = true;
        #services.i2pd.enable = true;
        #services.locate.enable = true;
        services.qbittorrent-nox.enable = true;
        #services.sql.enable = true;
        services.ssh.configuration = "laptop"; # laptop, server
        services.ssh.enable = true;
        services.sshfs.enable = true;
        #services.syncthing.enable = true;
        #services.wine.enable = true;
        #services.xmr.enable = true;

        # -------------- Services - Ports --------------
        #services.ssh.port = 2001;
        #services.grafana.port = 2002;
        #services.service1.port = 2002;
        #services.service2.port = 2002;
    };
}
