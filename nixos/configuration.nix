{ inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    # ./modules/bundle.nix
  ];
  # nixpkgs.overlays = [ inputs.polymc.overlay ];

  networking.hostName = "vector"; # Define your hostname.

  time.timeZone = "Asia/Shanghai"; # Set your time zone.

  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enabling flakes

  system.stateVersion = "25.05"; # Don't change it bro
}
