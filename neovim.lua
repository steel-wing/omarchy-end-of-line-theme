return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
  },

  config = function()
    local nightfox = require('nightfox')
    local Shade = require('nightfox.lib.shade')
    local c = require('nightfox.lib.color')

    local end_of_line_palette = {
      -- Base "End Of Line" Palette Overrides
      bg0 = "#000000", bg1 = "#000000", bg2 = "#000000", bg3 = "#000000", bg4 = "#000000",
      fg0 = "#FFFFFF", fg1 = "#FFFFFF", fg2 = "#FFFFFF", fg3 = "#FFFFFF",
      sel0 = "#333333",
      sel1 = "#999999",
      comment = "#999999",
      white = Shade.new( "#FFFFFF", "#FFFFFF",  "#FFFFFF"),
      black = Shade.new("#000000", "#000000", "#000000"),

      -- Lualine Palette Extensions
      lualine_normal_bg = "#FFFFFF",
      lualine_insert_bg = "#FFFFFF",
      lualine_visual_bg = "#FFFFFF",
      lualine_command_bg = "#FFFFFF",
      lualine_inactive_bg = "#000000",

      -- Treesitter Palette Extensions
      ts_parameter = "#D398A7",
      ts_property = "#EAEAEA",
    }

    local final_palettes = {
      carbonfox = require('nightfox.lib.collect').deep_extend(
        require('nightfox.palette').load('carbonfox'),
    end_of_line_palette
      )
    }

    local specs = {
      carbonfox = {
        syntax = {
          keyword = "white", -- "local", "function", "if"
          conditional = "white",
          statement = "white",
          func = "white",
          string = "white",
          number = "white",
          operator = "white",
          variable = "white",
          ident = "white",
          const = "white",
          type = "white",
          field = "white",
          comment = "comment",
        },
        diag = {
            error = "comment",
            warn = "comment",
            info = "comment",
            hint = "comment",
        }
      }
    }

    local groups = {
      all = {
        -- Base Groups
        Whitespace = { fg = "palette.black.bright" },
        NonText = { fg = "palette.black.bright" },
        IncSearch = { bg = "palette.sel1" },

        -- Noice Cmdline Overrides
        NoiceCmdlinePopupBorder = { fg = "palette.fg3" },
        NoiceCmdlinePopupTitle = { fg = "palette.fg3", style = "bold" },
        NoiceCmdlinePopupBorderSearch = { fg = "palette.fg3" },
        NoiceCmdlinePopupTitleSearch = { fg = "palette.fg3", style = "bold" },
        NoiceCmdLineIcon = { fg = "palette.red" },

        -- Neo-tree overrides
        NeoTreeNormal = { bg = "palette.bg0" },
        NeoTreeNormalNC = { link = "NeoTreeNormal" },
        NeoTreeDirectoryName = { fg = "palette.fg3" },
        NeoTreeDirectoryIcon = { fg = "palette.fg3" },
        NeoTreeRootName = { fg = "palette.white", style = "bold" },
        NeoTreeGitAdded = { fg = "palette.white" },
        NeoTreeGitModified = { fg = "palette.white" },
        NeoTreeGitDeleted = { fg = "palette.white" },
        NeoTreeGitIgnored = { fg = "palette.comment" },
        NeoTreeC = { fg = "palette.sel1", bg = "palette.sel0" },

        -- Dashboard overrides
        SnacksDashboardHeader = { fg = "palette.fg3" },
        SnacksDashboardIcon = { fg = "palette.fg1" },
        SnacksDashboardDir = { fg = "palette.orange" },
        SnacksDashboardFile = { fg = "palette.fg3" },
        SnacksDashboardFooter = { fg = "palette.fg3" },
        SnacksDashboardKey = { fg = "palette.orange" },
        SnacksDashboardDesc = { fg = "palette.fg1" },
        SnacksDashboardSpecial = { fg = "palette.fg1" },

        -- Treesitter overrides
        ["@comment"] = { fg = "palette.comment", style = "italic" },
        ["@keyword"] = { fg = "palette.white", style = "bold" },
        ["@keyword.function"] = { fg = "palette.white", style = "bold" },
        ["@keyword.operator"] = { fg = "palette.white", style = "bold" },
        ["@function"] = { fg = "palette.white", style = "bold" },
        ["@function.builtin"] = { fg = "palette.white", style = "bold" },
        ["@function.call"] = { fg = "palette.white" },
        ["@string"] = { fg = "palette.white" },
        ["@number"] = { fg = "palette.white" },
        ["@operator"] = { fg = "palette.white" },
        ["@variable"] = { fg = "palette.white" },
        ["@constant"] = { fg = "palette.white" },
        ["@type"] = { fg = "palette.white" },
        ["@variable.parameter"] = { fg = "palette.ts_parameter", style = "italic" },
        ["@property"] = { fg = "palette.ts_property" },
        ["@field"] = { fg = "palette.ts_property" },
      }
    }

    nightfox.setup({
      options = {
        style = "carbonfox",
        terminal_colors = true,
        dim_inactive = true,
        styles = { comments = "italic", functions = "bold", keywords = "bold" },
        modules = {
          neotree = true,
          treesitter = true,
        },
      },
      palettes = final_palettes,
      specs = specs,
      groups = groups
    })

    vim.cmd("colorscheme carbonfox")

    -- Lualine overrides
    local lualine_theme = {
      normal = {
        a = { fg = end_of_line_palette.bg0, bg = end_of_line_palette.lualine_normal_bg, gui = "bold" },
        b = { fg = end_of_line_palette.fg1, bg = end_of_line_palette.lualine_inactive_bg },
        c = { fg = end_of_line_palette.fg2, bg = end_of_line_palette.lualine_inactive_bg },
      },
      insert = {
        a = { fg = end_of_line_palette.bg0, bg = end_of_line_palette.lualine_insert_bg, gui = "bold" },
        b = { fg = end_of_line_palette.fg1, bg = end_of_line_palette.lualine_inactive_bg },
        c = { fg = end_of_line_palette.fg2, bg = end_of_line_palette.lualine_inactive_bg },
      },
      visual = {
        a = { fg = end_of_line_palette.bg0, bg = end_of_line_palette.lualine_visual_bg, gui = "bold" },
        b = { fg = end_of_line_palette.fg1, bg = end_of_line_palette.lualine_inactive_bg },
        c = { fg = end_of_line_palette.fg2, bg = end_of_line_palette.lualine_inactive_bg },
      },
      command = {
        a = { fg = end_of_line_palette.bg0, bg = end_of_line_palette.lualine_command_bg, gui = "bold" },
        b = { fg = end_of_line_palette.fg1, bg = end_of_line_palette.lualine_inactive_bg },
        c = { fg = end_of_line_palette.fg2, bg = end_of_line_palette.lualine_inactive_bg },
      },
      inactive = {
        a = { fg = end_of_line_palette.fg3, bg = end_of_line_palette.lualine_inactive_bg },
        b = { fg = end_of_line_palette.fg3, bg = end_of_line_palette.lualine_inactive_bg },
        c = { fg = end_of_line_palette.comment, bg = end_of_line_palette.lualine_inactive_bg },
      },
    }

   require('lualine').setup({
      options = {
        theme = lualine_theme,
      },
    })

  end,

}