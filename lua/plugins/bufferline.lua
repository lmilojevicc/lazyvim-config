return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      always_show_bufferline = true,
    },
  },

  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Bufferline Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Buffferline Delete Non-Pinned Buffers" },
    { "<leader>bL", "<Cmd>BufferLineCloseRight<CR>", desc = "Bufferline Delete Buffers to the Right" },
    { "<leader>bH", "<Cmd>BufferLineCloseLeft<CR>", desc = "Bufferline Delete Buffers to the Left" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Bufferline Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Bufferline Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Bufferline Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Bufferline Move buffer next" },
    { "<leader>bl", "<cmd>BufferLinePick<cr>", desc = "Bufferline Pick Buffer" },
  },
}
