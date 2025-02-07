local status, hlchunk = pcall(require, "hlchunk")
if not status then
    vim.notify("没有找到 hlchunk")
    return
end

hlchunk.setup({
    chunk={
        enable=true,
    },
    indent={
        enable=true,
    },
    line_num={
        enable=true,
    },
    blank={
        enable=true,
    },
})
