local config = function()
	local cmp = require("cmp")
	cmp.setup({
		snippet = {
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			-- Accept currently selected item.
			-- Set `select` to `false` to only confirm explicitly selected items.
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
		}, {
			{ name = "path" },
		}),
		experimental = {
			ghost_text = true,
		},
	})

	-- Enable completing paths in :
	cmp.setup.cmdline(":", {
		sources = cmp.config.sources({
			{ name = "path" },
		}),
	})
end

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	config = config,
}
