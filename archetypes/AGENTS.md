<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-07-08 | Updated: 2026-07-08 -->

# archetypes

## Purpose
存放 Hugo 内容模板文件。当使用 `hugo new` 命令创建新内容时，Hugo 会从此目录读取对应的 archetype 模板，自动填充 frontmatter 字段（如 title、date、draft）。

## Key Files
| 文件 | 描述 |
|------|------|
| `default.md` | 默认内容模板，使用 TOML frontmatter（`+++` 分隔）。模板字段：`title`（从文件名转换，将连字符替换为空格并首字母大写）、`date`（自动填充当前时间）、`draft`（默认为 `true`，新建文章默认为草稿） |

## Subdirectories
无。

## For AI Agents

### Working In This Directory
- 修改 `default.md` 的 frontmatter 模板会影响所有通过 `hugo new` 创建的新文章
- 当前模板使用 TOML 格式（`+++`），但实际已发布博文使用 YAML 格式（`---`），创建后可能需要手动转换格式
- 如需为不同 section 定制模板，可创建如 `posts.md` 等 section 专属 archetype

### Testing Requirements
- 修改模板后，运行 `hugo new posts/test-post.md` 验证模板字段是否正确填充
- 检查生成的文件中 title、date、draft 字段是否符合预期

### Common Patterns
- `{{ replace .File.ContentBaseName "-" " " | title }}`：Hugo 模板函数，将文件名中的连字符替换为空格并做标题化处理
- `{{ .Date }}`：自动填充文章创建时间
- 新建文章默认 `draft: true`，发布前需改为 `false`

## Dependencies

### Internal
- 被 `hugo new` 命令调用，生成的文件存入 `content/` 对应 section 下

### External
- 依赖 Hugo 的 archetype 机制

<!-- MANUAL: 此行以下的手动添加内容会在重新生成时保留 -->
