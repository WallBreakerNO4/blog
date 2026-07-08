<!-- Parent: ../AGENTS.md -->
<!-- Generated: 2026-07-08 | Updated: 2026-07-08 -->

# assets

## Purpose
存放直接复制到构建输出 `/assets/` 路径的静态图标资源（favicon、PWA 图标等）。这些文件被 `hugo.yaml` 的 `params.assets` 配置引用，作为网站的 favicon 和 PWA 图标。与项目根 `assets/` 目录不同，此目录文件不经过 Hugo 资源管道，原样复制到输出。

## Key Files
| 文件 | 描述 |
|------|------|
| `site.webmanifest` | PWA 清单文件，定义应用图标（192x192 和 512x512 PNG）、主题色（`#ffffff`）、背景色（`#ffffff`）、显示模式（`standalone`）。name 和 short_name 字段为空，待填写 |
| `favicon.ico` | 主 favicon 图标，被 `hugo.yaml` 的 `params.assets.favicon` 引用 |
| `favicon-16x16.png` | 16x16 尺寸 favicon，被 `params.assets.favicon16x16` 引用 |
| `favicon-32x32.png` | 32x32 尺寸 favicon，被 `params.assets.favicon32x32` 引用 |
| `apple-touch-icon.png` | Apple Touch Icon，被 `params.assets.apple_touch_icon` 引用 |
| `android-chrome-192x192.png` | Android Chrome 192x192 PWA 图标 |
| `android-chrome-512x512.png` | Android Chrome 512x512 PWA 图标（注意：项目根 `assets/` 中对应文件为 256x256） |
| `mstile-150x150.png` | Windows 磁贴图标（150x150），被 `params.assets.safari_pinned_tab` 引用 |
| `safari-pinned-tab.svg` | Safari 固定标签页图标（SVG 矢量格式） |
| `browserconfig.xml` | Windows 磁贴配置文件，定义磁贴颜色和图标 |

## Subdirectories
无。

## For AI Agents

### Working In This Directory
- 这些文件被 `hugo.yaml` 的 `params.assets` 配置直接引用，路径前缀为 `assets/`（如 `assets/favicon.ico`）
- 与项目根 `assets/` 目录存在同名文件但内容有差异：此目录的 `site.webmanifest` 引用 512x512 图标，根目录的引用 256x256；此目录有 `android-chrome-512x512.png`，根目录有 `android-chrome-256x256.png`
- 实际被 Hugo 构建使用的是此目录（`static/assets/`）的文件，因为 `static/` 目录直接复制到输出根
- 修改 favicon 后可能需要清除浏览器缓存才能看到更新

### Testing Requirements
- 修改图标文件后，运行 `./testServer.sh` 检查浏览器标签页图标是否正确
- 验证 `site.webmanifest` 中的图标尺寸与实际文件名一致
- 运行 `hugo` 构建后检查 `public/assets/` 目录是否正确包含所有文件

### Common Patterns
- **Static 直传**：文件原样复制到输出 `/assets/` 路径，不做管道处理
- **Favicon 多尺寸**：提供 16x16、32x32、ico、apple-touch-icon、android-chrome 等多平台图标
- **hugo.yaml 引用**：通过 `params.assets` 配置项引用，PaperMod 主题自动在 `<head>` 中生成对应的 `<link>` 标签

## Dependencies

### Internal
- 被 `hugo.yaml` 的 `params.assets` 配置引用（favicon、favicon16x16、favicon32x32、apple_touch_icon、safari_pinned_tab）
- 与项目根 `assets/` 目录存在文件重叠，两者共同为网站提供图标资源

### External
- Hugo 静态文件处理机制
- PaperMod 主题（读取 `params.assets` 配置生成 favicon 链接）

<!-- MANUAL: 此行以下的手动添加内容会在重新生成时保留 -->
