{ config, pkgs, ... }: 
{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = ["zfs"];
  services.zfs.autoScrub.enable = true;

  time.timeZone = "America/Chicago";

  nix.settings.experimental-features = ["nix-command" "flakes" ];

  networking = {
    networkmanager.enable = true;
    hostName = "bus1";
  };

  users.users.busdriver = {
      initialPassword = "stopForRedLights!";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = ["wheel" "networkmanager"];
  };

  users.users.busdriver.openssh.authorizedKeys.keyFiles = [];
  users.users.busdriver.openssh.authorizedKeys.keyFiles = [];
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = false;
    };
  };

  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    git
    htop
    btm
    tmux
    wget
    tree
    bat
  ];

  system.copySystemConfiguration = true;
  system.stateVersion = "25.05";
}
