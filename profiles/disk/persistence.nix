{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.disk.persistence;
in {
    options.meta.disk.persistence = {
        enable = mkEnableOption "Enable system persistence.";
        #type = mkOption {
            #type = str;
            #default = "tmpfs";
            #description = "Type of persistence to be enabled.";
        #};
    };

    config = mkIf cfg.enable {
        #assertions = [
            #{
                #assertion = cfg.enable -> cfg.type;
                #message = "meta.disk.persistence.enable requires meta.disk.persistence.type to be specified";
            #}
        #];

        security.sudo.extraConfig = ''
          # rollback results in sudo lectures after each reboot
          Defaults lecture = never
        '';

        fileSystems = {
            "/persist".neededForBoot = true;
            "/var/log".neededForBoot = true;
        };

        # This copies files to /persist, then from /persist to where specified.
        environment.persistence."/persist" = {
            directories = [
	            "/etc/NetworkManager/system-connections"
	            "/etc/nixos"
	            "/var/lib/bluetooth"
	            "/var/lib/nixos"
	            "/var/lib/systemd/coredump"

                # MOVE THESE NEXT FILES
	            #"/var/lib/tailscale" -> tailscale.nix if persistence is enabled.
                #"/etc/secureboot" -> secure.nix if persistence is enabled.
	        ];
            files = [ "/etc/machine-id" ];
        };
    };
}