return
  {
    "epwalsh/obsidian.nvim",
    lazy = false,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      lazy = true,
    },
    opts = {
      disable_frontmatter = true, -- fix the auto-formatting bug
      workspaces = {
        {
          name = "OBSIDIAN",
          path = "/Users/gambhirsharma/Library/CloudStorage/OneDrive-Universita\'degliStudidiRomaTorVergata/OBSIDIAN",
          --   templates = {
          --     folder = "assets/Template",
          --     date_format = "%Y-%m-%d-%a",
          --     time_format = "%H:%M",
          --   },
        },
        {
          name = "Engineering-Sciences",
          path =
            "/Users/gambhirsharma/Library/CloudStorage/OneDrive-Universita\'degliStudidiRomaTorVergata/Engineering-Sciences"
        },
      },
      -- see below for full list of options 👇
      templates = {
        folder =
          "/Users/gambhirsharma/Library/CloudStorage/OneDrive-Universita\'degliStudidiRomaTorVergata/OBSIDIAN/assets/Template",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },
      -- writing down template for Erusmus job applicaton:
      erusmus_job = {
        folder = "/Users/gambhirsharma/Library/CloudStorage/OneDrive-Universita'degliStudidiRomaTorVergata/OBSIDIAN/Coding/JOB/Company/ERUSMUS/ls",
        tempalte = "/Users/gambhirsharma/Library/CloudStorage/OneDrive-Universita'degliStudidiRomaTorVergata/OBSIDIAN/assets/Template/snippets/Erusmus_Trainaship_Template.md"
      },
      -- solve the issue #2 `<render-markdown.nvim> is not working properly`
      ui = { enable = false, }
    },
  }
