return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Formatting
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.htmlbeautifier,
				-- Diagnostics
				null_ls.builtins.diagnostics.write_good,
				null_ls.builtins.diagnostics.pylint.with({
					diagnostics_postprocess = function(diagnostic)
						diagnostic.code = diagnostic.message_id
					end,
				}),
				null_ls.builtins.diagnostics.revive,
				null_ls.builtins.diagnostics.codespell,
				null_ls.builtins.diagnostics.todo_comments,
				null_ls.builtins.diagnostics.trail_space,
				require("none-ls.diagnostics.eslint_d"),
			},
		})
	end,
}
