{

  imports = [
    ./opts.nix
    ./keymaps.nix
    ./autocmds.nix
    ./plugins/bundle.nix
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    colorschemes.oxocarbon.enable = true;
  };
}
