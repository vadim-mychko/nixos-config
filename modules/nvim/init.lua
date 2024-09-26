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
vim.opt.swapfile = true
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
local alpha = require("alpha")
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
  dashboard.button("SPC wr", "󰁯  > [W]orkspace [R]estore", "<cmd>SessionRestore<CR>"),
  dashboard.button("q", "  > Quit Neovim", "<cmd>qa<CR>"),
}

alpha.setup(dashboard.opts)
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

-- ================================ TREESITTER ================================
local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
  highlight = { enable = true },
  indent = { enable = true },
})

-- ============================== AUTOCOMPLETION ==============================
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

luasnip.config.setup({})

cmp.setup({
  completion = {
    completeopt = "menu,menuone,preview"
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
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
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
})

-- ============================ INDENTATION GUIDES ============================
local indentation = require("ibl")
indentation.setup({
  scope = { enabled = false },
  indent = { char = "│" },
})

-- ================================ AUTOPAIRS =================================
local autopairs = require("nvim-autopairs")
autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = { "string" },
    javascript = { "template_string" },
    java = false,
  },
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- =============================== STATUS LINE ================================
local lualine = require("lualine")
lualine.setup({
  options = {
    icons_enabled = false,
    component_separators = "",
    section_separations = "",
  },

  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "buffers" },
    lualine_x = {},
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})

-- ============================= LANGUAGE SERVERS =============================
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.nil_ls.setup({
  capabilities = capabilities,
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

lspconfig.basedpyright.setup({
  capabilities = capabilities,
})

-- ================================ TELESCOPE =================================
local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]ile" })
vim.keymap.set("n", "<leader>ss", builtin.live_grep, { desc = "[S]earch [S]tring" })

-- ================================= HARPOON ==================================
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-5>", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<M-6>", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<M-7>", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<M-8>", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<M-9>", function() harpoon:list():select(9) end)

-- ================================= UNDOTREE =================================
vim.keymap.set("n", "<leader>ts", "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", { desc = "Undo[T]ree [S]how" })

-- =============================== AUTOSESSIONS ===============================
local auto_session = require("auto-session")
auto_session.setup({})

vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "[W]orkspace [S]ave" })
vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "[W]orkspace [R]estore" })

-- ================================= LAZYGIT ==================================
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "[L]azy [G]it" })

-- ================================= LINTING ==================================
local lint = require("lint")
lint.linters_by_ft = {
  python = { "ruff" },
  nix = { "nix" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

-- ================================ FORMATTING ================================
local conform = require("conform")
conform.setup({
  format_on_save = function(...) end,
  formatters_by_ft = {
    python = { "ruff_organize_imports", "ruff_format" }
  },
})

local format = function()
  conform.format({
    async = true,
    lsp_format = "fallback",
    timeout_ms = 500,
  })
end

vim.keymap.set({"n", "v"}, "<leader>fb", format, { desc = "[F]ormat [B]uffer" })
