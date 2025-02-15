{ ... }:

{


  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
      exec-once = [
      "swww-daemon &" 
      "swww img $HOME/nixos/modules/home-manager/programs/desktop/wallpaper.png"
    ];

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

}

