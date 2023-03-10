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


lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["F"] = {
  name = "+Flutter",
  c = { "<cmd>Telescope flutter commands<cr>", "Open Flutter Commans" },
  d = { "<cmd>FlutterDevices<cr>", "Flutter Devices" },
  e = { "<cmd>FlutterEmulators<cr>", "Flutter Emulators" },
  r = { "<cmd>FlutterReload<cr>", "Hot Reload App" },
  R = { "<cmd>FlutterRestart<cr>", "Hot Restart app" },
  q = { "<cmd>FlutterQuit<cr>", "Quit running application" },
  v = { "<cmd>Telescope flutter fvm<cr>", "Flutter version" },
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



--lvim.lsp.installer.setup.automatic_installation = true

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
 --   {
   --    'dart-lang/dart-vim-plugin'
 --   },
 --  {
  --      'natebosch/vim-lsc'
  --  },
 --   {
 --      'natebosch/vim-lsc-dart'
 --   },


-- Flutter plugin
  {
    "akinsho/flutter-tools.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require('flutter-tools').setup {
        -- flutter_path = "~/development/flutter",
        fvm = true, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
        ui = {
          -- the border type to use for all floating windows, the same options/formats
          -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
          border = "rounded",
          -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
          -- please note that this option is eventually going to be deprecated and users will need to
          -- depend on plugins like `nvim-notify` instead.
          notification_style = "plugin",
        },
        decorations = {
          statusline = {
            -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
            -- this will show the current version of the flutter app from the pubspec.yaml file
            app_version = true,
            -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
            -- this will show the currently running device if an application was started with a specific
            -- device
            device = true,
          },
        },
        outline = {
          open_cmd = "30vnew", -- command to use to open the outline buffer
          auto_open = false, -- if true this will open the outline automatically when it is first populated
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
          register_configurations = function(_)
            local dap = require("dap")
            -- dap.adapters.dart = {
            -- 	type = "executable",
            -- 	command = "node",
            -- 	args = { debugger_path, "flutter" },
            -- }
            dap.set_log_level("TRACE")
            dap.configurations.dart = {}
            require("dap.ext.vscode").load_launchjs()
          end,
        },
        dev_log = {
          enabled = false,
          -- open_cmd = "tabedit", -- command to use to open the log buffer
        },
        lsp = {
          color = { -- show the derived colours for dart variables
            enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = false, -- highlight the background
            foreground = false, -- highlight the foreground
            virtual_text = true, -- show the highlight using virtual text
            virtual_text_str = "■", -- the virtual text character to highlight
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt", -- "always"
            enableSnippets = true,
            enableSdkFormatter = true,
          },
        },

      }
    end
  },  

  

  
  {
    "glepnir/lspsaga.nvim",
    config = function()
      local saga = require("lspsaga")

      saga.setup({
        -- keybinds for navigation in lspsaga window
        move_in_saga = { prev = "<C-k>", next = "<C-j>" },
        -- use enter to open file with finder
        finder = {
          open = "<CR>",
        },
        -- use enter to open file with definition preview
        definition = {
          edit = "<CR>",
        },
      })

      local keymap = vim.keymap.set

      -- Lsp finder find the symbol definition implement reference
      -- if there is no implement it will hide
      -- when you use action in finder like open vsplit then you can
      -- use <C-t> to jump back
      keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

      -- Rename
      keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

      -- Peek Definition
      -- you can edit the definition file in this flaotwindow
      -- also support open/vsplit/etc operation check definition_action_keys
      -- support tagstack C-t jump back
      keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

      -- Hover Doc
      keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

      -- Float terminal
      keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
      keymap("n", "∂", "<cmd>Lspsaga open_floaterm<CR>", { silent = true }) -- macos ALT+d(Option+d) binding
      -- close floaterm
      keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
      keymap("t", "∂", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true }) -- macos ALT+d(Option+d) binding
    end,
  },



vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = { "*.*"},
	command = "mkview",
})

--vim.api.nvim_create_autocmd("BufWinEnter", {
 -- pattern = { "*.*"},
 --  command = "silent loadview",
-- })
}
