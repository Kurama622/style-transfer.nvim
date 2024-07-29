local M = {}

function M.setup()
	local stt = require("style_transfer.transfer")

  -- stylua: ignore
  local keymapTable = {
    { mode = "n", key = "crc", func = function() stt.TransferCamelCase()  end },
    { mode = "x", key = "rc",  func = function() stt.TransferCamelCase()  end },
    { mode = "n", key = "crm", func = function() stt.TransferMixedCase()  end },
    { mode = "x", key = "rm",  func = function() stt.TransferMixedCase()  end },
    { mode = "n", key = "crs", func = function() stt.TransferStrCase("_") end },
    { mode = "x", key = "rs",  func = function() stt.TransferStrCase("_") end },
    { mode = "n", key = "cr-", func = function() stt.TransferStrCase("-") end },
    { mode = "x", key = "r-",  func = function() stt.TransferStrCase("-") end },
    { mode = "n", key = "cr ", func = function() stt.TransferStrCase(" ") end },
    { mode = "x", key = "r ",  func = function() stt.TransferStrCase(" ") end },
    { mode = "n", key = "cr.", func = function() stt.TransferStrCase(".") end },
    { mode = "x", key = "r.",  func = function() stt.TransferStrCase(".") end },
  }

	for _, mapping in ipairs(keymapTable) do
		vim.keymap.set(mapping.mode, mapping.key, mapping.func)
	end
end

return M
