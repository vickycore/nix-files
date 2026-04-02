{ config, musicDir, ... }:

{
  services.navidrome = {
    enable = true;

    settings = {
      Address = "0.0.0.0"; 
      Port = 4533;  # default port
      MusicFolder = "${musicDir}";
    };
  };
}
