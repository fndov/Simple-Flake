{ ... }: {

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.deepin.enable = true;
  services.displayManager.defaultSession = "dde-x11";
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "nixi";

  # Audio
  security.rtkit.enable = true;
  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.alsa.support32Bit = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.jack.enable = true;

  # Boot screen, take out to see systemd logs
  boot.plymouth.enable = true;
}
