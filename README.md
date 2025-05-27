# Style Transfer

**[ENGLISH](README.md)** | [简体中文](README_CN.md)

A variable naming style conversion plugin that can switch between styles such as camel case, pascal case, and snake case.

## Configuration

- lazy.nvim

Use default key mappings

```lua
{
  "Kurama622/style-transfer.nvim",
  event = "BufEnter",
  config = function()
    require("style_transfer").setup({})
  end,
},
```
Custom key mappings

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

Lazy load and custom key mappings

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

## Default Key Mapping

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

## More

`TransferStrCase` function allows you to customize more operations, such as:
``` lua
keys = {
  { "<leader>r ", mode = "x", "<cmd>TransferStrCase \\ <cr>" }, -- HelloWorld -> hello world
  { "<leader>r|", mode = "x", "<cmd>TransferStrCase \\ | <cr>" }, -- HelloWorld -> hello | world
}
```
