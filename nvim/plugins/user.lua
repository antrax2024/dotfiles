return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
	  "L3MON4D3/LuaSnip",
	  -- follow latest release.
	  version = "v2.0.0",
	  dependencies = { "rafamadriz/friendly-snippets" },
	  -- install jsregexp (optional!).
	  build = "make install_jsregexp",
	  require("luasnip.loaders.from_vscode").load_standalone({path = "/home/gargula/dotfiles/nvim/snippets.json"})
  },

}





