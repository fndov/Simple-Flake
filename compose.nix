# Make sure to add this to your bookmarks: https://search.nixos.org/options
# This is where common options are set so you don't have to repeat yourself across files
{ settings, ... }: {
  networking.hostName = "nixos";
  system.stateVersion = "25.05";
  time.timeZone = settings.timeZone;

  home-manager.users.${settings.account.name} = {
    programs.home-manager.enable = true;
    home.stateVersion = "25.05";
  };

  users.users.${settings.account.name} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "@wheel" ];

  nix.gc.automatic = true;

  services.zram-generator.enable = true;

  networking.firewall.enable = true;
  networking.networkmanager.enable = true;
  # services.openssh.enable = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.plymouth.enable = true;

  # Uncomment your drive type:
  boot.loader.grub.device =
  # "/dev/vda";     /* Virtual drive     */
  # "/dev/sda";     /* Physical drive    */
  # "/dev/nvme0n1"; /* Solid state drive */
}
