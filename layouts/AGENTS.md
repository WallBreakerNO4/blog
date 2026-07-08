<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-07-08 | Updated: 2026-07-08 -->

# layouts

## Purpose
自定义 Hugo 模板覆盖层。Hugo 的模板查找顺序为：项目 `layouts/` 优先于主题 `themes/PaperMod/layouts/`。此目录下的模板文件会覆盖 PaperMod 主题的对应模板，实现评论系统等定制功能，而无需修改主题源码。

## Key Files
无（本目录仅包含子目录 `partials/`，具体模板文件在 `partials/` 下）。

## Subdirectories
| 目录 | 用途 |
|------|------|
| `partials/` | 自定义 partial 模板片段，目前包含 `comments.html`（Giscus 评论系统覆盖，见 `partials/AGENTS.md`） |

## For AI Agents

### Working In This Directory
- 在此目录新增模板文件会覆盖 PaperMod 主题的对应模板，需先查阅主题模板结构以确定覆盖路径
- Hugo 模板查找优先级：`layouts/<section>/<layout>.html` > `themes/PaperMod/layouts/<section>/<layout>.html`
- 覆盖 partial 模板时，路径需与主题中的 partial 路径完全一致（如 `partials/comments.html`）
- 不要修改 `themes/` 下的主题文件，所有定制通过此目录实现

### Testing Requirements
- 修改或新增模板后，运行 `./testServer.sh` 验证页面渲染正常，无模板错误
- 特别检查被覆盖的功能（如评论系统）是否按预期工作
- 使用 `hugo` 命令构建，检查是否有模板解析错误

### Common Patterns
- **Partial 覆盖模式**：在项目 `layouts/partials/` 下创建与主题同名的 partial 文件，实现覆盖
- **Giscus 集成**：通过覆盖 `comments.html` partial 嵌入 Giscus 评论脚本，配置参数（repo、category、theme、lang）直接写在模板中

## Dependencies

### Internal
- 覆盖 `themes/PaperMod/layouts/partials/comments.html`（主题自带的评论模板）
- 被 Hugo 模板引擎调用，渲染 `content/` 下的内容

### External
- Hugo 模板引擎
- PaperMod 主题（提供被覆盖的基础模板）

<!-- MANUAL: 此行以下的手动添加内容会在重新生成时保留 -->
