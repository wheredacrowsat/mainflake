{ inputs, pkgs, ...}: 
{
  home.packages = with pkgs; [
    swww
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    };
}
