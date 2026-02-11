# hugo-ashe

[![CI](https://github.com/ddnio/hugo-ashe/actions/workflows/ci.yml/badge.svg)](https://github.com/ddnio/hugo-ashe/actions/workflows/ci.yml)
[![Deploy Demo](https://github.com/ddnio/hugo-ashe/actions/workflows/pages.yml/badge.svg)](https://github.com/ddnio/hugo-ashe/actions/workflows/pages.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE)

`hugo-ashe` 是一个面向个人网站与内容站点的 Hugo 主题工具箱。

设计目标：

- 开箱可用：最小配置即可跑起来
- 内容优先：写作、检索、归档体验优先
- 工程化维护：自带 CI 与 Demo 自动发布

## 在线展示

- Demo Site: [https://ddnio.github.io/hugo-ashe/](https://ddnio.github.io/hugo-ashe/)
- Demo Source: [`exampleSite/`](./exampleSite)

## 参考与致谢

本项目在视觉和工程组织上参考了以下项目：

- [hugo-PaperMod](https://github.com/adityatelange/hugo-PaperMod)
- [cosy-jekyll-theme](https://rubygems.org/gems/cosy-jekyll-theme)
- [tw93/tw93.github.io](https://github.com/tw93/tw93.github.io?tab=readme-ov-file)

## 功能概览

- 内容流式首页（文章列表 + 分页）
- 文章详情页（分类/标签 + Read More）
- 站内搜索（基于 `index.json`）
- 图片灯箱（PhotoSwipe）
- 代码块复制按钮
- Giscus 评论（可选）
- 统计脚本（可选）

## 环境要求

- Hugo Extended `>= 0.127.0`

可用命令检查：

```bash
hugo version
```

## 快速开始（已有 Hugo 站点）

### 1) 安装主题

```bash
cd /path/to/your-site
git submodule add https://github.com/ddnio/hugo-ashe.git themes/hugo-ashe
```

### 2) 启用主题

```toml
theme = "hugo-ashe"
```

### 3) 最小配置（必须含 JSON 输出）

```toml
baseURL = "https://example.com/"
languageCode = "zh-CN"
title = "My Site"
theme = "hugo-ashe"

[outputs]
home = ["HTML", "RSS", "JSON"]

[params]
description = "A clean content-first site"
name = "Your Name"
github = "your-github-id"
repo = "your-github-id/your-repo"

[params.busuanzi]
enable = false
scriptURL = "//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"
```

### 4) 本地运行

```bash
hugo server
```

## 快速开始（从零新建站点）

```bash
hugo new site mysite
cd mysite
git init
git submodule add https://github.com/ddnio/hugo-ashe.git themes/hugo-ashe
```

将上面的“最小配置”写入 `hugo.toml` 后：

```bash
hugo new content posts/hello.md
hugo server
```

## 可选配置

### Giscus 评论

```toml
[params.giscus]
repo = "owner/repo"
repoId = "..."
category = "Announcements"
categoryId = "..."
mapping = "title"
lang = "zh-CN"
```

### 社交信息

```toml
[params]
github = "your-github-id"
twitter = "your-twitter-id"
repo = "your-github-id/your-repo"
```

### 文章分类与标签

```toml
+++
title = "我的文章"
date = "2026-02-11T10:00:00+08:00"
categories = ["Hugo", "Theme"]
tags = ["hugo", "quickstart"]
+++
```

主题会自动生成：

- 标签页：`/tags/`
- 标签详情页：`/tags/<tag>/`
- 单篇与列表页中的标签入口

## 主题开发

在本仓库内使用示例站点开发：

```bash
# 启动预览
hugo server --source exampleSite --themesDir ../.. --theme hugo-ashe

# 构建检查
hugo --source exampleSite --themesDir ../.. --theme hugo-ashe --minify
```

## 自动化工作流

仓库内置 2 个 GitHub Actions：

- `CI`：在 `push` / `pull_request` 时验证主题可构建
- `Deploy Demo`：在 `main` 分支推送后自动发布 `exampleSite` 到 GitHub Pages

对应文件：

- [`.github/workflows/ci.yml`](./.github/workflows/ci.yml)
- [`.github/workflows/pages.yml`](./.github/workflows/pages.yml)

## 常见问题

### Demo 访问 404

优先检查：

1. 仓库 `Settings -> Pages` 是否启用 `GitHub Actions`
2. `Deploy Demo` 工作流最近一次是否成功
3. 是否使用了正确链接：`https://ddnio.github.io/hugo-ashe/`

### 搜索无结果

确保站点配置包含：

```toml
[outputs]
home = ["HTML", "RSS", "JSON"]
```

## 目录结构

- `assets/`：SCSS 样式源文件
- `layouts/`：Hugo 模板
- `static/`：静态资源（JS/CSS/图标）
- `exampleSite/`：演示站点与发布输入
- `.github/workflows/`：CI 与 Pages 工作流

## License

MIT
