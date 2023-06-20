-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--

lvim.builtin.alpha.dashboard.section.footer.val = {
  [[ LunarVIM Config BY all3n ]],
}

lvim.plugins = {
  {
    'skywind3000/asynctasks.vim',
    config = function()
      require "plugins.async-tasks"
    end
  },
  {
    "skywind3000/asyncrun.vim",
    name = "asyncrun",
    config = function()
      require("asyncrun_toggleterm").setup({
        mapping = "<leader>tt",
        start_in_insert = false,
      })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("plugins.copilot")
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    config = true
  },
  { "simrat39/symbols-outline.nvim", config = true },
  {
    'fgheng/winbar.nvim',
    config = function()
      require "plugins.winbar"
    end
  },
  'lourenci/github-colors',
  'shaunsingh/nord.nvim',
  {
    "weilbith/nvim-code-action-menu",
    cmd = 'CodeActionMenu'
  },
  'sainnhe/edge'
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
  o = { "<cmd>SymbolsOutline<cr>", "SymbolsOutline" }
}
-- nvim-tree
lvim.builtin.nvimtree.setup.renderer.group_empty = true

lvim.builtin.terminal.execs = {
  { nil, "<C-T>", "Horizontal Terminal", "horizontal", 0.3 },
}

-- keymap custom
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

vim.g.edge_style = 'aura'
vim.g.edge_better_performance = 1

lvim.builtin.lualine.options.theme = 'edge'
lvim.colorscheme = "edge"

require("dap.init")

-- lsp
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
