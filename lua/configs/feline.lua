local feline = require("feline")


local gruvbox = {
  bg = '#3c3836',
  black = '#282828',
  yellow = '#d8a657',
  cyan = '#89b482',
  oceanblue = '#45707a',
  green = '#a9b665',
  orange = '#e78a4e',
  violet = '#d3869b',
  magenta = '#c14a4a',
  white = '#a89984',
  fg = '#a89984',
  skyblue = '#7daea3',
  red = '#ea6962',
}

local vi_mode_colors = {
	NORMAL = "green",
	OP = "green",
	INSERT = "yellow",
	VISUAL = "oceanblue",
	LINES = "skyblue",
	BLOCK = "cyan",
	REPLACE = "red",
	COMMAND = "violet",
}

local c = {
	vim_mode = {
		provider = {
			name = "vi_mode",
			opts = {
				show_mode_name = true,
				-- padding = "center", -- Uncomment for extra padding.
			},
		},
		hl = function()
			return {
				fg = require("feline.providers.vi_mode").get_mode_color(),
				bg = "bg",
				style = "bold",
				name = "NeovimModeHLColor",
			}
		end,
		left_sep = "block",
		right_sep = "block",
	},
	gitBranch = {
		provider = "git_branch",
		hl = {
			fg = "fg",
			bg = "bg",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = "green",
			bg = "bg",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = "red",
			bg = "bg",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = {
			fg = "yellow",
			bg = "bg",
		},
		left_sep = "block",
		right_sep = "block",
	},
	separator = {
		provider = "",
	},
	fileinfo = {
		provider = {
			name = "file_info",
			opts = {
                colored_icon = false,
				type = "unique",
			},
		},
		hl = {
			style = "bold",
		},
		left_sep = " ",
		right_sep = " ",
	},
	diagnostic_errors = {
		provider = "diagnostic_errors",
		hl = {
			fg = "red",
		},
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
		hl = {
			fg = "yellow",
		},
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
		hl = {
			fg = "aqua",
		},
	},
	diagnostic_info = {
		provider = "diagnostic_info",
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = {
			fg = "purple",
			bg = "bg",
			style = "bold",
		},
		left_sep = "left_filled",
		right_sep = "block",
	},
	file_type = {
		provider = {
			name = "file_type",
			opts = {
				filetype_icon = true,
                colored_icon = false,
				case = "titlecase",
			},
		},
		hl = {
			fg = "red",
			bg = "bg",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	file_encoding = {
		provider = "file_encoding",
		hl = {
			fg = "orange",
			bg = "bg",
		},
		left_sep = "block",
		right_sep = "block",
	},
	position = {
		provider = {
            name = "position",
            opts = {
                format = "Ln {line}, Col {col}"
            }
        },
		hl = {
			fg = "green",
			bg = "bg",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	line_percentage = {
		provider = "line_percentage",
		hl = {
			fg = "aqua",
			bg = "bg",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	scroll_bar = {
		provider = {
            name = "scroll_bar",
            opts = {
                reverse = true
            }
        },
		hl = {
			fg = "bg",
            bg = "yellow",
			style = "bold",
		},
	},
}

local left = {
	c.vim_mode,
	c.gitBranch,
	c.gitDiffAdded,
    c.gitDiffRemoved,
	c.gitDiffChanged,
	-- c.separator,
	c.diagnostic_errors,
	c.diagnostic_warnings,
	c.diagnostic_info,
	c.diagnostic_hints,
}

local middle = {
	c.fileinfo,
}

local right = {
	c.file_type,
	c.file_encoding,
	c.position,
	-- c.line_percentage,
	-- c.scroll_bar,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		left,
		middle,
        right,
	},
}

feline.setup({
    components = components,
    theme = gruvbox,
    vi_mode_colors = vi_mode_colors,
    disable = {
        filetypes = {
            '^NvimTree$',
            '^packer$',
            '^startify$',
            '^fugitive$',
            '^fugitiveblame$',
            '^qf$',
        },
        buftypes = {
            '^terminal$',
        },
    },
})
