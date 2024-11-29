{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      closeIfLastWindow = true;

      filesystem = {
        window = {
          mappings = {
            "\\" = "close_window";
          };
        };
      };
      window = {
        width = 30;
      };
    };

    keymaps = [
      {
        key = "\\";
        action = "<cmd>Neotree reveal<cr>";
        options = {
          desc = "NeoTree reveal";
        };
      }
    ];
  };
}
