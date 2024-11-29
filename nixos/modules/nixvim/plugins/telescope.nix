{ pkgs, ... }:
{
  programs.nixvim = {
    # install grep
    extraPackages = with pkgs; [
      ripgrep
    ];
    plugins.telescope = {
      enable = true;

      keymaps = {
        "<leader>fh" = {
          mode = "n";
          action = "help_tags";
          options = {
            desc = "[F]ind [H]elp";
          };
        };
        "<leader>fk" = {
          mode = "n";
          action = "keymaps";
          options = {
            desc = "[F]ind [K]eymaps";
          };
        };
        "<leader>ff" = {
          mode = "n";
          action = "find_files";
          options = {
            desc = "[F]ind [F]iles";
          };
        };
        "<leader>fs" = {
          mode = "n";
          action = "builtin";
          options = {
            desc = "[F]ind [S]elect Telescope";
          };
        };
        "<leader>fw" = {
          mode = "n";
          action = "grep_string";
          options = {
            desc = "[F]ind current [W]ord";
          };
        };
        "<leader>fg" = {
          mode = "n";
          action = "live_grep";
          options = {
            desc = "[F]ind by [G]rep";
          };
        };
        "<leader>fd" = {
          mode = "n";
          action = "diagnostics";
          options = {
            desc = "[F]ind [D]iagnostics";
          };
        };
        "<leader>fr" = {
          mode = "n";
          action = "resume";
          options = {
            desc = "[F]ind [R]esume";
          };
        };
        "<leader>fo" = {
          mode = "n";
          action = "oldfiles";
          options = {
            desc = "[F]ind Recent Files ('.' for repeat)";
          };
        };
        "<leader><leader>" = {
          mode = "n";
          action = "buffers";
          options = {
            desc = "[ ] Find existing buffers";
          };
        };
      };

      extensions = {
        fzf-native.enable = true;
        ui-select.enable = true;
      };
      settings = {
        extensions.__raw = "{ ['ui-select'] = { require('telescope.themes').get_dropdown() } }";
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>/";
        action.__raw = ''
          function()
            require('telescope.builtin').current_buffer_fuzzy_find(
              require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false
              }
            )
          end
        '';
        options = {
          desc = "[/] Fuzzily search in current buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>f/";
        action.__raw = ''
          function()
            require('telescope.builtin').live_grep {
              grep_open_files = true,
              prompt_title = 'Live Grep in Open Files'
            }
          end
        '';
        options = {
          desc = "[F]ind [/] in Open Files";
        };
      }
    ];
  };
}
