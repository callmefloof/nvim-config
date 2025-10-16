-- ~/.config/nvim/lua/aura/user/init.lua

-- Load custom user plugins
require("lazy").setup("aura.user.plugins")
require("godot-setup")
require('telescope').setup{}

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

local session_type = os.getenv("XDG_SESSION_TYPE") or "x11"

-- Mouse support
vim.o.mouse = "a"

-- Clipboard setup
if session_type == "wayland" then
    -- Wayland: uses wl-clipboard (wl-copy/wl-paste)
    vim.g.clipboard = {
        name = "wl-clipboard",
        copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
        paste = { ["+"] = "wl-paste", ["*"] = "wl-paste" },
        cache_enabled = 0,
    }
else
    -- X11: uses xclip/xsel
    vim.o.clipboard = "unnamedplus"
end

-- Optional: line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Tabs / indentation
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4



