-- ~/.config/nvim/lua/aura/user/dap.lua
local dap = require("dap")

-- Python (debugpy)
dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
}
dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
  },
}

-- C/C++ (lldb)
dap.adapters.lldb = {
  type = 'executable',
  command = 'lldb-vscode', -- Mason should install this if needed
  name = "lldb"
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "lldb",
    request = "launch",
    program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
dap.configurations.c = dap.configurations.cpp



dap.adapters.godot = {
	type = "server",
	host = "127.0.0.1",
	port = 6006,
}

dap.configurations.gdscript = {
	{
		type = "godot",
		request = "launch",
		name = "Launch scene",
		project = "${workspaceFolder}",
		launch_scene = true,
	},
}

vim.api.nvim_create_user_command("Breakpoint", "lua require'dap'.toggle_breakpoint()", {})
vim.api.nvim_create_user_command("Continue", "lua require'dap'.continue()", {})
vim.api.nvim_create_user_command("StepOver", "lua require'dap'.step_over()", {})
vim.api.nvim_create_user_command("StepInto", "lua require'dap'.step_into()", {})
vim.api.nvim_create_user_command("REPL", "lua require'dap'.repl.open()", {})

