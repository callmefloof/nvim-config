-- ~/.config/nvim/lua/aura/user/init.lua

-- Load custom user plugins
require("lazy").setup("aura.user.plugins")
require("godot-setup")
require('telescope').setup{}


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



