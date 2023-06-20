local opts = { 
  cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=never" , "--offset-encoding=utf-16", "--enable-config" }
}
require("lvim.lsp.manager").setup("clangd", opts)
