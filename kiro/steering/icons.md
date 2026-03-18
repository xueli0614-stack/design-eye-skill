---
inclusion: always
---

# Icon Search with better-icons (MCP)

生成 UI 代码时，使用 `better-icons` MCP 工具搜索和获取真实 SVG 图标，禁止猜测图标路径或使用 emoji 占位。

## 工作流程

1. 使用 `search_icons` 搜索匹配的图标（优先 `lucide` 或 `heroicons` 前缀保持一致性）
2. 使用 `get_icon` 获取实际 SVG 代码
3. 将 SVG 直接内联到组件代码中

## 规则

- 始终从 better-icons 获取真实 SVG，绝不猜测图标路径或使用 emoji 作为图标
- 优先使用 `lucide` 集合（线条风格），`heroicons` 用于实心/线条配对
- 图标尺寸保持一致：标准 UI 用 24x24，紧凑布局用 20x20，行内用 16x16
- 使用 `currentColor` 作为 stroke/fill，让图标继承文字颜色
- 需要多个图标时使用 `get_icons` 批量获取，提高效率
- 搜索图标时用英文关键词（如 "home", "settings", "arrow"）
