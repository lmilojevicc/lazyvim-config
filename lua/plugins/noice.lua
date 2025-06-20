return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = {
        enabled = true,
        opts = { border = "rounded" },
      },
      signature = {
        enabled = true,
        opts = { border = "rounded" },
      },
    },
    presets = { lsp_doc_border = true, command_palette = false },
  },
}
