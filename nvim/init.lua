-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Core
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- OS-aware tweaks (safe if files are empty/minimal)
local sys = string.lower(vim.loop.os_uname().sysname)
if sys:find("windows") then
  pcall(require, "os.windows")
elseif sys == "darwin" then
  pcall(require, "os.macos")
else
  pcall(require, "os.linux")
end

-- Plugins
require("plugins.init")
