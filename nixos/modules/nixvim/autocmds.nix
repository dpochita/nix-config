{
  programs.nixvim = {
    autoGroups = {
      nixvim-highlight-yank = {
        clear = true;
      };
    };
    autoCmd = [
      {
        event = [ "TextYankPost" ];
        desc = "Highligh when yanking text";
        group = "nixvim-highlight-yank";
        callback = {
          __raw = "function() vim.highlight.on_yank() end";
        };
      }
    ];
  };
}
