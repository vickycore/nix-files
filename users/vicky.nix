{ pkgs, ... }:

{
  imports = [
    ../home/base.nix
    ../home/i3
    ../home/programs
    ../home/rofi
    ../home/shell
  ];
  
  users.users.vicky.shell = "zsh"; # TODO: this feels illegal

  programs.git = {
    settings = {
      user = {
        name = "Vicky Bala";
        email = "vikrambala.va@gmail.com";
      };
    };
  };
}
