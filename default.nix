{
  # Import all your configuration modules here
  imports = [

    # global config
    ./settings.nix
    ./keymaps.nix

    # colorscheme
    ./colorschemes/catppuccin.nix

    # plugins
    ./plugins

    # dependencies
    ./dependencies.nix
  ];

}
