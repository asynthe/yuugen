let
    filePath = ./mdadm.conf;
    fileContent = builtins.readFile filePath;
in {
    boot.swraid.mdadmConf = "${fileContent}";
    
    # RAID
    boot.initrd.services.swraid.mdadmConf = ''
      ARRAY /dev/md0 level=raid0 num-devices=2 metadata=1.2 name=nixos:0 UUID=07344cc0:b27028eb:adb9b887:069814be
      devices=/dev/nvme0n1p1,/dev/nvme1n1p1
    '';
}
