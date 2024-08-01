vim.api.nvim_create_user_command("TransferCamelCase", function()
  require("style_transfer.transfer").TransferCamelCase()
end, {})

vim.api.nvim_create_user_command("TransferMixedCase", function()
  require("style_transfer.transfer").TransferMixedCase()
end, {})

vim.api.nvim_create_user_command("TransferStrCase", function(args)
  require("style_transfer.transfer").TransferStrCase(args.fargs[1])
end, { nargs = 1 })
