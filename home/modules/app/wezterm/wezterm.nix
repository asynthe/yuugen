{ config, inputs, lib, pkgs, ... }: {

    programs.wezterm = {
        enable = true;
        #package = inputs.wezterm.packages.${pkgs.system}.default;
        enableBashIntegration = config.programs.bash.enable;
        enableZshIntegration = config.programs.zsh.enable;
        extraConfig = builtins.readFile ../../../../dots/wezterm/config.lua;

        # This disables as nix writes into the file.
	    #extraConfig = config.lib.file.mkOutOfStoreSymlink ./config.lua;
    };

    programs.zsh.shellAliases = lib.mkIf config.programs.zsh.enable {
        img = "wezterm imgcat";
    };

    home = {
        sessionVariables = { TERM = "wezterm"; };
        packages = builtins.attrValues {
            inherit (pkgs)
                alsa-utils
            ;
        };
    };
}
