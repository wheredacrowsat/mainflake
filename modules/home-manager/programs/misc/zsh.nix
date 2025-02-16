{ hostname, config, pkgs, ...}: 
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "gh" ];
      theme = "gnzh";
    };
    shellAliases = {

    nixcfg = "sudo vim ~/nixos";
    nixre = "sudo nixos-rebuild switch --flake ~/nixos#default";
    nixte = "sudo nixos-rebuild test --flake ~/nixos#default";
    nixtup = "sudo nixos-rebuild test --flake ~/nixos#default --upgrade";
    nixupg = "sudo nixos-rebuild switch --flake ~/nixos#default -- upgrade";
    la = "ls -a";
    
     };
    initExtraFirst = ''
      DISABLE_MAGIC_FUNCTIONS=true
      export "MICRO_TRUECOLOR=1"
      fastfetch
    '';
  };

}
