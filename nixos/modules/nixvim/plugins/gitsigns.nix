{
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
      settings = {
        signs = {
          add = {
            text = "+";
          };
          change = {
            text = "~";
          };
          delete = {
            text = "_";
          };
          topdelete = {
            text = "‾";
          };
          changedelete = {
            text = "~";
          };
        };
      };
    };
    keymaps = [
      # Navigation
      {
        mode = "n";
        key = "]c";
        action.__raw = ''
          function()
            if vim.wo.diff then
              vim.cmd.normal { ']c', bang = true }
            else
              require('gitsigns').nav_hunk 'next'
            end
          end
        '';
        options = {
          desc = "Jump to next git [C]hange";
        };
      }
      {
        mode = "n";
        key = "[c";
        action.__raw = ''
          function()
            if vim.wo.diff then
              vim.cmd.normal { '[c', bang = true }
            else
              require('gitsigns').nav_hunk 'prev'
            end
          end
        '';
        options = {
          desc = "Jump to previous git [C]hange";
        };
      }
      # Actions
      # visual mode
      {
        mode = "v";
        key = "<leader>gs";
        action.__raw = ''
          function()
            require('gitsigns').stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end
        '';
        options = {
          desc = "stage git hunk";
        };
      }
      {
        mode = "v";
        key = "<leader>gr";
        action.__raw = ''
          function()
            require('gitsigns').reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end
        '';
        options = {
          desc = "reset git hunk";
        };
      }
      # normal mode
      {
        mode = "n";
        key = "<leader>gs";
        action.__raw = ''
          function()
            require('gitsigns').stage_hunk()
          end
        '';
        options = {
          desc = "git [s]tage hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>gr";
        action.__raw = ''
          function()
            require('gitsigns').reset_hunk()
          end
        '';
        options = {
          desc = "git [r]eset hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>gS";
        action.__raw = ''
          function()
            require('gitsigns').stage_buffer()
          end
        '';
        options = {
          desc = "git [S]tage buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>gu";
        action.__raw = ''
          function()
            require('gitsigns').undo_stage_hunk()
          end
        '';
        options = {
          desc = "git [u]ndo stage hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>gR";
        action.__raw = ''
          function()
            require('gitsigns').reset_buffer()
          end
        '';
        options = {
          desc = "git [R]eset buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>gp";
        action.__raw = ''
          function()
            require('gitsigns').preview_hunk()
          end
        '';
        options = {
          desc = "git [p]review hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>gb";
        action.__raw = ''
          function()
            require('gitsigns').blame_line()
          end
        '';
        options = {
          desc = "git [b]lame line";
        };
      }
      {
        mode = "n";
        key = "<leader>gd";
        action.__raw = ''
          function()
            require('gitsigns').diffthis()
          end
        '';
        options = {
          desc = "git [d]iff against index";
        };
      }
      {
        mode = "n";
        key = "<leader>gD";
        action.__raw = ''
          function()
            require('gitsigns').diffthis '@'
          end
        '';
        options = {
          desc = "git [D]iff against last commit";
        };
      }
      # Toggles
      {
        mode = "n";
        key = "<leader>tb";
        action.__raw = ''
          function()
            require('gitsigns').toggle_current_line_blame()
          end
        '';
        options = {
          desc = "[T]oggle git show [b]lame line";
        };
      }
      {
        mode = "n";
        key = "<leader>tD";
        action.__raw = ''
          function()
            require('gitsigns').toggle_deleted()
          end
        '';
        options = {
          desc = "[T]oggle git show [D]eleted";
        };
      }
    ];
  };
}
