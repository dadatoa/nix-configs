{
  globals.mapleader = " ";
  keymaps = [
    {
      mode = ["n"];
      key = "<c-k>";
      action = ":wincmd k<CR>";
    }
    {
      mode = ["n"];
      key = "<c-j>";
      action = ":wincmd j<CR>";
    }
    {
      mode = ["n"];
      key = "<c-h>";
      action = ":wincmd h<CR>";
    }
    {
      mode = ["n"];
      key = "<c-l>";
      action = ":wincmd l<CR>";
    }
  ];
}
