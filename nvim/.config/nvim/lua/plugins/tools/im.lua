local function gh(repo) return 'https://github.com/' .. repo end

local uname = vim.uv.os_uname()

if uname.sysname == 'Linux' then
  vim.pack.add { gh 'h-hg/fcitx.nvim' }
elseif uname.sysname == 'Darwin' then
  vim.pack.add { gh 'keaising/im-select.nvim' }
  require('im_select').setup {}
end

-- vim: ts=2 sts=2 sw=2 et
