lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"
vim.opt.clipboard = "unnamedplus"
vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false 
vim.opt.termguicolors = true
vim.opt.timeoutlen = 100
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.undofile = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.spell = true
vim.opt.spelllang = "en,pt"

vim.opt.smartcase = true 
vim.opt.smartindent = true 

vim.opt.foldenable = true
vim.opt.foldlevel = 20
vim.opt.foldmethod = "manual"
vim.opt.updatetime = 100 -- faster completion
vim.opt.mouse = "a"


lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-j>"] = ":BufferLineMoveNext<CR>"
lvim.keys.normal_mode["<C-k>"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<C-e>"] = ":RnvimrToggle<CR>"
lvim.keys.normal_mode["<C-t>"] = ":RnvimrResize<CR>"
lvim.keys.normal_mode["<C-m>"] = ":!mdbook build<CR>"


--lvim.keys.insert_mode["<C-j>"] = "<Esc>"

 local _, actions = pcall(require, "telescope.actions")

 lvim.builtin.telescope.defaults.mappings = {
   i = {
     ["<C-j>"] = actions.move_selection_next,
     ["<C-k>"] = actions.move_selection_previous,
     ["<C-n>"] = actions.cycle_history_next,
     ["<C-p>"] = actions.cycle_history_prev,
   },
   n = {
     ["<C-j>"] = actions.move_selection_next,
     ["<C-k>"] = actions.move_selection_previous,
   },
 }

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
	"php",
	"dart",
  "markdown",
  "markdown_inline"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.lsp.installer.setup.automatic_installation = true

-- Flutter snippets enable
local luasnip = require("luasnip")
luasnip.filetype_extend("dart", { "flutter" })

lvim.plugins = {
     {
       "Pocco81/auto-save.nvim",
        enabled = true,
     },
     {
			 "godlygeek/tabular",
     },
     {
			 "preservim/vim-markdown",
     },
	   {
		    "kevinhwang91/rnvimr"
	   },
     {
        "simrat39/rust-tools.nvim"
     },
    {
        'dart-lang/dart-vim-plugin' 
    },
    {
        'natebosch/vim-lsc'
    },
    {
        'natebosch/vim-lsc-dart'
    }
}

vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = { "*.*"},
	command = "mkview",
})

--vim.api.nvim_create_autocmd("BufWinEnter", {
 -- pattern = { "*.*"},
 --  command = "silent loadview",
-- })
