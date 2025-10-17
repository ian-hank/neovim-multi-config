vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.termguicolors = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Core config
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- OS-aware
local sysname = vim.loop.os_uname().sysname
local sys = string.lower(sysname)
if sys:find("windows") then
  pcall(require, "os.windows")
elseif sys == "darwin" then
  pcall(require, "os.macos")
else
  pcall(require, "os.linux")
end

-- Plugins
require("plugins.init")

-- Device/keyboard context
local ok, ctx = pcall(require, "context")
if ok and ctx.kbd then
  pcall(function() require("keymaps.kbd." .. ctx.kbd) end)
end
