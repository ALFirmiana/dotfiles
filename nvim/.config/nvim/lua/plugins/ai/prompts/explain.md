---
name: Explain code
interaction: chat
description: 解释选中的代码
opts:
  alias: explain-zh
  auto_submit: true
  is_slash_cmd: true
  modes:
    - v
  stop_context_insertion: true
---

## user

请解释 buffer ${context.bufnr} 中的这段代码：

````${context.filetype}
${context.code}
````
