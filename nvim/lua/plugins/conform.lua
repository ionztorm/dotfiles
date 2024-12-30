return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      biome = {
        prepend_args = {
          "check",
          "--unsafe",
          "--write",
        },
      },
    },
    formatters_by_ft = {
      javascript = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
    },
  },
}
