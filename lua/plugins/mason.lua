return {
  "mason-org/mason.nvim",
  cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonLog", "MasonUninst", "MasonUninstAll" },
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },

  build = ":MasonUpdate",

  keys = function()
    return {
      { "<leader>ms", "<cmd>Mason<CR>", desc = "󰽤 Open Mason" },
    }
  end,
}
