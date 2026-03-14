{ pkgs, ... }:

{
  imports = [
    ../../home/base.nix
    ../../home/i3
    ../../home/programs
    ../../home/rofi
    ../../home/shell
  ];

  programs.git = {
    settings = {
      user = {
        name = "Vicky Bala";
        email = "vikrambala.va@gmail.com";
      };
    };
  };
}
