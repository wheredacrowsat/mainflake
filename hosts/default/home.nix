{ config, pkgs, lib, ... }:

{
 
  imports = [

    ../../modules/home-manager/programs

  ];
 
  home.username = "cardinal";
  home.homeDirectory = "/home/cardinal";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };
 
  gtk = {

    enable = true;

    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };
      
      iconTheme = {
        name = "Gruvbox-Dark-Icons";
	package = pkgs.gruvbox-dark-icons-gtk;
    };

  };

  home = {
    pointerCursor = {
        package = pkgs.simp1e-cursors;
        name = "Simp1e-Gruvbox-Dark";
        size = 28;
        gtk.enable = true;
        x11.enable = true;
        hyprcursor.enable = true;
    };
  }; 
  

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
