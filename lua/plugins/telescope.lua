-- Fuzzy Finder
return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      event = "VeryLazy",
      config = function(_, _)
        require("lazyvim.util").on_load("telescope.nvim", function()
          require("telescope").load_extension("live_grep_args")
        end)
      end,
    },
    config = function()
      require("telescope").setup({
        extensions = {
          require("telescope-live-grep-args.actions"),
          live_grep_args = {
            auto_quoting = true,
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
