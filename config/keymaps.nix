{
  vim.keymaps = [
    # i know im a bitch but this annoys me
    {
      key = "q:";
      action = "<Nop>";
      mode = "n";
      noremap = true;
    }

    # force quit
    {
      key = "<leader>qq";
      action = "<cmd>q!<cr>";
      mode = "n";
      desc = "Force Quit";
    }

    # move to windows with hjkl <vim bindings>
    {
      key = "<C-h>";
      action = "<C-w>h";
      mode = "n";
      desc = "Go to Left Window";
      #remap = true;
    }
    {
      key = "<C-j>";
      action = "<C-w>j";
      mode = "n";
      desc = "Go to Lower Window";
      #remap = true;
    }
    {
      key = "<C-k>";
      action = "<C-w>k";
      mode = "n";
      desc = "Go to Upper Window";
      #remap = true;
    }
    {
      key = "<C-l>";
      action = "<C-w>l";
      mode = "n";
      desc = "Go to Right Window";
      #remap = true;
    }

    # better indenting
    {
      key = "<";
      action = "<gv";
      mode = "v";
    }
    {
      key = ">";
      action = ">gv";
      mode = "v";
    }

    # commenting
    {
      key = "gco";
      action = "o<esc>Vcx<esc>normal gcc<cr>fxa<bs>";
      mode = "n";
      desc = "Add comment below";
    }
    {
      key = "gcO";
      action = "O<esc>Vcx<esc>normal gcc<cr>fxa<bs>";
      mode = "n";
      desc = "Add comment Above";
    }

    # new file
    {
      key = "<leader>fn";
      action = "<cmd>enew<cmd>";
      mode = "n";
      desc = "New file";
    }

    # windows
    {
      key = "<leader>-";
      action = "<C-W>s";
      mode = "n";
      desc = "Split window below";
      #remap = true;
    }
    {
      key = "<leader>|";
      action = "<C-W>v";
      mode = "n";
      desc = "Split window right";
      #remap = true;
    }
    {
      key = "<leader>wd";
      action = "<C-W>c";
      mode = "n";
      desc = "Delete Window";
      #remap = true;
    }
    #################################
    ############ PLUGINS ############
    #################################
    # telescope -- cee the rest in telescope.nix
    #{
    #  key = "<leader>f";
    #  action = "";
    #  desc = "+Telescope";
    #}

    ## nvim-tree
    #{
    #  key = "<leader>e";
    #  action = "<cmd>NvimTreeToggle<CR>";
    #  mode = "n";
    #  desc = "Toggle file explorer";
    #}

    ## noice
    {
      key = "<leader>n";
      action = "";
      mode = "n";
      desc = "+noice";
    }
    {
      key = "<leader>nl";
      action = "<cmd>NoiceLast<CR>";
      mode = "n";
      desc = "Noice Last Message";
    }
    {
      key = "<leader>nh";
      action = "<cmd>NoiceHistory<CR>";
      mode = "n";
      desc = "Noice History";
    }
    {
      key = "<leader>na";
      action = "<cmd>NoiceAll<CR>";
      mode = "n";
      desc = "Noice Allah";
    }
    {
      key = "<leader>nd";
      action = "<cmd>NoiceDismiss<CR>";
      mode = "n";
      desc = "Noice Dismiss";
    }
    {
      key = "<leader>nf";
      action = "<cmd>NoicePick<CR>";
      mode = "n";
      desc = "Noice Picker (Telescope)";
    }

    # harpoon
    # todo
    {
      key = "<leader>t";
      action = "";
      mode = "n";
      desc = "+Todo";
    }
    {
      key = "<leader>td";
      action = "";
      mode = "n";
      desc = "+Todo";
    }
    # oil
    {
      key = "<leader>o";
      action = "<cmd>Oil<CR>";
      mode = "n";
      desc = "+Oil";
    }
  ];
}
