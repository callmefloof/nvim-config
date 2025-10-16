return {
  {
  'Mathijs-Bakker/godotdev.nvim',
  dependencies = { 'nvim-lspconfig', 'nvim-dap', 'nvim-dap-ui', 'nvim-treesitter' },
  },
  { "habamax/vim-godot" },
  { "Cretezy/godot-server.nvim" },
  { "skywind3000/asyncrun.vim" },
  { "teatek/gdscript-extended-lsp.nvim", opts = { view_type = "floating", picker = "snacks" } },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true, -- show hidden files
            ignored = false, -- don't show gitignored files
            exclude = { -- exclude specific patterns
              "*.uid", -- glob pattern for files ending with .uid
              "server.pipe", -- exact filename match
            },
          },
        },
      },
    },
  },
}
