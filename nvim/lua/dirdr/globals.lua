local uname = vim.loop.os_uname()

_G.OS = uname.sysname
_G.IS_MAC = OS == "Darwin"
_G.IS_LINUX = OS == "Linux"

-- Wrapper of print + vim.inspect
P = function(v)
  print(vim.inspect(v))
  return v
end
