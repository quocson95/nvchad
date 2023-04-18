local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"markdown",
		"markdown_inline",
		"go",
		"typescript",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		"prettier",

		-- go
		"gopls",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
