return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    -- add any opts here
    --
    provider = "copilot",
    copilot = {
      endpoint = "https://api.githubcopilot.com/",
      -- model = "gemini-2.0-flash-001", -- "claude-3.5-sonnet",
      model = "claude-3.5-sonnet",
      proxy = nil, -- [protocol://]host[:port] Use this proxy
      allow_insecure = false, -- Do not allow insecure server connections
      timeout = 30000, -- Timeout in milliseconds
      temperature = 0.1, -- kinda creative
      -- max_tokens = 8192,
      max_tokens = 50000,
    },
    mappings = {
      submit = {
        normal = "<CR>",
        insert = "<C-CR>",
      },
    },
    behaviour = {
      enable_token_counting = false, -- Whether to enable token counting. Default to true.
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      "zbirenbaum/copilot.lua",
      lazy = true,
      cmd = "Copilot",
      event = "InsertEnter",
    }, -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
