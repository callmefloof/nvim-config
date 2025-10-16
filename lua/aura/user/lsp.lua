-- ~/.config/nvim/lua/aura/user/lsp.lua

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

-- Setup LSPs installed via Mason
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({})
    end,
})

-- Example: Lua language server with special settings

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Lua language server

-- Lua LSP
lspconfig.lua_ls.setup({
  name = "lua_ls",
  autostart = true,
  single_file_support = true,
  root_dir = function() return vim.fn.getcwd() end,
  capabilities = capabilities,
  cmd = { "lua-language-server" },
  init_options = {},
  handlers = {},
  on_attach = function() end,
  on_new_config = function() end,
  settings = {
    Lua = {
    runtime = { version = "LuaJIT", path = vim.split(package.path, ";"), builtin = {}, fileEncoding = "utf-8", meta = {}, nonstandardSymbol = {}, pathStrict = false, plugin = {}, pluginArgs = {}, special = {}, unicodeName = "" },
    diagnostics = { globals = { "vim" }, disable = {}, enable = true, severity = {}, disableScheme = {}, globalsRegex = {}, groupFileStatus = {}, groupSeverity = {}, ignoredFiles = {}, libraryFiles = {}, neededFileStatus = {}, unusedLocalExclude = {}, workspaceDelay = 0, workspaceEvent = 0, workspaceRate = 0 },
    workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
        ignoreDir = {},
        ignoreSubmodules = false,
        maxPreload = 1000,
        preloadFileSize = 1000,
        useGitIgnore = true,
        userThirdParty = {},
    },
    telemetry = { enable = false },
    hint = { arrayIndex = {}, await = {}, awaitPropagate = {}, enable = false, paramName = {}, paramType = {}, semicolon = {}, setType = {} },
    format = { defaultConfig = {}, enable = false },
    completion = { autoRequire = false, callSnippet = false, displayContext = false, enable = true, keywordSnippet = false, postfix = {}, requireSeparator = ".", showParams = true, showWord = true, workspaceWord = true },
    hover = { enable = true, enumsLimit = 0, expandAlias = false, previewFields = {}, viewNumber = 0, viewString = "", viewStringMax = 0 },
    semantic = { annotation = {}, enable = true, keyword = {}, variable = {} },
    signatureHelp = { enable = true },
    doc = { packageName = "", privateName = "", protectedName = "", regengine = "" },
    type = { castNumberToInteger = false, checkTableShape = false, inferParamType = false, inferTableSize = false, maxUnionVariants = 0, weakNilCheck = false, weakUnionCheck = false },
    codeLens = { enable = false },
    spell = { dict = {} },
    addonManager = { enable = false, repositoryBranch = "", repositoryPath = "" },
    misc = { executablePath = "", parameters = {} },
    nameStyle = { config = {} },
    language = { completeAnnotation = false, fixIndent = false },
    docScriptPath = "",
    typeFormat = { config = {} },
    window = { progressBar = false, statusBar = false }},
  }
})



-- Clangd setup for Godot + SCons


-- Clangd
lspconfig.clangd.setup({
  name = "clangd-godot",
  autostart = true,
  single_file_support = true,
  root_dir = function(fname)
    return vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1]) or vim.fn.getcwd()
end,
  capabilities = capabilities,
  cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders=1",
        "--fallback-style=llvm",
        "--log=error", },
  init_options = { clangdFileStatus = true },
  settings = { clangd = {} }, -- satisfies type checker
  on_attach = function() end,
  handlers = {},
  on_new_config = function() end,
})





capabilities.offsetEncoding = { "utf-8" }

vim.lsp.set_log_level("ERROR")


lspconfig.gdscript.setup(capabilities)



