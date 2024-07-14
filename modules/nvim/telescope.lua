-- https://youtu.be/m8C0Cq9Uv9o?si=3xxD7fEK63qZ41PO
-- https://github.com/nvim-lua/kickstart.nvim/

local telescope = require("telescope")
telescope.setup {}
telescope.load_extension("fzf")
telescope.load_extension("ui-select")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })


