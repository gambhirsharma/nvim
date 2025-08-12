-- Enhanced benchmark script
local M = {}

function M.run_benchmark()
  local results = {
    startup_phases = {},
    plugin_times = {},
    lazy_load_times = {},
    total_startup_time = 0,
    memory_usage = 0
  }
  
  local start_time = vim.loop.hrtime()
  
  -- Hook into plugin loading
  local original_require = require
  require = function(name)
    local plugin_start = vim.loop.hrtime()
    local result = original_require(name)
    local plugin_end = vim.loop.hrtime()
    
    results.plugin_times[name] = (plugin_end - plugin_start) / 1000000
    return result
  end
  
  -- Measure different startup phases
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      results.startup_phases.vim_enter = (vim.loop.hrtime() - start_time) / 1000000
    end
  })
  
  return results
end

return M
