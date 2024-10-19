-- Tree Sitter
return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    local treesitterconfigs = require('nvim-treesitter.configs')

    treesitterconfigs.setup({
    ensure_installed = {
        "lua",
        "javascript",
        "c",
        "vim",
        "query",
        "html",
        "go",
        "bash",
        "c_sharp",
        "cpp",
        "css",
        "csv",
        "dockerfile",
        "gitignore",
        "graphql",
        "ini",
        "java",
        "json",
        "powershell",
        "make",
        "python",
        "sql",
        "typescript",
        "xml",
        "yaml"
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  })
  end
}
