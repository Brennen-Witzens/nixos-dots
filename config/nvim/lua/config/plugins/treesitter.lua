return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
   -- dependencies = {
   --   "nvim-treesitter/nvim-treesitter-textobjects",
   -- },
    config = function()
      local configs = require('nvim-treesitter')
      configs.setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            },
          },
        },
        -- Enable syntax highlighting
        highlight = {
          enable = true,
        }, 
        -- enable indenting
        indent = { enable = true },
        -- A list of parser names, or "all" the listed parsers MUST always be installed
        ensure_installed = { 
          "c", 
          "lua", 
          "vim", 
          "vimdoc",
          "query", 
          "markdown", 
          "markdown_inline",
          "rust",
          "zig",
          "toml",
          "yaml",
        },
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,
        sync_install = true,
      })
    end
  }
}
