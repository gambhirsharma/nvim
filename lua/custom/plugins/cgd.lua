return {
  dir = "gambhirsharma/cgd.nvim",
  config = function()
    require("cgd").setup({
      endpoint = "https://chat.gambhir.dev/v1/chat/completions",
      model = "qwen2.5:7b",
      token = "", 
    })
  end,
}

