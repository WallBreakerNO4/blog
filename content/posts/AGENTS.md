<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-07-08 | Updated: 2026-07-08 -->

# posts

## Purpose
博文核心目录，存放所有已发布的博客文章和草稿。这是博客内容的主体，Hugo 将此目录映射为 `/posts/` section，自动生成文章列表。文件名以数字前缀排序，控制博文在列表中的显示顺序。此目录通过 Syncthing 与其他设备同步。

## Key Files
| 文件 | 描述 |
|------|------|
| `0.my-first-post.md` | Hello World（2023-11-16），首篇博文，简短的自我介绍 |
| `1.TS3.md` | TeamSpeak 3 客户端使用教程（2023-11-16），VoIP 语音聊天软件使用指南 |
| `2.我的博客.md` | 博客搭建过程记录（2023-11-20），从域名到部署的建站全流程 |
| `3.Ubuntu-zsh.md` | 在 Ubuntu 上安装 zsh 以及高亮、自动补全插件（2023-11-22） |
| `4.Windows下生成并使用密钥登陆Linux.md` | Windows 下生成并使用 SSH 密钥登录 Linux（2024-06-12） |
| `5.Docker代理.md` | 如何为 Docker 添加代理（2024-06-13），配置 Docker Daemon 代理拉取镜像 |
| `6.使用 Tailscale 组网.md` | 使用 Tailscale 组网（2024-08-01），NAS 内网穿透与组网方案 |
| `7.Tailscale 进阶使用教程 - 子网路由和自建中转.md` | Tailscale 进阶教程（2025-01-17），子网路由和自建 DERP 中转 |
| `8.白嫖腾讯云GPU跑Stable Diffusion WebUI.md` | 白嫖腾讯云 GPU 跑 Stable Diffusion（2025-01-18），Cloud Studio GPU 使用指南 |
| `9.CDS 新生电脑使用指南.md` | CDS 新生电脑使用指南（2025-07-28），面向新生的电脑使用习惯与工具推荐 |

## Subdirectories
| 目录 | 用途 |
|------|------|
| `草稿/` | 草稿目录，存放未完成的文章（见 `草稿/AGENTS.md`） |
| `垃圾桶/` | 空目录，已废弃的文章回收站，当前无内容 |
| `.stfolder/` | Syncthing 同步标识目录，非项目内容，不要修改 |

## For AI Agents

### Working In This Directory
- **命名约定**：文件名以数字前缀 + 点号开头（如 `0.`、`1.`、`9.`），数字决定博文在列表中的排序
- **Frontmatter 约定**：使用 YAML 格式（`---` 分隔），必填字段为 `title`、`date`、`draft`（`false` 表示已发布）、`author`（通常为 `WallBreakerNO4`）
- **草稿管理**：未完成的文章放在 `草稿/` 子目录，frontmatter 中 `draft` 设为 `true`（部分文件使用字符串 `"true"`）
- **Syncthing 同步**：此目录通过 Syncthing 同步，修改文件后注意同步冲突（`.sync-conflict` 文件）。`.stfolder` 和 `.uuid` 是同步标识，不要删除
- **日期格式**：`date` 字段使用 ISO 8601 格式（如 `2025-01-17T15:42:00Z`），时区为 UTC（`Z` 后缀）
- **图片引用**：博文中的图片使用外部图床 URL（`https://image.wall-breaker-no4.xyz/`），不存放在本地

### Testing Requirements
- 新增博文后，运行 `./testServer.sh` 验证文章能正确渲染（该脚本启用 `-D` 会同时渲染草稿）
- 发布前确认 `draft` 字段为 `false`（布尔值，非字符串）
- 检查 frontmatter 的 `date` 是否正确，影响文章排序和归档
- 正式部署前运行 `hugo` 命令（不带 `-D`），确认草稿不会被构建

### Common Patterns
- **数字前缀排序**：`{序号}.{标题}.md`，序号从 0 开始递增，新文章追加下一个序号
- **YAML Frontmatter**：统一使用 `---` 分隔的 YAML 格式，与 archetype 模板的 TOML 格式不同
- **外部图床**：所有图片通过 Markdown 图片语法或 `figure` shortcode 引用外部 URL
- **草稿隔离**：草稿统一放在 `草稿/` 子目录，与已发布文章物理隔离

## Dependencies

### Internal
- 依赖 `archetypes/default.md` 提供新建文章的初始 frontmatter
- 依赖 `layouts/` 和 PaperMod 主题模板渲染文章页面
- `草稿/` 子目录存放未完成内容，完成后移至此目录并修改 `draft` 为 `false`

### External
- Syncthing（目录同步）
- 外部图床（`image.wall-breaker-no4.xyz`）

<!-- MANUAL: 此行以下的手动添加内容会在重新生成时保留 -->
