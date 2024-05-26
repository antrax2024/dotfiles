-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--
lvim.transparent_window = true

lvim.colorscheme = "codedark"


lvim.plugins = {
  { "lunarvim/colorschemes" },
    {
      'tomasiser/vim-code-dark',
    },
    {

      "stevearc/dressing.nvim",
      config = function()
        require("dressing").setup({
          input = { enabled = false },
        })
      end,
    }
}
