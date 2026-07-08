<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-07-08 | Updated: 2026-07-08 -->

# static

## Purpose
存放直接复制到 Hugo 构建输出（`public/`）根目录的静态资源文件。与 `assets/` 不同，此目录的文件不经过 Hugo 资源管道处理，而是原样复制。包括自定义 404 页面和 favicon/PWA 图标资源。

## Key Files
| 文件 | 描述 |
|------|------|
| `404.html` | 自定义 404 页面，使用 Hugo 模板语法（`{{ define "main" }}`），显示标题和"Not Found"提示文案。会覆盖 PaperMod 主题的默认 404 页面 |

## Subdirectories
| 目录 | 用途 |
|------|------|
| `assets/` | 静态图标资源（favicon、PWA 图标等），直接复制到输出 `/assets/` 路径，被 `hugo.yaml` 的 `params.assets` 引用（见 `assets/AGENTS.md`） |

## For AI Agents

### Working In This Directory
- 此目录的文件原样复制到 `public/`，不做任何处理，适合存放不需要管道加工的资源
- `404.html` 使用 Hugo 模板语法（`{{ define "main" }}`），会被 Hugo 当作模板处理而非纯静态文件
- `static/assets/` 下的 favicon 被 `hugo.yaml` 的 `params.assets` 配置直接引用（如 `assets/favicon.ico`）
- 注意 `static/assets/` 与项目根 `assets/` 的区别：前者直接复制到输出，后者经过资源管道

### Testing Requirements
- 修改 404 页面后，运行 `./testServer.sh` 并访问不存在的路径验证 404 页面渲染
- 修改 favicon 后，检查浏览器标签页图标是否更新
- 运行 `hugo` 构建后，检查 `public/` 下是否正确包含 `404.html` 和 `assets/` 目录

### Common Patterns
- **Static 直传模式**：文件按原路径结构复制到输出，如 `static/assets/favicon.ico` → `public/assets/favicon.ico`
- **404 模板覆盖**：通过在 `static/` 下放置 `404.html` 覆盖 Hugo/主题的默认 404 行为

## Dependencies

### Internal
- `static/assets/` 被 `hugo.yaml` 的 `params.assets` 配置引用，提供 favicon 和 PWA 图标
- `404.html` 覆盖主题的 404 模板

### External
- Hugo 静态文件处理机制

<!-- MANUAL: 此行以下的手动添加内容会在重新生成时保留 -->
