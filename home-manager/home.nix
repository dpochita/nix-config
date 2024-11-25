{
  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username = "songlin";
    homeDirectory = "/home/songlin";
    stateVersion = "25.05"
  }
}
