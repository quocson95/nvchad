---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["gp"] = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition"},
    ["gh"] = { "<cmd>Lspsaga lsp_finder<CR>", "Lsp Finder"},
    ["gt"] = { "<cmd>Lspsaga peek_type_definition<CR>", "Peek type Definition"},

    ["ra"] = { "<cmd>GoTestFunc<CR>", "Run go test at cursor"},
    ["rt"] = { "<cmd>GoAddTest<CR>", "Add go test at cursor"},


  },
}

-- more keybinds!

return M
