return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      window = {
        position = "left",
        width = 80,
      },
      default_component_configs = {
        indent = {
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
        },
        file_size = {
          enabled = false,
        },
        type = {
          enabled = false,
        },
        last_modified = {
          enabled = false,
        },
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    })
  end,
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      mode = "",
      desc = "Toggle File Tree",
    },
  },
}
