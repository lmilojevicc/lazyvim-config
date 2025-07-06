return {
  "mason-org/mason.nvim",
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },

  keys = {
    { "<leader>ms", "<cmd>Mason<CR>", desc = "󰽤 Open Mason" },
  },
}
