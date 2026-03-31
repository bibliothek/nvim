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
        width = 60,
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
          leave_dirs_open = true,
        },
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        commands = {
          grep_in_dir = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            if node.type ~= "directory" then
              path = vim.fn.fnamemodify(path, ":h")
            end
            require("neo-tree.command").execute({ action = "close" })
            Snacks.picker.grep({ hidden = true, dirs = { path } })
          end,
        },
        window = {
          mappings = {
            ["S"] = "grep_in_dir",
          },
        },
      },
    })
  end,
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end,
      mode = "",
      desc = "Toggle File Tree",
    },
  },
}
