{pkgs, ...}: {
  programs = {
    eza = {
      enable = true;
      icons = true;
      enableAliases = true;
    };

    skim = {
      enable = true;
      #package = ;
      #defaultCommand = ;
      #defaultOptions = ;
    };
    fzf = {
      enable = true;
      #package = ;
      #colors = ;
      #tmux.enableShellIntegration = true;
      #tmux.ShellIntegrationOptions = ;
    };

    git = {
      enable = true;
      #userName = "Benjamin Dunstan";
      #userEmail = "benjadunstan@gmail.com";
    };
    imv = {
      enable = true;
      #package = ;
      #settings = ;
    };

    zoxide = {
      enable = true;
      #package = ;
      #options = ;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };

  home.packages = builtins.attrValues {
    inherit
      (pkgs)

      # WMs
      wayfire
      
      ##### TESTING #####
      
      #clamav
      #clamsmtp # antivirus
      
      # Bluetooth
      
      blueman
      pdftk #pdfchain # Latex file?
      hplip # -> cups.nix / printer.nix
      
      # GNU TOOLS
      
      at
      #cowsay
      
      #file
      
      #which
      
      #tree
      
      #gnused
      
      #gnutar
      
      #gawk
      
      #zstd
      
      #vscodium #vscodium-fhs # test how compatible vscode is w nixos
      
      # Terminals
      
      alacritty
      kitty
      kitty-themes
      cool-retro-term
      # Utils
      
      gparted
      ventoy-full #ventoy
      #etcher
      
      # Nix
      
      deploy-rs
      nixops_unstable #nixops
      direnv
      nix-direnv
      nix-output-monitor # use as `nom`, works like `nix` but with more details
      btop

      # Bluetooth
      bluez
      bluez-tools
      bluetuith # bluetooth ncurses frontend
      
      # GUI
      
      obsidian
      # PDF
      
      zathura # minimalistic pdf viewer
      xournalpp
      masterpdfeditor4 #masterpdfeditor
      pdfarranger
      # Browser
      
      firefox
      librewolf #librewolf-unwrapped
      brave #nyxt #links2
      arti
      tor
      tor-browser-bundle-bin
      # Torrents
      
      #aria #ariang
      
      qbittorrent #qbittorrent-nox
      #radarr #lidarr #sonarr
      
      # Astronomy
      
      stellarium
      celestia
      libnova
      # OCR
      
      tesseract
      qt-box-editor # OCR engine
      #easyocr
      
      # Officematics
      #libreoffice
      slides
      #zoom-us
      #slack #slack-cli #slack-term # testing
      
      #onedrive
      
      # Task management
      
      taskwarrior
      #taskserver
      
      #taskell # command-line kanban board/task manager
      
      #vit
      
      #todo-txt-cli
      
      # Archives
      
      zip
      unzip
      p7zip
      xz
      rar #unrar #rar2fs
      
      #torrent7z
      
      #mdf2iso
      
      # Useful Extra (Not tested)
      
      jq
      jansson
      attr
      cacert
      #log4cxx # asked by davinci-resolve (?)
      
      # Replace in future
      keepassxc # change into password store
      bless
      hexedit
      hexyl # Hex editor
      
      # PCB Design
      #kicad-unstable
      #kicad #kicad-small
      
      # File managers
      
      pcmanfm
      # Thumbnailers (for PCmanFM)
      
      nufraw-thumbnailer # .raw files (raw-thumbnailer)
      evince # Adobe .pdf files
      ffmpegthumbnailer # Video files
      freetype # Font files
      libgsf # .odf files
      
      # Terminal drop-down (Scratchpad?)
      
      tdrop
      libqalculate

      unar
      ;

    # Previewers for PCmanFM
    inherit (pkgs.libsForQt5) dolphin; # File manager
    inherit (pkgs.xfce) thunar tumbler; # Image files

    # Alarm Clocks
    inherit (pkgs.gnome) gnome-clocks;
    inherit (pkgs.libsForQt5) kalarm;
  };
}
# # It is sometimes useful to fine-tune packages, for example, by applying
# # overrides. You can do that directly here, just don't forget the
# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
# # fonts?
# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
# # You can also create simple shell scripts directly inside your
# # configuration. For example, this adds a command 'my-hello' to your
# # environment:
# (pkgs.writeShellScriptBin "my-hello" ''
#   echo "Hello, ${config.home.username}!"
# '')
