{ config, lib, user, ... }:
with lib;
let
    cfg = config.gaming;
in {
    options.gaming.gamemode = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enable Gamemode to get more performance in games.
        '';
    };

    config = mkIf cfg.gamemode {

        # Better performance on games. Use with `gamemoderun`.
        users.users.${user}.extraGroups = [ "gamemode" ];
        programs.gamemode = {
            enable = true;
	        enableRenice = true;
	        #settings = ;
        };
    };
}
