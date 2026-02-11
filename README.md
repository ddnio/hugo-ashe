# hugo-ashe

[![CI](https://github.com/nio/hugo-ashe/actions/workflows/ci.yml/badge.svg)](https://github.com/nio/hugo-ashe/actions/workflows/ci.yml)
[![Deploy Demo](https://github.com/nio/hugo-ashe/actions/workflows/pages.yml/badge.svg)](https://github.com/nio/hugo-ashe/actions/workflows/pages.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE)

`hugo-ashe` 是一个面向个人网站与内容站点的 Hugo 主题工具箱。

它强调三件事：

- **开箱可用**：最小配置可直接上线
- **内容优先**：阅读、检索、归档体验清晰
- **工程化维护**：提供 CI 与展示站点自动发布

## 在线展示

- Demo Site: [https://nio.github.io/hugo-ashe/](https://nio.github.io/hugo-ashe/)
- Demo Source: [`exampleSite/`](./exampleSite)

## 参考与致谢

本项目在视觉和工程组织上参考了以下项目：

- [hugo-PaperMod](https://github.com/adityatelange/hugo-PaperMod)
- [cosy-jekyll-theme](https://rubygems.org/gems/cosy-jekyll-theme)
- [tw93/tw93.github.io](https://github.com/tw93/tw93.github.io?tab=readme-ov-file)

## 功能概览

- 内容流式首页（文章列表 + 分页）
- 文章详情页（分类、推荐阅读）
- 站内搜索（基于 `index.json`）
- 图片灯箱（PhotoSwipe）
- 代码块复制按钮
- Giscus 评论（可选）
- 统计脚本（可选）

## 快速开始

### 1. 安装主题

在你的 Hugo 站点中执行：

```bash
cd /path/to/your-site
git submodule add https://github.com/nio/hugo-ashe.git themes/hugo-ashe
```

### 2. 启用主题

```toml
theme = "hugo-ashe"
```

### 3. 最小配置

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

### 4. 本地预览

```bash
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

## 主题开发

在本仓库内使用示例站点开发：

```bash
# 启动开发预览
hugo server --source exampleSite --themesDir ../.. --theme hugo-ashe

# 构建检查
hugo --source exampleSite --themesDir ../.. --theme hugo-ashe --minify
```

## 自动化工作流

本仓库内置两个 GitHub Actions：

- `CI`：在 `push` / `pull_request` 时验证主题可构建
- `Deploy Demo`：在 `main` 分支推送后自动发布 `exampleSite` 到 GitHub Pages

对应文件：

- [`.github/workflows/ci.yml`](./.github/workflows/ci.yml)
- [`.github/workflows/pages.yml`](./.github/workflows/pages.yml)

## 目录结构

- `assets/`：SCSS 样式源文件
- `layouts/`：Hugo 模板
- `static/`：静态资源（JS/CSS/图标）
- `exampleSite/`：演示站点与发布输入
- `.github/workflows/`：CI 与 Pages 工作流

## License

MIT
