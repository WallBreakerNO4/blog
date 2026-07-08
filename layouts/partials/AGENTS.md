<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-07-08 | Updated: 2026-07-08 -->

# partials

## Purpose
存放自定义 Hugo partial 模板片段。此目录下的模板会覆盖 PaperMod 主题中同路径的 partial 模板，实现对主题功能的定制。当前包含评论系统的覆盖模板，通过嵌入 Giscus 脚本替代主题默认的评论方案。

## Key Files
| 文件 | 描述 |
|------|------|
| `comments.html` | Giscus 评论系统模板，覆盖 PaperMod 主题的 `partials/comments.html`。通过加载 `https://giscus.app/client.js` 脚本嵌入基于 GitHub Discussions 的评论组件。配置参数：仓库 `WallBreakerNO4/blog`、分类 `Announcements`、映射方式 `pathname`、主题 `noborder_gray`、语言 `zh-CN`、评论输入框位置 `bottom`、启用表情回应 |

## Subdirectories
无。

## For AI Agents

### Working In This Directory
- `comments.html` 完全替代了 PaperMod 主题自带的评论模板，修改时注意不要破坏 Giscus 脚本的 `data-*` 属性
- Giscus 的 `data-repo-id` 和 `data-category-id` 是 GitHub 仓库的唯一标识，更换仓库时需在 giscus.app 重新生成
- 如需禁用评论，可将此文件清空或注释掉脚本，而非删除文件（删除会回退到主题默认模板）
- 评论功能由 `hugo.yaml` 中 `params.comments: true` 控制，PaperMod 主题根据此参数决定是否加载 `comments.html`

### Testing Requirements
- 修改评论模板后，运行 `./testServer.sh`，打开任意博文页面检查评论区是否正常加载
- 验证 Giscus 主题（`noborder_gray`）和语言（`zh-CN`）是否生效
- 检查浏览器控制台是否有 Giscus 脚本加载错误

### Common Patterns
- **Partial 覆盖模式**：在项目 `layouts/partials/` 下创建与主题同名的文件，Hugo 优先使用项目模板
- **Giscus 配置**：所有配置通过 `<script>` 标签的 `data-*` 属性传入，无需额外 JavaScript 代码
- **评论开关**：由 `hugo.yaml` 的 `params.comments` 控制，模板本身不判断开关

## Dependencies

### Internal
- 覆盖 `themes/PaperMod/layouts/partials/comments.html`
- 被 PaperMod 主题的 `single.html` 模板调用（当 `params.comments` 为 `true` 时）
- 依赖 `hugo.yaml` 中 `params.comments: true` 启用

### External
- **Giscus**（`giscus.app`）：基于 GitHub Discussions 的评论系统
- **GitHub 仓库** `WallBreakerNO4/blog`：Giscus 评论数据的存储后端

<!-- MANUAL: 此行以下的手动添加内容会在重新生成时保留 -->
