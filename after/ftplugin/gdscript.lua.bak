-- Only run for GDScript files
if vim.bo.filetype ~= "gdscript" then return end

local host = "127.0.0.1"
local port = tonumber(os.getenv("GDScript_Port")) or 6005
local timeout_ms = 2000  -- wait up to 2 seconds for Godot LSP

local uv = vim.loop

-- Helper: wait for Godot LSP port to be ready
local function wait_for_port(host, port, timeout_ms)
    local start = uv.hrtime()
    while true do
        local sock = uv.new_tcp()
        local ok, _ = sock:connect(host, port)
        sock:close()
        if ok then return true end
        if (uv.hrtime() - start) / 1e6 > timeout_ms then return false end
        uv.sleep(50)
    end
end

-- Check if Godot LSP is running
if not wait_for_port(host, port, timeout_ms) then
    vim.notify("Godot LSP not running on " .. host .. ":" .. port, vim.log.levels.WARN)
    return
end

-- Avoid starting multiple clients
if not vim.g.godot_lsp_started then
    vim.g.godot_lsp_started = true

    -- Start Godot LSP client
    vim.lsp.start_client({
        name = "Godot",
        host = host,
        port = port,
        root_dir = (function()
            local root = vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]
            return root and vim.fs.dirname(root) or vim.loop.cwd()
        end)(),
    })
end

-- Attach current buffer to existing Godot LSP client
for _, client in ipairs(vim.lsp.get_active_clients()) do
    if client.name == "Godot" then
        vim.lsp.buf_attach_client(0, client.id)
        break
    end
end

