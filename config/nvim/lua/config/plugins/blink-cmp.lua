return {
  {
    "saghen/blink.cmp",
    enabled = true,
    version = not vim.g.lazyvim_blink_main and "*",
    build = vim.g.lazyvim_blink_main and "cargo build --release",
    opts = {
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          auto_show = true,
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
        },
      },
      fuzzy = {
        implementation = 'lua',
      },
    }
  }
}
