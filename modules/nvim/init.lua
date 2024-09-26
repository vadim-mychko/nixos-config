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
vim.opt.timeoutlen = 1000
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

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

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
  dashboard.button("SPC sg", "  > [S]earch [G]rep", "<cmd>Telescope live_grep<CR>"),
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
require("luasnip.loaders.from_vscode").load({})

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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

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
telescope.setup({
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown,
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]ile" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
    end

    map("<leader>gd", builtin.lsp_definitions, "[G]oto [D]efinitions")
    map("<leader>gr", builtin.lsp_references, "[G]oto [R]eferences")
    map("<leader>gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
    map("<leader>td", builtin.lsp_type_definitions, "[T]ype [D]efinitions")
    map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
    map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    map("<leader>rn", vim.lsp.buf.rename, "[R]e[N]ame")
    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", {"n", "x"})
    map("<leader>gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  end
})

-- ================================= HARPOON ==================================
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set({"n", "i"}, "<M-1>", function() harpoon:list():select(1) end)
vim.keymap.set({"n", "i"}, "<M-2>", function() harpoon:list():select(2) end)
vim.keymap.set({"n", "i"}, "<M-3>", function() harpoon:list():select(3) end)
vim.keymap.set({"n", "i"}, "<M-5>", function() harpoon:list():select(5) end)
vim.keymap.set({"n", "i"}, "<M-6>", function() harpoon:list():select(6) end)
vim.keymap.set({"n", "i"}, "<M-7>", function() harpoon:list():select(7) end)
vim.keymap.set({"n", "i"}, "<M-8>", function() harpoon:list():select(8) end)
vim.keymap.set({"n", "i"}, "<M-9>", function() harpoon:list():select(9) end)

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
  c = { "clang-tidy" },
  cpp = { "clang-tidy" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("lint", { clear = true }),
  callback = function()
    lint.try_lint()
  end,
})

-- ================================ FORMATTING ================================
local conform = require("conform")
conform.setup({
  format_on_save = function(...) end,
  formatters_by_ft = {
    python = { "ruff_organize_imports", "ruff_format" },
    c = { "clang-format" },
    cpp = { "clang-format" },
  },
})

conform.formatters["clang-format"] = {
  prepend_args = { "--style=Google" },
}

local format = function()
  conform.format({
    async = true,
    lsp_format = "fallback",
    timeout_ms = 500,
  })
end

vim.keymap.set({"n", "v"}, "<leader>fb", format, { desc = "[F]ormat [B]uffer" })

-- ================================ GIT SIGNS =================================
local gitsigns = require("gitsigns")
gitsigns.setup({})

vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "[H]unk [S]tage" })
vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "[H]unk [R]eset" })
vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "[H]unk [U]nstage" })
vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "[H]unk [P]review" })
vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "[H]unk [D]iff" })
vim.keymap.set("n", "<leader>hn", gitsigns.next_hunk, { desc = "[H]unk [N]ext" })
vim.keymap.set("n", "<leader>hN", gitsigns.prev_hunk, { desc = "[H]unk [N]ext backwards" })
vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { desc = "[H]unk [S]tage buffer" })
vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { desc = "[H]unk [R]eset buffer" })
vim.keymap.set("n", "<leader>hU", gitsigns.reset_buffer_index, { desc = "[H]unk [R]estore buffer" })
