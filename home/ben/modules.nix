{
    imports = [

        ../../secrets/secrets_home.nix

	    # Apps
	    ../modules/app/hyprland
	    ../modules/app/lf
	    ../modules/app/librewolf
	    ../modules/app/mpd
	    ../modules/app/ncmpcpp
	    ../modules/app/nvim
	    ../modules/app/vscode
	    ../modules/app/wezterm
        ../modules/app/gpg

        # Single files
                
	    ../modules/pkgs/security.nix # Pentesting.
        ../modules/pkgs/minimal.nix # No GUI.
        ../modules/pkgs/pkgs.nix
        ../modules/pkgs/pkgs_test.nix

        # Apps
	    ../modules/app/alacritty.nix
        #../modules/app/bash.nix # bash shell.
	    ../modules/app/bat.nix
	    ../modules/app/direnv.nix
        #../modules/app/emacs.nix
        ../modules/app/eza.nix
        #../modules/app/fbterm.nix
        ../modules/app/git.nix
        ../modules/app/mako.nix
	    ../modules/app/mpv.nix
	    ../modules/app/obs.nix
        ../modules/app/spotifyd.nix
        ../modules/app/starship.nix
        #../modules/app/swayidle.nix
        #../modules/app/swayosd.nix
        ../modules/app/tmux.nix
        ../modules/app/vis.nix
        ../modules/app/wayfire.nix
        ../modules/app/wofi.nix
        ../modules/app/yazi.nix
        ../modules/app/zathura.nix
        ../modules/app/zoxide.nix
        ../modules/app/zsh.nix

	    # Game -> Moved to option
        #../modules/game/emulators.nix
        #../modules/game/games.nix
        #../modules/game/tools.nix

	    # System
        ../modules/sys/fonts.nix
        ../modules/sys/ime.nix
        ../modules/sys/settings.nix
        ../modules/sys/stylix.nix
        #../modules/sys/uutils-replace.nix
        ../modules/sys/var.nix
        #../modules/sys/xdg.nix
        
        # systemd services + timers
        ../modules/sysd/backup_web.nix
        #../modules/sysd/swww_randomize.nix
    ];
}
