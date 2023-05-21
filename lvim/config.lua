--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

local opt = vim.opt
-------------------------------------- options ------------------------------------------
opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")
-- general
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	pattern = { "*.lua", "*.go", "*.html", "*.ts", "*.proto" },
	timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- goto preview
lvim.keys.normal_mode["gp"] = "<cmd>Lspsaga peek_definition<CR>"
lvim.keys.normal_mode["gh"] = "<cmd>Lspsaga lsp_finder<CR>"
lvim.keys.normal_mode["gt"] = "<cmd>Lspsaga peek_type_definition<CR>"

lvim.keys.normal_mode["<leader>o"] = "<cmd>Lspsaga outline<CR>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
lvim.colorscheme = "sonokai"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/configuration/language-features/language-servers>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
-- return server ~= "angularls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters, formatters and code actions <https://www.lunarvim.org/docs/configuration/language-features/linting-and-formatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ name = "gofmt" },
	{ name = "goimports" },
	{ name = "deno_fmt" },
	{ name = "stylua" },
	{ name = "clang_format" },
	{ name = "protolint" },
	--   {
	--     command = "prettier",
	--     extra_args = { "--print-width", "100" },
	--     filetypes = { "typescript", "typescriptreact" },
	--   },
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ name = "protoc_gen_lint" },
	--   { command = "flake8", filetypes = { "python" } },
	--   {
	--     command = "shellcheck",
	--     args = { "--severity", "warning" },
	--   },
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{ name = "gomodifytags" },
	{ name = "impl" },
	{ name = "refactoring" },
	-- {
	--     exe = "eslint",
	--     filetypes = { "typescript", "typescriptreact" },
	--   },
})

require("lvim.lsp.manager").setup("angularls")
lvim.builtin.treesitter.rainbow.enable = true

-- -- Additional Plugins <https://www.lunarvim.org/docs/configuration/plugins/user-plugins>
lvim.plugins = {
	{
		"sainnhe/sonokai",
		config = function() end,
	},
	{
		"fatih/vim-go",
	},
	{
		"buoto/gotests-vim",
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
	{
		"vimsence/vimsence",
	},
	{
		"mrjones2014/nvim-ts-rainbow",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		"romgrk/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				throttle = true, -- Throttles plugin updates (may improve performance)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
					-- For all filetypes
					-- Note that setting an entry here replaces all other patterns for this entry.
					-- By setting the 'default' entry below, you can control which nodes you want to
					-- appear in the context window.
					default = {
						"class",
						"function",
						"method",
					},
				},
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
	},
	{
		"sindrets/diffview.nvim",
		event = "BufRead",
	},
	{
		"f-person/git-blame.nvim",
		event = "BufRead",
		config = function()
			vim.cmd("highlight default link gitblame SpecialComment")
			vim.g.gitblame_enabled = 0
		end,
	},
	-- {
	-- 	"tzachar/cmp-tabnine",
	-- 	build = "./install.sh",
	-- 	dependencies = "hrsh7th/nvim-cmp",
	-- 	event = "InsertEnter",
	-- },
	-- {
	-- 	"karb94/neoscroll.nvim",
	-- 	event = "WinScrolled",
	-- 	config = function()
	-- 		require("neoscroll").setup({
	-- 			-- All these keys will be mapped to their corresponding default scrolling animation
	-- 			mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
	-- 			hide_cursor = true, -- Hide cursor while scrolling
	-- 			stop_eof = true, -- Stop at <EOF> when scrolling downwards
	-- 			use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
	-- 			respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	-- 			cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	-- 			easing_function = nil, -- Default easing function
	-- 			pre_hook = nil, -- Function to run before the scrolling animation starts
	-- 			post_hook = nil, -- Function to run after the scrolling animation ends
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"nvim-treesitter/nvim-treesitter-angular",
	-- },
	--
	--     {
	--       "folke/trouble.nvim",
	--       cmd = "TroubleToggle",
	--     },
	--
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
