local M = {}
local function TransferInit()
	return vim.fn.getpos(".")
end

local function GetVisualSelection()
	if vim.fn.mode() ~= "v" and vim.fn.mode() ~= "x" then
		vim.cmd("noau normal! viw")
	end
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg("v")
	vim.fn.setreg("v", {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ""
	end
end

function M.TransferStrCase(str)
	local pos = TransferInit()
	local selection = GetVisualSelection()
	local result = ""

	for i = 1, #selection do
		local char = selection:sub(i, i)

		if char:match("%u") or char:match("%W") then
			if i > 1 then
				if result:sub(-1, -1) ~= str then
					result = result .. str
				end
			end
			if char:match("%u") then
				result = result .. char:lower()
			elseif not char:match("%W") then
				result = result .. char
			end
		else
			result = result .. char
		end
	end

	vim.cmd("%s/" .. selection .. "/" .. result .. "/g")
	vim.api.nvim_win_set_cursor(0, { pos[2], pos[3] })
end

function M.TransferCamelCase()
	local pos = TransferInit()
	local selection = GetVisualSelection()
	local parts = {}
	for part in selection:gmatch("%w+") do
		table.insert(parts, part)
	end

	parts[1] = parts[1]:lower()
	for i = 2, #parts do
		parts[i] = parts[i]:sub(1, 1):upper() .. parts[i]:sub(2):lower()
	end

	local new_string = table.concat(parts)
	vim.cmd("%s/" .. selection .. "/" .. new_string .. "/g")
	vim.api.nvim_win_set_cursor(0, { pos[2], pos[3] })
end

function M.TransferMixedCase()
	local pos = TransferInit()
	local selection = GetVisualSelection()
	local parts = {}
	for part in selection:gmatch("%w+") do
		table.insert(parts, part)
	end

	for i = 1, #parts do
		parts[i] = parts[i]:sub(1, 1):upper() .. parts[i]:sub(2):lower()
	end

	local new_string = table.concat(parts)
	vim.cmd("%s/" .. selection .. "/" .. new_string .. "/g")
	vim.api.nvim_win_set_cursor(0, { pos[2], pos[3] })
end

return M

-- -- stylua: ignore
-- local keymapTable = {
--   { mode = "n", key = "crc", func = function() TransferCamelCase()  end },
--   { mode = "x", key = "rc",  func = function() TransferCamelCase()  end },
--   { mode = "n", key = "crm", func = function() TransferMixedCase()  end },
--   { mode = "x", key = "rm",  func = function() TransferMixedCase()  end },
--   { mode = "n", key = "crs", func = function() TransferStrCase("_") end },
--   { mode = "x", key = "rs",  func = function() TransferStrCase("_") end },
--   { mode = "n", key = "cr-", func = function() TransferStrCase("-") end },
--   { mode = "x", key = "r-",  func = function() TransferStrCase("-") end },
--   { mode = "n", key = "cr ", func = function() TransferStrCase(" ") end },
--   { mode = "x", key = "r ",  func = function() TransferStrCase(" ") end },
--   { mode = "n", key = "cr.", func = function() TransferStrCase(".") end },
--   { mode = "x", key = "r.",  func = function() TransferStrCase(".") end },
-- }
--
-- for _, mapping in ipairs(keymapTable) do
-- 	vim.keymap.set(mapping.mode, mapping.key, mapping.func)
-- end
