{
  lib,
  pkgs,
  ...
}: {
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lspFallback = true;
        timeoutMs = 500;
      };
      notify_on_error = true;
      formatters_by_ft = {
        html = ["prettierd" "prettier"];
        css = ["prettierd" "prettier"];
        javascript = ["prettierd" "prettier"];
        typescript = ["prettierd" "prettier"];
        python = ["black" "isort"];
        lua = ["stylua"];
        nix = ["alejandra"];
        markdown = ["prettierd" "prettier"];
        yaml = ["prettierd" "prettier"];
        terraform = ["terraform_fmt"];
        bicep = ["bicep"];
        bash = ["shellcheck" "shellharden" "shfmt"];
        json = ["jq"];
        "_" = ["trim_whitespace"];
      };
    };
  };
}
