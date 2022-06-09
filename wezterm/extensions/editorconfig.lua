local wezterm = require("wezterm")

local _config = {}

local editor_config = function()
  if _config then
    return _config
  end
  local os_name = vim.loop.os_uname().sysname

  local is_windows = os_name == "Windows_NT"

  local path_sep = is_windows and "\\" or "/"

  local home = is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")
  local local_config_path = home .. path_sep .. ".editor.lua"
  local ok, __config = pcall(dofile, config_path)

  if not ok then
    if not string.find(__config, "No such file or directory") then
      wezterm.log_error(__config)
    end
    local default_config_file = io.open(M.vim_path .. M.path_sep .. ".editor.lua", "r")
    local default_config = default_config_file:read("*a")
    default_config_file:close()
    local local_config_file = io.open(config_path, "w")
    local_config_file:write(default_config)
    local_config_file:close()
    __config = dofile(config_path)
  end

  _config = vim.deepcopy(__config)
  return _config
end

editor_config()

return _config
