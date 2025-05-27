# Style Transfer

[ENGLISH](README.md) | **[简体中文](README_CN.md)**

变量命名风格的转换插件，可以在驼峰命名、混合命名和蛇形命名等风格之间相互转换

## 配置

- lazy.nvim

使用默认快捷键

```lua
{
  "Kurama622/style-transfer.nvim",
  event = "BufEnter",
  config = function()
    require("style_transfer").setup({})
  end,
},
```
自定义快捷键

```lua
{
  "Kurama622/style-transfer.nvim",
  event = "BufEnter",
  config = function()
    require("style_transfer").setup({
      keys = {
        { "crc", mode = "n", "<cmd>TransferCamelCase<cr>", desc = "namingStyle" },
        { "crm", mode = "n", "<cmd>TransferMixedCase<cr>", desc = "NamingStyle" },
        { "cr_", mode = "n", "<cmd>TransferStrCase _<cr>", desc = "naming_style" },
        { "cr-", mode = "n", "<cmd>TransferStrCase -<cr>", desc = "naming-style" },
        { "cr.", mode = "n", "<cmd>TransferStrCase .<cr>", desc = "naming.style" },
        { "cr ", mode = "n", "<cmd>TransferStrCase \\ <cr>", desc = "nameing style" },
        { "<leader>rc", mode = "x", "<cmd>TransferCamelCase<cr>", desc = "namingStyle" },
        { "<leader>rm", mode = "x", "<cmd>TransferMixedCase<cr>", desc = "NamingStyle" },
        { "<leader>r_", mode = "x", "<cmd>TransferStrCase _<cr>", desc = "naming_style" },
        { "<leader>r-", mode = "x", "<cmd>TransferStrCase -<cr>", desc = "naming-style" },
        { "<leader>r.", mode = "x", "<cmd>TransferStrCase .<cr>", desc = "naming.style" },
        { "<leader>r ", mode = "x", "<cmd>TransferStrCase \\ <cr>", desc = "naming style" },
      },
    })
  end,
},
```

懒加载并自定义快捷键

```lua
{
  "Kurama622/style-transfer.nvim",
  cmd = { "TransferCamelCase", "TransferMixedCase", "TransferStrCase" },
  config = function()
    require("style_transfer").setup()
  end,
  keys = {
    { "crc", mode = "n", "<cmd>TransferCamelCase<cr>", desc = "namingStyle" },
    { "crm", mode = "n", "<cmd>TransferMixedCase<cr>", desc = "NamingStyle" },
    { "cr_", mode = "n", "<cmd>TransferStrCase _<cr>", desc = "naming_style" },
    { "cr-", mode = "n", "<cmd>TransferStrCase -<cr>", desc = "naming-style" },
    { "cr.", mode = "n", "<cmd>TransferStrCase .<cr>", desc = "naming.style" },
    { "cr ", mode = "n", "<cmd>TransferStrCase \\ <cr>", desc = "nameing style" },
    { "<leader>rc", mode = "x", "<cmd>TransferCamelCase<cr>", desc = "namingStyle" },
    { "<leader>rm", mode = "x", "<cmd>TransferMixedCase<cr>", desc = "NamingStyle" },
    { "<leader>r_", mode = "x", "<cmd>TransferStrCase _<cr>", desc = "naming_style" },
    { "<leader>r-", mode = "x", "<cmd>TransferStrCase -<cr>", desc = "naming-style" },
    { "<leader>r.", mode = "x", "<cmd>TransferStrCase .<cr>", desc = "naming.style" },
    { "<leader>r ", mode = "x", "<cmd>TransferStrCase \\ <cr>", desc = "naming style" },
  },
},
```

## 默认快捷键

| Key | Mode |   Description  |
|-----|------|----------------|
| `crc` |   `n`  |  to camelCase  |
| `crm` |   `n`  |  to PascalCase |
| `crs` |   `n`  |  to snake_case |
| `cr-` |   `n`  |  to dash-case  |
| `cr.` |   `n`  |   to dot.case  |
| `cr ` |   `n`  |  to space case |
| `<leader>rc`  |   `x`  |  to camelCase  |
| `<leader>rm`  |   `x`  |  to PascalCase |
| `<leader>rs`  |   `x`  |  to snake_case |
| `<leader>r-`  |   `x`  |  to dash-case  |
| `<leader>r.`  |   `x`  |   to dot.case  |
| `<leader>r `  |   `x`  |  to space case |

## 更多探索功能

`TransferStrCase` 函数允许你自定义更多操作, 比如:
``` lua
keys = {
  { "<leader>r ", mode = "x", "<cmd>TransferStrCase \\ <cr>" }, -- HelloWorld -> hello world
  { "<leader>r|", mode = "x", "<cmd>TransferStrCase \\ | <cr>" }, -- HelloWorld -> hello | world
}
```
