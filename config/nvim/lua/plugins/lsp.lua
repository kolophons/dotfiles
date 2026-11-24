return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { "mason-org/mason.nvim", lazy = false, opts = {} },
  },
  config = function()
    -- Upstream server definitions; Neovim owns attachment and completion.
    -- Mason adds installed servers to PATH before these are enabled.
    vim.lsp.config("yamlls", {
      settings = {
        yaml = {
          customTags = { "!reference sequence" },
          schemas = {
            ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
              "*.gitlab-ci.yml",
              "*.gitlab-ci.yaml",
              ".gitlab-ci*.yml",
              ".gitlab-ci*.yaml",
            },
          },
        },
      },
    })
    vim.lsp.enable({
      "rust_analyzer",
      "ts_ls",
      "terraformls",
      "marksman",
      "yamlls",
    })
  end,
}
