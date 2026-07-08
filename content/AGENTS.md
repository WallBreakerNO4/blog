<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-07-08 | Updated: 2026-07-08 -->

# content

## Purpose
Hugo 内容根目录，存放博客所有 Markdown 内容文件。Hugo 根据 `content/` 下的目录结构自动生成 URL 路由：`content/posts/` 下的文章映射到 `/posts/` 路径，`content/about/index.md` 映射到 `/about/` 页面。

## Key Files
| 文件 | 描述 |
|------|------|
| `archives.md` | 存档页面内容文件，指定 `layout: "archives"` 和 `url: "/archives/"`，使用 PaperMod 主题的 archives 布局生成文章归档列表 |

## Subdirectories
| 目录 | 用途 |
|------|------|
| `about/` | 关于页面，仅含 `index.md`，展示作者教育、爱好、游戏等信息，使用 `figure` shortcode 插入头像图片 |
| `friends/` | 友链页面，仅含 `index.md`，以表格形式列出 10 个友链（头像、名称、描述） |
| `page/` | 空目录（仅 `.uuid` 同步标识），预留给独立页面，当前未使用 |
| `posts/` | 博文核心目录，存放所有已发布和草稿文章（见 `posts/AGENTS.md`） |

## For AI Agents

### Working In This Directory
- Hugo 的 content 组织规则：`_index.md` 表示 section 首页（列表页），`index.md` 表示叶子页面（独立页面），普通 `.md` 文件映射为单篇文章
- `about/` 和 `friends/` 使用 `index.md`（非 `_index.md`），因此它们是独立页面而非 section 列表页
- `archives.md` 通过 `url` 和 `layout` 参数自定义路由和模板，不依赖目录结构
- frontmatter 中 `ShowBreadCrumbs: false` 用于隐藏面包屑导航（如关于页和友链页）
- 图片使用外部图床（`https://image.wall-breaker-no4.xyz/`），不存放在 content 目录中

### Testing Requirements
- 新增或修改内容后，运行 `./testServer.sh` 验证页面渲染正常
- 检查 frontmatter 字段（title、date、draft）是否正确，draft 文件不应出现在正式构建中（除非启用 `-D`）
- 验证 shortcode（如 `figure`）是否正确渲染

### Common Patterns
- **Frontmatter 格式**：已发布博文使用 YAML（`---` 分隔），字段包括 title、date、draft、author，部分含 subtitle
- **草稿约定**：草稿文件放在 `posts/草稿/` 子目录，frontmatter 中 `draft: true`（或 `"true"`）
- **面包屑控制**：独立页面通过 `ShowBreadCrumbs: false` 关闭面包屑
- **图片引用**：使用 `{{< figure src="..." width="..." >}}` shortcode，图片托管在外部图床

## Dependencies

### Internal
- 依赖 `archetypes/default.md` 提供新建文章模板
- 依赖 `layouts/` 下的模板渲染内容
- `posts/` 子目录通过 Syncthing 同步，修改时注意同步状态

### External
- Hugo 内容管理系统
- PaperMod 主题模板（渲染内容页面）
- 外部图床（`image.wall-breaker-no4.xyz`）

<!-- MANUAL: 此行以下的手动添加内容会在重新生成时保留 -->
