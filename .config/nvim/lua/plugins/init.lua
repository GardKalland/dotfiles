local plugin_path = vim.fn.stdpath "config" .. "/lua/custom/plugins"
local plugin_files = vim.fn.globpath(plugin_path, "*.lua", false, true)

local plugins = {}

for _, file in ipairs(plugin_files) do
  local module_name = file:match "custom/plugins/(.*)%.lua$"
  if module_name ~= "init" then -- avoid recursion
    local ok, plugin = pcall(require, "custom.plugins." .. module_name)
    if ok then
      if type(plugin) == "table" then
        for _, p in ipairs(plugin) do
          table.insert(plugins, p)
        end
      end
    else
      vim.notify("Error loading plugin: " .. module_name, vim.log.levels.ERROR)
    end
  end
end

return plugins
