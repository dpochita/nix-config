{ lib, pkgs, ... }:
{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;

      settings = {
        notify_on_error = false;
        format_on_save = ''
          function(bufnr)
            local disable_filetypes = { c = true, cpp = true }
            local lsp_format_opt
            if disable_filetypes[vim.bo[bufnr].filetype] then
              lsp_format_opt = 'never'
            else
              lsp_format_opt = 'fallback'
            end
            return {
              timeout_ms = 500,
              lsp_format = lsp_format_opt,
            }
          end
        '';
        formatters_by_ft = {
          bash = [
            "shellcheck"
            "shellharden"
            "shfmt"
          ];
          nix = [
            "nixfmt"
          ];
        };
        formatters = {
          shellcheck = {
            command = lib.getExe pkgs.shellcheck;
          };
          shfmt = {
            command = lib.getExe pkgs.shfmt;
          };
          shellharden = {
            command = lib.getExe pkgs.shellharden;
          };
          nixfmt = {
            command = lib.getExe pkgs.nixfmt-rfc-style;
          };
        };
      };
    };
    keymaps = [
      {
        mode = "";
        key = "<leader>cf";
        action.__raw = ''
          function()
            require('conform').format { async = true, lsp_fallback = true }
          end
        '';
        options = {
          desc = "[C]ode [F]ormat";
        };
      }
    ];
  };
}
