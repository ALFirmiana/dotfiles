local status, sentiment = pcall(require, "sentiment")
if not status then
	vim.notify("没有找到 sentiment")
	return
end

sentiment.setup({})
