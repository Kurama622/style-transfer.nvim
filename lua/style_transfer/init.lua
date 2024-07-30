local M = {}

function M.setup(opts)
	if not opts then
		opts = { keys = {} }
	end
	return require("style_transfer.config").setup(opts)
end

return M
