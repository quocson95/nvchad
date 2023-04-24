---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["gp"] = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
    ["gh"] = { "<cmd>Lspsaga lsp_finder<CR>", "Lsp Finder" },
    ["gt"] = { "<cmd>Lspsaga peek_type_definition<CR>", "Peek type Definition" },
    ["<leader>o"] = { "<cmd>Lspsaga outline<CR>", "Outline" },
    ["<leader>sl"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show line Diagnostics" },
    ["<leader>sb"] = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "Show buffer Diagnostics" },
    ["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Jump to prev diagnostics" },
    ["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Jump to next diagnostics" },

    ["tr"] = { "<cmd>GoTestFunc<CR>", "Run go test at cursor" },
    ["ta"] = { "<cmd>GoAddTest<CR>", "Add go test at cursor" },

    -- Testcase plugin

    ["gaa"] = { "<cmd>TextCaseOpenTelescope<CR>", "Open Testcase Telescope" },
  },
}

-- more keybinds!

return M
