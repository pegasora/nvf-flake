{
  pkgs,
  lib,
  ...
}:
{
  vim.startPlugins = [ ];

  vim.luaConfigRC.superfile = lib.nvim.dag.entryAnywhere ''
    -- Superfile integration with proper file picker using --chooser-file
    local api = vim.api

    local function get_current_dir()
      local buf = api.nvim_get_current_buf()
      local bufname = api.nvim_buf_get_name(buf)
      if bufname == "" then
        return vim.fn.getcwd()
      end
      local stat = vim.loop.fs_stat(bufname)
      if stat and stat.type == "directory" then
        return bufname
      else
        return vim.fn.fnamemodify(bufname, ":h")
      end
    end

    local function open_superfile()
      local current_dir = get_current_dir()
      local chooser_file = vim.fn.tempname()
      
      -- Save current buffer info
      local current_buf = api.nvim_get_current_buf()
      local buf_is_empty = vim.fn.line('$') == 1 and vim.fn.getline(1) == ""
      
      -- Create terminal buffer with superfile in chooser mode
      vim.cmd("enew")
      local term_buf = api.nvim_get_current_buf()
      
      -- Start superfile with chooser-file flag
      local cmd = string.format("superfile --chooser-file %s %s", 
        vim.fn.shellescape(chooser_file),
        vim.fn.shellescape(current_dir))
      
      vim.fn.termopen(cmd, {
        on_exit = function(_, exit_code)
          -- Close terminal buffer
          vim.schedule(function()
            if api.nvim_buf_is_valid(term_buf) then
              vim.cmd("bdelete! " .. term_buf)
            end
            
            -- Read chosen file from temp file
            if vim.fn.filereadable(chooser_file) == 1 then
              local file = vim.fn.readfile(chooser_file)[1]
              if file and file ~= "" then
                -- If original buffer was empty, replace it
                if buf_is_empty and api.nvim_buf_is_valid(current_buf) then
                  vim.cmd("buffer " .. current_buf)
                  vim.cmd("edit " .. vim.fn.fnameescape(file))
                else
                  -- Otherwise open in new buffer
                  vim.cmd("edit " .. vim.fn.fnameescape(file))
                end
              else
                -- No file selected, go back to previous buffer
                if api.nvim_buf_is_valid(current_buf) then
                  vim.cmd("buffer " .. current_buf)
                end
              end
              -- Clean up temp file
              vim.fn.delete(chooser_file)
            else
              -- No file selected, go back to previous buffer
              if api.nvim_buf_is_valid(current_buf) then
                vim.cmd("buffer " .. current_buf)
              end
            end
          end)
        end,
      })
      
      -- Enter terminal mode
      vim.cmd("startinsert")
      
      -- Set buffer options
      vim.bo[term_buf].buflisted = false
      
      -- Add keybindings for terminal
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = term_buf, silent = true })
    end

    -- Keybinding to open superfile
    vim.keymap.set("n", "<leader>e", open_superfile, {
      desc = "Open Superfile",
      silent = true,
    })

    -- Auto-open superfile when opening a directory
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local arg = vim.fn.argv(0)
        if arg ~= "" then
          local stat = vim.loop.fs_stat(arg)
          if stat and stat.type == "directory" then
            vim.schedule(function()
              open_superfile()
            end)
          end
        end
      end,
    })
  '';
}
