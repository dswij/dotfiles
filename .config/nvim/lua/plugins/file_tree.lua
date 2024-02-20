local init = function()
	require("nvim-tree").setup({
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
	})
end

return {
	"nvim-tree/nvim-tree.lua",
	init = init,
}
