{ ... }:
{
  # Auto-mounts my  USB 2TB HDD
  # nofail -> boot succeeds even if HDD isn't plugged in
  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/DAAE13C9010C6E56";
    fsType = "ntfs-3g";
    options = [ "uid=1000" "gid=100" "umask=022" "nofail" ];
  };
}
