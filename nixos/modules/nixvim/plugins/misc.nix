{
  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;

      sleuth.enable = true;

      todo-comments = {
        enable = true;
        settings = {
          sign = true;
        };
      };
    };
  };
}
