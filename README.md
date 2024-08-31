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
        { key = "crc", mode = "n", func = "<cmd>TransferCamelCase<cr>" },
        { key = "crm", mode = "n", func = "<cmd>TransferMixedCase<cr>" },
        { key = "cr_", mode = "n", func = "<cmd>TransferStrCase _<cr>" },
        { key = "cr-", mode = "n", func = "<cmd>TransferStrCase -<cr>" },
        { key = "cr.", mode = "n", func = "<cmd>TransferStrCase .<cr>" },
        { key = "rc", mode = "x", func = "<cmd>TransferCamelCase<cr>" },
        { key = "rm", mode = "x", func = "<cmd>TransferMixedCase<cr>" },
        { key = "r_", mode = "x", func = "<cmd>TransferStrCase _<cr>" },
        { key = "r-", mode = "x", func = "<cmd>TransferStrCase -<cr>" },
        { key = "r.", mode = "x", func = "<cmd>TransferStrCase .<cr>" },
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
    { "crc", mode = "n", "<cmd>TransferCamelCase<cr>" },
    { "crm", mode = "n", "<cmd>TransferMixedCase<cr>" },
    { "cr_", mode = "n", "<cmd>TransferStrCase _<cr>" },
    { "cr-", mode = "n", "<cmd>TransferStrCase -<cr>" },
    { "cr.", mode = "n", "<cmd>TransferStrCase .<cr>" },
    { "rc", mode = "x", "<cmd>TransferCamelCase<cr>" },
    { "rm", mode = "x", "<cmd>TransferMixedCase<cr>" },
    { "r_", mode = "x", "<cmd>TransferStrCase _<cr>" },
    { "r-", mode = "x", "<cmd>TransferStrCase -<cr>" },
    { "r.", mode = "x", "<cmd>TransferStrCase .<cr>" },
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
| `rc`  |   `x`  |  to camelCase  |
| `rm`  |   `x`  |  to PascalCase |
| `rs`  |   `x`  |  to snake_case |
| `r-`  |   `x`  |  to dash-case  |
| `r.`  |   `x`  |   to dot.case  |
| `r `  |   `x`  |  to space case |

## More

`TransferStrCase` function allows you to customize more operations, such as:
``` lua
keys = {
  { "r ", mode = "x", "<cmd>TransferStrCase \\ <cr>" }, -- HelloWorld -> hello world
  { "r|", mode = "x", "<cmd>TransferStrCase \\ | <cr>" }, -- HelloWorld -> hello | world
}
```
