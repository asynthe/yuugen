{ config, ... }: {

  # The Basic.nix should have the filesystems and everything.
  # This one should be used to enable more specific options like nvidia drivers
  # Audio, network, cybersecurity things, services
  # Although maybe it can also be used to prefer a file system over other(?)
  # Like if i choose this then mkForce disable the ext4 default.

  imports = [

    # User stuff (Move?)
    ./user

    # Drivers
    ./driver/accelerated_video_playback.nix
    #./driver/amd.nix
    #./driver/displaylink.nix
    ./driver/intel.nix
    ./driver/nvidia/nvidia.nix
    ./driver/nvidia/offload.nix
    #./driver/nvidia/sync.nix
    #./driver/nvidia/reverse_sync.nix

    # Audio
    ./audio/audio.nix
    #./audio/pipewire.nix
    #./audio/jack.nix

    # Network
    #./net/dns.nix
    #./net/elastic.nix
    #./net/i2p.nix
    ./net/irc.nix
    #./net/irc_server.nix
    ./net/mosh.nix
    ./net/openvpn.nix
    ./net/ssh.nix
    #./net/tailscale.nix
    ./net/vnc.nix
    #./net/zero_tier_one.nix

    # Cybersecurity
    ./sec/gpg.nix

    # Server
    ./server/android.nix # Android tools and packages.
    ./server/libvirt.nix # Virt-manager / libvirt.
    ./server/mpd.nix # MPD.
    ./server/syncthing.nix
    ./server/virtualbox.nix
    ./server/wine.nix # Wine configuration.
    #./server/xmr.nix # Monero.

    # Extra
    ./extra/gaming.nix
  ]; 

}
