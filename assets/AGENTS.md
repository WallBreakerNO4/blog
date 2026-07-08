<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-07-08 | Updated: 2026-07-08 -->

# assets

## Purpose
存放经过 Hugo 资源管道（Asset Pipeline）处理的网站资源文件，主要包括 PWA 清单和各尺寸的 favicon/图标。与 `static/assets/` 不同，此目录的文件可通过 Hugo Pipes（`resources.Get` 等）进行哈希、压缩等处理。当前这些文件作为 favicon 和 PWA 图标的源资源存在。

## Key Files
| 文件 | 描述 |
|------|------|
| `site.webmanifest` | PWA 清单文件，定义应用图标（192x192 和 256x192 PNG）、主题色（`#ffffff`）、背景色（`#ffffff`）、显示模式（`standalone`）。name 和 short_name 字段为空，待填写 |
| `favicon.ico` | 主 favicon 图标文件 |
| `favicon-16x16.png` | 16x16 尺寸 favicon |
| `favicon-32x32.png` | 32x32 尺寸 favicon |
| `apple-touch-icon.png` | Apple Touch Icon（iOS 添加到主屏图标） |
| `android-chrome-192x192.png` | Android Chrome 192x192 PWA 图标 |
| `android-chrome-256x256.png` | Android Chrome 256x256 PWA 图标 |
| `mstile-150x150.png` | Windows磁贴图标（150x150） |
| `safari-pinned-tab.svg` | Safari 固定标签页图标（SVG 矢量格式） |
| `browserconfig.xml` | Windows 磁贴配置文件 |

## Subdirectories
无。

## For AI Agents

### Working In This Directory
- 注意此目录（`assets/`）与 `static/assets/` 存在同名文件，但内容有差异：此目录的 `site.webmanifest` 引用 256x256 图标，而 `static/assets/` 的引用 512x512 图标
- `hugo.yaml` 中 `params.assets` 的 favicon 路径（如 `assets/favicon.ico`）实际指向 `static/assets/` 下的文件，而非此目录
- 如需通过 Hugo Pipes 处理资源（如 SCSS 编译、图片优化），将文件放在此目录

### Testing Requirements
- 修改图标文件后，运行 `./testServer.sh` 并检查浏览器标签页和 PWA 安装界面是否正确显示新图标
- 检查 `site.webmanifest` 中的图标路径和尺寸是否与实际文件匹配

### Common Patterns
- favicon 多尺寸约定：提供 16x16、32x32、ico 三种基础尺寸，加上各平台专属图标
- PWA 清单需与实际图标文件尺寸严格对应

## Dependencies

### Internal
- 与 `static/assets/` 存在文件重叠，两者共同为网站提供 favicon 和 PWA 资源

### External
- Hugo Asset Pipeline（资源管道）

<!-- MANUAL: 此行以下的手动添加内容会在重新生成时保留 -->
