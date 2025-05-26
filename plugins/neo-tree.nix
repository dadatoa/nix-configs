{
  plugins.neo-tree = {
    enable = true;
    };


  ## neo-tree keymaps
  keymaps = [
    {
      mode = ["n"];
      key = "<C-n>";
      action = "<cmd>Neotree toggle<cr>";
      options = {desc = "Open/Close Neotree";};
    }
  ];
}
