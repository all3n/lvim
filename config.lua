-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--

lvim.builtin.alpha.dashboard.section.footer.val = {
  [[ LunarVIM Config BY all3n ]],
}
lvim.builtin.alpha.dashboard.section.header.val = {
  [[ MY LVIM ]]
}

require('mvim.plugins.dashboard')

lvim.builtin.copilot = {
  active = false
}
lvim.builtin.tabnine = {
  active = true
}
-- https://github.com/folke/lazy.nvim#-migration-guide
lvim.plugins = {
  {
    'nathom/filetype.nvim',
    lazy = true,
    event = "User FileOpened",
    config = true
  },
  {
    'skywind3000/asynctasks.vim',
    config = function()
      require "mvim.plugins.async-tasks"
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
      require("mvim.plugins.copilot")
    end,
    enabled = lvim.builtin.copilot.active
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    config = true,
    enabled = lvim.builtin.copilot.active
  },
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    enabled = lvim.builtin.tabnine.active,
    config = function()
      require('tabnine').setup({
        disable_auto_comment = true,
        accept_keymap = "<Tab>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt" },
        log_file_path = nil, -- absolute path to Tabnine log file
      })
    end
  },
  { "simrat39/symbols-outline.nvim", config = true },
  {
    'fgheng/winbar.nvim',
    config = function()
      require "mvim.plugins.winbar"
    end
  },
  -- 'lourenci/github-colors',
  -- 'shaunsingh/nord.nvim',
  {
    "weilbith/nvim-code-action-menu",
    cmd = 'CodeActionMenu'
  },
  'sainnhe/edge',
  { 'HiPhish/nvim-ts-rainbow2',      event = { "User FileOpened" } },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('hop').setup { keys = "etovxqpdygfblzhckisuran" }
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('', 't', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, { remap = true })
      vim.keymap.set('', 'T', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, { remap = true })
    end
  },
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { "User FileOpened" },
    config = function()
      require 'treesitter-context'.setup {
        enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
        trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,     -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      }
    end
  },
  {
    'ethanholz/nvim-lastplace',
    config = function()
      require 'nvim-lastplace'.setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true
      }
    end
  },
  {
    'folke/persistence.nvim',
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("cache") .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
        pre_save = nil,
      })
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {

    },
    config = function()
      vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
        { silent = true, noremap = true }
      )
    end
  },
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    cmd = "Telescope harpoon marks",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("harpoon").setup({})
      require("telescope").load_extension("harpoon")
    end,
  },
  {
    "KabbAmine/zeavim.vim",
    config = function()
      vim.g.zv_zeal_executable = "/usr/bin/zeal"
    end
  }
}
lvim.builtin.treesitter.rainbow.enable = true

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

-- default define in ~/.local/share/lunarvim/lvim/lua/lvim/config/settings.lua
vim.g.edge_style = 'aura'
vim.g.edge_better_performance = 1
vim.opt.cursorcolumn = true

lvim.builtin.lualine.options.theme = 'edge'
lvim.colorscheme = "edge"

require("mvim.dap")
lvim.builtin.nvimtree.setup.filters.custom = { "node_modules", "*.o", "*.dSYM" }


-- lsp
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })



vim.cmd([[

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

]])
