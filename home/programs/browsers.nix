{
  pkgs,
  config,
  helium,
  username,
  ...
}: {
  programs = {
    firefox = {
      enable = true;
      profiles.${username} = {};
    };
  };

  home.packages = [ helium.packages.${pkgs.system}.default ];
}
