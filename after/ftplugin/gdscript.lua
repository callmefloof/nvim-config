local port = os.getenv('GDScript_Port') or 6005
local cmd = vim.lsp.rpc.connect('127.0.0.1', port)
local pipe = '/path/to/godot.pipe' -- I use /tmp/godot.pipe



-- Only run for GDScript files
if vim.bo.filetype ~= "gdscript" then
  return
end

-- Small helper to check if Godot's LSP port is open
local function is_port_open(host, port_in)
  local socket = vim.loop.new_tcp()
  local ok, err = socket:connect(host, port_in, function(_) end)
  socket:close()
  return ok == true
end


local host = '127.0.0.1'
if is_port_open(host, port) then
    vim.lsp.start({
    name = 'Godot',
    cmd = cmd,
    root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
    on_attach = function(client, bufnr)
      vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
    end
  })
else
  vim.notify("Godot LSP not running on " .. host .. ":" .. port, vim.log.levels.WARN)
end
