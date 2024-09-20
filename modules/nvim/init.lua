-- https://github.com/nvim-lua/kickstart.nvim/
-- https://youtu.be/m8C0Cq9Uv9o?si=3xxD7fEK63qZ41PO
-- https://www.youtube.com/watch?v=6pAG3BHurdM
-- ============================== BASIC OPTIONS ===============================
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftround = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.backspace = "indent,eol,start"
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 15
vim.opt.hlsearch = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.cmd.colorscheme "modus"

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- ================================= GREETER ==================================
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

dashboard.section.buttons.val = {
  dashboard.button( "e", "  > New file" , "<cmd>ene<CR>"),
  dashboard.button("SPC sf", "  > [S]earch [F]ile", "<cmd>Telescope find_files<CR>"),
  dashboard.button("SPC ss", "  > [S]earch [S]tring", "<cmd>Telescope live_grep<CR>"),
  dashboard.button("q", "  > Quit Neovim", "<cmd>qa<CR>"),
}

require("alpha").setup(dashboard.opts)
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

-- ================================ TREESITTER ================================
require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
  indent = { enable = true },
})

-- ============================== AUTOCOMPLETION ==============================
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
  completion = {
    completeopt = "menu,menuone,preview,noselect"
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),

  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
})

-- ============================ INDENTATION GUIDES=============================
require("ibl").setup({
  indent = { char = "┊" },
})

-- ================================ AUTOPAIRS =================================
require("nvim-autopairs").setup({})

-- =============================== STATUS LINE ================================
require("lualine").setup({})

-- ============================= LANGUAGE SERVERS =============================
local lspconfig = require("lspconfig")
lspconfig.nil_ls.setup({})
lspconfig.lua_ls.setup({})

-- ================================ TELESCOPE =================================
local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]ile" })
vim.keymap.set("n", "<leader>ss", builtin.live_grep, { desc = "[S]earch [S]tring" })
