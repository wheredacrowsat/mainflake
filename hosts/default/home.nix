{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "cardinal";
  home.homeDirectory = "/home/cardinal";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/cardinal/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
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
  wayland.windowManager.hyprland = {
  enable = true;

    settings = {

    "$mod" = "SUPER";
   
    "exec-once" = "swww-daemon & swww img $HOME/nixos/wallpaper.png";
 
    input  = {

    accel_profile = "flat";

    };
  
    monitor = [
    "DP-3, 1920x1080@143.98, 1920x0, auto"
    "HDMI-A-1, 1920x1080@143.98, 0x0, auto"
    ];

    bind = [
      "$mod, Return, exec, alacritty"      
      "$mod, d, exec, rofi -show drun"
      "SUPER_SHIFT, Q, killactive"
      "$mod, j, movefocus, l"
      "$mod, k, movefocus, u"
      "$mod, l, movefocus, d"
      "$mod, semicolon, movefocus, r"
      "$mod, f, togglefloating"
      "$mod, m, exit"       
      ];
    
    bindm = [
      "$mod, mouse:272, movewindow"
    ];

    bindel = [
      " , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      " , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];

    };

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
