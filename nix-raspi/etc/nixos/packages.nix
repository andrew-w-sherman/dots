{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    git stow
    python perl
    curl wget
    vim
    units
    tmux
    gnutar
    lshw
    binutils findutils file
    ncmpcpp
    htop python36Packages.glances
    rxvt_unicode.terminfo
  ];
}
