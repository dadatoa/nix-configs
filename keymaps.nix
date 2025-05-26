{
  globals.mapleader = " ";
  keymaps = [
    {
      mode = [ "n" ];
      key = "<c-k>";
      action = ":wincmd k<CR>";
    }
    {
      mode = [ "n" ];
      key = "<c-j>";
      action = ":wincmd j<CR>";
    }
    {
      mode = [ "n" ];
      key = "<c-h>";
      action = ":wincmd h<CR>";
    }
    {
      mode = [ "n" ];
      key = "<c-l>";
      action = ":wincmd l<CR>";
    }

    ## neo-tree keymaps
    {
      mode = [ "n" ];
      key = "<C-n>";
      action = "<cmd>Neotree toggle<cr>";
      options = { desc = "Open/Close Neotree"; };
    }

    ## Oil keymaps
    {
      mode = [ "n" ];
      key = "-";
      action = ":Oil<cr>";
    }
    {
      mode = [ "n" ];
      key = "--";
      action = ":Oil --float<cr>";
    }
  ];
}
