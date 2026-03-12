{ username, ... }:

{
  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    # No clue what this does tbh
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}
