local task_file = vim.fn.stdpath("config") .. "/.tasks"
vim.g.asynctasks_term_pos = 'toggleterm2'
-- vim.g.asynctasks_term_pos = 'bottom'
-- for toggleterm
vim.g.asyncrun_mode = 'term'
-- vim.g.asyncrun_mode = 'async' -- for quickfix

vim.g.asyncrun_save = 1 -- 1 save current file  2 save modified save
vim.g.asyncrun_open = 10
vim.g.asynctasks_extra_config = {
    task_file,
}
