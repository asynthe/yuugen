{ config, pkgs, ... }: {

    services.openssh = {
        enable = true;
        allowSFTP = true; # enable the STFP subsystem, use commands sftp and sshfs.
        #startWhenNeeded = true; # sshd will be socket-activated, it will start for each incoming connection.
        #knownHosts = ; # ragenix?
    };

    #users.users.${username}.openssh.authorizedKeys.keys = [
    #""
    #];

    #programs.ssh = {
        #startAgent = true; # Start ssh-agent at boot.
        #agentTimeout = "null"; # How long to keep private keys in memory. Use "null" to keep forever.
    #};
}
