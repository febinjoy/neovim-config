-- Generic

-- Space bar as leader key
vim.g.mapleader = " "

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")

-- nvim-comment
vim.keymap.set({ "n", "v" }, "<leader>/", ":CommentToggle<cr>")

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+yg_]])
vim.keymap.set({ "n", "v" }, "<leader>yy", [["+yy]])

-- paste from clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])

-- Plugins

-- Telescope
vim.keymap.set("n", "<C-p>", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fp", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader><leader>", ":Telescope oldfiles<cr>")

-- File Tree
vim.keymap.set("n", "<C-e>", ":Neotree filesystem reveal left<cr>")
vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<cr>")

-- LSP Config Key Maps
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
