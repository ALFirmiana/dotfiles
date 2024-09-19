local function get_fcitx5_state()
  local handle = io.popen("fcitx5-remote")
  local result = handle:read("*a")
  handle:close()
  return tonumber(result)
end

local fcitx5state = get_fcitx5_state()

-- 退出插入模式时禁用输入法，并保存状态
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    fcitx5state = get_fcitx5_state()
    os.execute("fcitx5-remote -c")
  end,
})

-- 2 表示之前状态打开了输入法，则进入插入模式时启动输入法
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    if fcitx5state == 2 then
      os.execute("fcitx5-remote -o")
    end
  end,
})
