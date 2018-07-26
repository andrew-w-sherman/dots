{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = [
    pkgs.python
    pkgs.perl
    pkgs.git
    pkgs.stow
    pkgs.units
    pkgs.zsh
    pkgs.vim
    pkgs.tmux
    pkgs.gnutar
    pkgs.lshw
    pkgs.binutils
    pkgs.findutils
    pkgs.ncmpcpp
    pkgs.htop
    pkgs.python36Packages.glances
    # graphical
    pkgs.firefox
    pkgs.pavucontrol
    pkgs.discord
    pkgs.rofi
    pkgs.rxvt_unicode
    pkgs.i3status
    pkgs.i3blocks
    pkgs.nitrogen
    pkgs.qutebrowser
    # fonts
    pkgs.noto-fonts
    pkgs.mononoki
    # linux from scratch stuff
    pkgs.bison
    pkgs.gawk
    pkgs.gcc
    pkgs.gnumake
    pkgs.gnum4
  ];
}
