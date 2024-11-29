{
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = true;

      mouse = "a";

      showmode = false;

      breakindent = true;

      undofile = true;
      swapfile = false;

      hlsearch = true;
      ignorecase = true;
      smartcase = true;

      cursorline = true;
      signcolumn = "yes";

      foldenable = false;

      updatetime = 250;
      timeoutlen = 300;

      splitright = true;
      splitbelow = true;

      inccommand = "split";

      scrolloff = 10;
    };
  };
}
