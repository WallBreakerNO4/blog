<!-- Generated: 2026-07-08 | Updated: 2026-07-08 -->

# blog

## Purpose
这是一个基于 Hugo 的中文个人静态博客项目，使用 PaperMod 主题（通过 git submodule 管理）。博客部署在 `https://blog.wall-breaker-no4.xyz/`，语言为中文（`languageCode: zh`），时区为 `Asia/Shanghai`。博文内容涵盖技术教程（Tailscale 组网、Docker 代理、SSH 密钥等）、软件使用指南和大学生活分享，作者为 WallBreakerNO4。

## Key Files
| 文件 | 描述 |
|------|------|
| `hugo.yaml` | Hugo 主配置文件，定义 baseURL、语言、时区、主题（PaperMod）、首页信息、社交链接、菜单（朋友/关于/存档）、favicon 路径等 |
| `deploy.sh` | 部署脚本，执行 `git add .` → `git commit`（以本地时间戳为消息）→ `git push`，通过 Git 推送触发部署 |
| `testServer.sh` | 本地测试服务器脚本，从 `.env` 读取 `HUGO_SERVER_IP`/`HUGO_SERVER_PORT`，执行 `hugo server --bind=0.0.0.0 -F -D --poll 500ms --renderToMemory` |
| `README.md` | 项目说明，仅含标题和博客地址 |
| `.gitignore` | 忽略 `/public`（Hugo 构建输出）和 `.env`（含服务器配置，不纳入版本控制） |
| `.gitmodules` | Git 子模块配置，定义三个主题：`themes/PaperMod`（当前使用）、`themes/lowkey`、`themes/ananke`（后两者为历史尝试，未启用） |

## Subdirectories
| 目录 | 用途 |
|------|------|
| `archetypes/` | 内容模板，`hugo new` 命令使用的 frontmatter 模板（见 `archetypes/AGENTS.md`） |
| `assets/` | 经过 Hugo 资源管道处理的 PWA/ favicon 资源（见 `assets/AGENTS.md`） |
| `content/` | Hugo 内容根目录，存放所有博客文章和独立页面（见 `content/AGENTS.md`） |
| `layouts/` | 自定义模板覆盖层，覆盖 PaperMod 主题默认模板（见 `layouts/AGENTS.md`） |
| `static/` | 直接复制到构建输出的静态资源（见 `static/AGENTS.md`） |
| `data/` | 空目录，预留给 Hugo 数据文件（TOML/YAML/JSON），当前未使用 |
| `i18n/` | 空目录，预留给国际化翻译文件，当前使用 PaperMod 主题自带翻译 |
| `resources/` | Hugo 构建缓存目录（生成的 `_gen` 子目录），不纳入版本控制，不需要手动管理 |
| `themes/` | 第三方主题 git submodule（PaperMod/lowkey/ananke），不是本项目代码，不应修改 |

## For AI Agents

### Working In This Directory
- 修改 `hugo.yaml` 后必须用 `testServer.sh` 验证配置生效，再考虑部署
- `deploy.sh` 会将所有变更（含 content 和配置）一次性提交并推送，确保只提交预期内容
- 主题切换需同时修改 `hugo.yaml` 的 `theme` 字段和确保对应 submodule 已初始化（`git submodule update --init`）
- 不要修改 `themes/` 下的任何文件，主题定制应通过 `layouts/` 覆盖或 `hugo.yaml` 参数实现

### Testing Requirements
- 本地预览：运行 `./testServer.sh`，默认监听 `127.0.0.1:1313`（可通过 `.env` 配置 IP 和端口）
- 该脚本启用 `-D`（渲染草稿）和 `-F`（渲染未来日期文章），`--poll 500ms` 支持热更新
- 构建验证：运行 `hugo` 命令检查是否能无错误构建（输出到 `public/`）
- 部署前务必确认本地预览无异常

### Common Patterns
- **内容组织**：博文放在 `content/posts/` 下，文件名以数字前缀排序（如 `0.my-first-post.md`、`1.TS3.md`）
- **Frontmatter 格式**：博文使用 YAML frontmatter（`---` 分隔），archetype 模板使用 TOML（`+++` 分隔）
- **主题定制**：通过项目根 `layouts/` 目录覆盖主题模板（Hugo 模板查找优先级：项目 layouts > 主题 layouts）
- **静态资源引用**：`hugo.yaml` 中 `params.assets` 的 favicon 路径指向 `static/assets/` 下的文件
- **部署方式**：Git 推送触发部署（`deploy.sh`），非 Hugo 内置部署

## Dependencies

### Internal
- `content/posts/` 提供博文内容，是博客的核心
- `layouts/partials/comments.html` 覆盖主题评论模板，启用 Giscus 评论
- `static/assets/` 提供 favicon 和 PWA 图标，被 `hugo.yaml` 引用
- `archetypes/default.md` 为新建博文提供 frontmatter 模板

### External
- **Hugo**：静态站点生成器（extended 版本，需支持 SCSS）
- **PaperMod 主题**：git submodule，来源 `https://github.com/adityatelange/hugo-PaperMod.git`
- **Giscus**：基于 GitHub Discussions 的评论系统，依赖仓库 `WallBreakerNO4/blog`
- **Git**：版本控制和部署工具

<!-- MANUAL: 此行以下的手动添加内容会在重新生成时保留 -->
