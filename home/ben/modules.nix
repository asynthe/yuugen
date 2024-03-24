{ config, ... }: {

    imports = [

        ./modules/pkgs.nix

	#./modules/app/nvim
	./modules/app/lf
        ./modules/app/comms.nix # Discord, IRC, Signal, Telegram.
        ./modules/app/emacs.nix
        ./modules/app/jp.nix # Packages for japanese learning / immersion.
	./modules/app/yazi.nix

        ./modules/audio/mpd.nix

	#./modules/game/emulators.nix
	./modules/game/games.nix
	#./modules/game/tools.nix

        ./modules/dev/ai.nix
        ./modules/dev/latex.nix
        ./modules/dev/python.nix

	./modules/sys/nix_settings.nix
        ./modules/sys/gtk.nix

	# systemd services + timers
	./modules/sysd/backup_bookmarks.nix
    ];
}