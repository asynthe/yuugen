{
    imports = [
	    ../../modules/disko/btrfs_luks.nix # Disko configuration
        ../../profiles # Import all the custom options.
        ./vmhardware.nix # Import hardware scan.

	    # Server
        ../../modules/srv/shell.nix
        ../../modules/pkgs/minimal.nix
    ];
}
