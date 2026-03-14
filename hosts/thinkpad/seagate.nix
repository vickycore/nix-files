{ ... }:
{
  # Prevent auto-mounting
  #services.udev.extraRules = ''
  #  ENV{ID_FS_UUID}=="DAAE13C9010C6E56", ENV{UDISKS_IGNORE}="1"
  #'';

  # Mounts my USB 2TB HDD to /mnt/storage
  # nofail -> boot succeeds even if HDD isn't plugged in
  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/DAAE13C9010C6E56";
    fsType = "ntfs-3g";
    options = [ "uid=1000" "gid=100" "umask=022" "nofail" ];
  };
}
