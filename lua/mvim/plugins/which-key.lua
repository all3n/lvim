
lvim.builtin.which_key.vmappings["<space>"] = {
  "<Plug>(comment_toggle_linewise_visual)",
  "Comment Visual"
}

lvim.builtin.which_key.mappings["<space>"] = {
  "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line"
}

lvim.builtin.which_key.mappings["x"] = {
  name = "+Trouble",
  x = { "<cmd>TroubleToggle<cr>", "TroubleToggle" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "TroubleToggle workspace_diagnostics" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "TroubleToggle document_diagnostics" },
  l = { "<cmd>TroubleToggle loclist<cr>", "TroubleToggle loclist" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "TroubleToggle quickfix" },
}



lvim.builtin.which_key.mappings["P"] = {
  name = "+Persistence",
  l = { "<cmd>lua require('persistence').load()<cr>", "Load Session" },
  s = { "<cmd>lua require('persistence').stop()<cr>", "Stop Session" },
}

-- which key custom
lvim.builtin.which_key.mappings["r"] = {
  name = "+Run",
  l = { "<cmd>AsyncTaskList<cr>", "AsyncTaskList" },
  P = { "<cmd>AsyncTaskProfile<cr>", "AsyncTaskProfile" },
  m = { "<cmd>AsyncTaskMacro<cr>", "AsyncTaskMacro" },
  b = { "<cmd>AsyncTask file-build<cr>", "task:build" },
  r = { "<cmd>AsyncTask file-run<cr>", "task:run" },
  p = {
    "+Project",
    b = { "<cmd>AsyncTask project-build<cr>", "task:project:build" },
    r = { "<cmd>AsyncTask project-run<cr>", "task:project:run" },
  }
}

lvim.builtin.which_key.mappings.l.a = { "<cmd>CodeActionMenu<cr>", "Code Action" }
-- toggle group
lvim.builtin.which_key.mappings["t"] = {
  name = "Toggle",
  o = { "<cmd>SymbolsOutline<cr>", "SymbolsOutline" },
  t = { "<cmd>ClangdSwitchSourceHeader<cr>", "Header/Source" }
}

lvim.builtin.which_key.mappings["h"] = {
  name = "Hop",
  w = { "<cmd>HopWord<cr>", "HopWord" },
}
lvim.builtin.which_key.mappings["d"].y = {
   "<cmd>lua require('mvim.dap').choose_config()<cr>", "ChooseConfiguration" 
}



