+++
title = "10 分钟上手：用 hugo-ashe 搭建个人网站"
date = "2026-02-11T10:00:00+08:00"
categories = ["Hugo", "Theme"]
summary = "从安装主题到本地预览，快速完成 hugo-ashe 的最小可用配置。"
+++

欢迎使用 **hugo-ashe**。

下面是最小流程：

```bash
# 1) 在你的 Hugo 站点引入主题
git submodule add https://github.com/ddnio/hugo-ashe.git themes/hugo-ashe

# 2) 配置主题
# theme = "hugo-ashe"

# 3) 本地运行
hugo server
```

请确保首页输出包含 JSON：

```toml
[outputs]
home = ["HTML", "RSS", "JSON"]
```

然后你就可以使用内置的：

- 站内搜索
- 图片灯箱
- 评论组件（Giscus，可选）
- 代码复制按钮

你可以继续在 `exampleSite/content/posts` 下添加更多文章。
