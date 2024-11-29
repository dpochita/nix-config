{
  programs.nixvim = {
    plugins.mini = {
      enable = true;

      modules = {
        ai = {
          n_lines = 500;
        };
        surround = { };
        statusline = { };
        pairs = { };
      };
    };
    extraConfigLua = ''
      require('mini.statusline').section_location = function()
        return '%2l:%-2v'
      end
    '';
  };
}
