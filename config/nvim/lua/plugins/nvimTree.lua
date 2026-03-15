return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local tree = require("nvim-tree")

		tree.setup({
			renderer = {
				icons = {
					show = {
						file = true,
						folder_arrow = true,
						git = false,
					},
				},
			},
			view = {
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.o.columns
						local screen_h = vim.o.lines
						local pad_w = math.floor(screen_w * 0.25)
						local pad_h = math.floor(screen_h * 0.2)
						local win_w = screen_w - (pad_w * 2)
						local win_h = screen_h - (pad_h * 2)

						return {
							relative = "editor",
							border = "rounded",
							width = win_w,
							height = win_h,
							row = pad_h - 1,
							col = pad_w,
						}
					end,
				},
			},

			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				local map = vim.keymap.set

				local function opts(desc)
					return {
						desc = "nvim-tree: " .. desc,
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
					}
				end

				api.config.mappings.default_on_attach(bufnr)

				map("n", "t", api.node.open.tab, opts("Open in Tab"))
				map("n", "m", api.fs.rename_sub, opts("Move Path"))
				map("n", "r", api.fs.rename, opts("Rename"))
				map("n", "d", api.fs.remove, opts("Delete"))
				map("n", "sv", api.node.open.vertical, opts("Vertical Split"))
				map("n", "sh", api.node.open.horizontal, opts("Horizontal Split"))
			end,
		})

		vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
	end,
}
