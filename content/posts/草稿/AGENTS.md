<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-07-08 | Updated: 2026-07-08 -->

# 草稿

## Purpose
存放未完成或未发布的博客文章草稿。这些文章的 frontmatter 中 `draft` 设为 `true`，在正式构建（`hugo` 不带 `-D`）时不会被输出。文章完成后需移至上级 `posts/` 目录并将 `draft` 改为 `false`。

## Key Files
| 文件 | 描述 |
|------|------|
| `Pi Agent 入门教程.md` | Pi Agent 入门教程（2026-07-04），最新草稿，内容尚待编写 |
| `在安卓下同时使用 Clash 和 Tailscale.md` | 在安卓下同时运行 Clash 和 Tailscale（2024-06-19），通过 Magisk Tailscaled 模块实现双 VPN 共存 |
| `如何用SD来涩涩.md` | 如何用 Stable Diffusion 生成 NSFW 内容（2024-12-21），内容尚待编写 |
| `我的世界优化Mod记录.md` | 我的世界优化 Mod 记录（2025-03-11），涉及 C2ME 等 Fabric 优化模组 |
| `记录一下给家里升级企业级组网踩的坑.md` | 家庭无线网络升级组网记录（2024-11-03），frontmatter 中 title 为空，需补充 |
| `通过 Tailscale 为 CloudFlare Tunnel 配置透明代理来提升速度.md` | 通过 Tailscale 为 Cloudflare Tunnel 配置透明代理（2024-07-30），注意文件名中 title 有笔误（"代透明理"应为"透明代理"） |

## Subdirectories
无。

## For AI Agents

### Working In This Directory
- 所有文件 frontmatter 中 `draft` 均为 `true`（部分使用字符串 `"true"`），正式发布前需改为布尔值 `false`
- `记录一下给家里升级企业级组网踩的坑.md` 的 `title` 字段为空，发布前必须填写
- `通过 Tailscale 为 CloudFlare Tunnel 配置透明代理来提升速度.md` 的 frontmatter title 有笔误（"代透明理"），发布前应修正为"透明代理"
- 草稿完成后，将文件移至上级 `posts/` 目录，按命名约定添加数字前缀，并修改 `draft` 为 `false`
- 此目录同样受 Syncthing 同步影响

### Testing Requirements
- `./testServer.sh` 启用了 `-D` 参数，可以预览草稿内容
- 正式部署前运行 `hugo`（不带 `-D`），确认草稿不会出现在构建输出中
- 检查每篇草稿的 frontmatter 完整性（title 非空、date 有效、draft 为 true）

### Common Patterns
- 草稿文件名无数字前缀（与已发布博文不同），使用纯标题命名
- Frontmatter 使用 YAML 格式（`---` 分隔），`draft` 字段标记草稿状态
- 部分草稿 frontmatter 使用字符串 `"true"` 而非布尔值 `true`，建议统一为布尔值

## Dependencies

### Internal
- 完成后移至上级 `posts/` 目录发布
- 依赖 `layouts/` 和 PaperMod 主题模板渲染草稿预览

### External
- Syncthing（目录同步）

<!-- MANUAL: 此行以下的手动添加内容会在重新生成时保留 -->
