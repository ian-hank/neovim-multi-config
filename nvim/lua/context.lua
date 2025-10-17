local ctx = {}
ctx.os   = vim.loop.os_uname().sysname -- "Darwin" | "Windows_NT" | "Linux"
ctx.host = vim.env.COMPUTERNAME or vim.env.HOSTNAME or "unknown"
ctx.kbd  = vim.env.NVIM_KEYBOARD or "standard"
return ctx

