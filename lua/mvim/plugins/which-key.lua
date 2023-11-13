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
lvim.builtin.which_key.mappings["d"].R = {
  "<cmd>lua require('mvim.dap').run()<cr>", "RUN"
}


lvim.builtin.which_key.mappings["s"].n = {
  "<cmd>Telescope notify<cr>", "NotifyHistory"
}
lvim.builtin.which_key.mappings["s"].s = {
  "<cmd>Telescope lsp_document_symbols<cr>", "DocumentSymbols"
}
lvim.builtin.which_key.mappings["s"].w = {
  "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "WorkspaceSymbols"
}




lvim.builtin.which_key.mappings["v"] = {
  name = "VsCode",
  t = { "<cmd>lua require('telescope').extensions.vstask.tasks()<cr>",
    "Tasks" },
  i = { "<cmd>lua require('telescope').extensions.vstask.input()<cr>",
    "input" },
  h = { "<cmd>lua require('telescope').extensions.vstask.history()<cr>",
    "History" },
  l = { "<cmd>lua require('telescope').extensions.vstask.launch()<cr>",
    "Launch" },
  v = {
    "<cmd>lua require('mvim.plugins.vstask').run_last()<cr>", "last task" },
  d = {
    "<cmd>lua require('mvim.func').view_vars()<cr>", "dump_vars" },
}
vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua require("mvim.plugins.vstask").run_last()<CR>', { noremap = true, silent = true })

lvim.builtin.which_key.mappings["m"] = {
  "<cmd>lua require('telescope').extensions.vstask.tasks()<cr>", "VsTasks"
}
