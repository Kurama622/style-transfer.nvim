local M = {
  mode = "n",
  pos = "",
  _origin_str = "",
  _new_str = "",
}

local function TransferInit()
  return vim.fn.getpos(".")
end

local function split_identifier(str)
  local words = {}

  str = str:gsub("([a-z])([A-Z])", "%1 %2")
  str = str:gsub("([A-Z]+)([A-Z][a-z])", "%1 %2")

  str = str:gsub("[-_.]", " ")

  for word in str:gmatch("%S+") do
    table.insert(words, word:lower())
  end

  return words
end

function M:Replace()
  if self.mode == "n" then
    vim.lsp.buf.rename(self._new_str)
  else
    vim.cmd("%s/\\<" .. self._origin_str .. "\\>/" .. self._new_str .. "/g")
    vim.api.nvim_win_set_cursor(0, { self.pos[2], self.pos[3] })
  end
  self._new_str = ""
end

function M:GetVisualSelection()
  self.mode = vim.fn.mode()
  self.pos = TransferInit()
  if self.mode == "n" then
    return vim.fn.expand("<cword>")
  else
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
end

function M:TransferStrCase(separator)
  separator = separator or "_"
  self._origin_str = self:GetVisualSelection()
  local words = split_identifier(self._origin_str)

  self._new_str = table.concat(words, separator)
  self:Replace()
end

function M:TransferCamelCase()
  self._origin_str = self:GetVisualSelection()
  local parts = split_identifier(self._origin_str)

  parts[1] = parts[1]:sub(1, 1):lower() .. parts[1]:sub(2)
  for i = 2, #parts do
    parts[i] = parts[i]:sub(1, 1):upper() .. parts[i]:sub(2):lower()
  end

  self._new_str = table.concat(parts)
  self:Replace()
end

function M:TransferMixedCase()
  self._origin_str = self:GetVisualSelection()
  local parts = split_identifier(self._origin_str)

  for i = 1, #parts do
    parts[i] = parts[i]:sub(1, 1):upper() .. parts[i]:sub(2):lower()
  end

  self._new_str = table.concat(parts)
  self:Replace()
end

return M
