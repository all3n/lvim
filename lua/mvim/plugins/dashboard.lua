local entries = {
  { "f", lvim.icons.ui.FindFile .. "  Find File",   "<CMD>Telescope find_files<CR>" },
  { "n", lvim.icons.ui.NewFile .. "  New File",     "<CMD>ene!<CR>" },
  { "p", lvim.icons.ui.Project .. "  Projects ",    "<CMD>Telescope projects<CR>" },
  { "r", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>" },
  { "t", lvim.icons.ui.FindText .. "  Find Text",   "<CMD>Telescope live_grep<CR>" },
  { "l", lvim.icons.ui.Project .. "  Load Session", "<cmd>lua require('persistence').load()<cr>" },
  {
    "c",
    lvim.icons.ui.Gear .. "  Configuration",
    "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
  },
  { "q", lvim.icons.ui.Close .. "  Quit", "<CMD>quit<CR>" },
}

lvim.builtin.alpha.dashboard.section.buttons.entries = entries
