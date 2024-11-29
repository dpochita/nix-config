{
  programs.nixvim = {
    plugins.which-key = {
      enable = true;
      # Document existing key chains
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>c";
            group = "[C]ode";
          }
          {
            __unkeyed-1 = "<leader>d";
            group = "[D]ocument";
          }
          {
            __unkeyed-1 = "<leader>r";
            group = "[R]ename";
          }
          {
            __unkeyed-1 = "<leader>f";
            group = "[F]ind";
          }
          {
            __unkeyed-1 = "<leader>w";
            group = "[W]orkspace";
          }
          {
            __unkeyed-1 = "<leader>t";
            group = "[T]oggle";
          }
          {
            __unkeyed-1 = "<leader>g";
            group = "[G]it";
            mode = [
              "n"
              "v"
            ];
          }
        ];
      };
    };
  };
}
