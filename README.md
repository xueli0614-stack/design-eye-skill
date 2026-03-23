# 🎨 Design Eye — 设计之眼 Kiro Skill

移动端审美增强系统。支持两种视觉风格（Apple HIG + Liquid Glass / Material Design 3）和两种品牌模式（哈啰品牌 / 无品牌），自动应用色彩体系、字体体系、形状/材质、动效、信息层级和无障碍标准。

## 功能

- 双视觉风格：Apple 风格（默认，Liquid Glass 毛玻璃）/ M3 风格（Material Design 3）
- 双品牌模式：哈啰品牌规范（默认）/ 无品牌模式（纯风格系统原生配色）
- 哈啰共享 C 端品牌规范（色彩/字体/圆角/间距/阴影/动效）
- 风格合规检查（M3 色彩角色/字体角色/形状/动效 或 Apple HIG/Liquid Glass/SF 字体/iOS 动效）
- 防灾难检查清单（配色/排版/布局/动效/组件/Liquid Glass）
- 审美评分报告（每次输出自动附带，按风格分支评分）
- better-icons 图标集成（20 万+ 真实 SVG 图标，自动搜索内联）

## 前置要求

- [Kiro IDE](https://kiro.dev)
- Node.js（用于 better-icons MCP server）

## 安装

### 方式一：一键安装（推荐）

```bash
git clone https://github.com/xueli0614-stack/design-eye-skill.git
cd design-eye-skill
bash install.sh
```

### 方式二：手动安装

1. 复制 steering 文件到项目或用户目录：

```bash
# 项目级（仅当前项目生效）
cp kiro/steering/design-eye.md  你的项目/.kiro/steering/
cp kiro/steering/icons.md       你的项目/.kiro/steering/

# 用户级（所有项目生效）
cp kiro/steering/design-eye.md  ~/.kiro/steering/
cp kiro/steering/icons.md       ~/.kiro/steering/
```

2. 配置 better-icons MCP server：

将以下内容合并到 `~/.kiro/settings/mcp.json`（用户级）或 `你的项目/.kiro/settings/mcp.json`（项目级）：

```json
{
  "mcpServers": {
    "better-icons": {
      "command": "npx",
      "args": ["-y", "better-icons"],
      "disabled": false,
      "autoApprove": ["search_icons", "get_icon", "get_icons"]
    }
  }
}
```

## 使用方式

### 图标搜索（手动调用）

`icons.md` 设置了 `inclusion: manual`，需要在 Kiro 聊天中引用：

```
#icons.md 生成一个带图标的导航栏
```

也可以在项目的 steering 中将 `inclusion` 改为 `always` 使其自动生效。

### 设计审美（手动调用）

`design-eye.md` 设置了 `inclusion: manual`，需要在 Kiro 聊天中引用：

```
#design-eye.md 生成一个骑行用户个人中心页面
```

调用后会自动：
1. 确认品牌模式（哈啰品牌 / 无品牌）和视觉风格（Apple / M3）
2. 加载对应品牌规范和视觉系统
3. 执行风格合规检查 + 防灾难检查清单
4. 输出审美评分报告

### 风格切换

| 用户说 | 激活风格 |
|-------|---------|
| "苹果风"、"Apple风格"、"iOS风格"、"Liquid Glass"、或未指定 | Apple 风格（默认） |
| "M3"、"Material"、"Android风格" | M3 风格 |

### 品牌切换

| 用户说 | 激活模式 |
|-------|---------|
| "哈啰"、"Hello"、"品牌规范"、或未指定 | 哈啰品牌（默认） |
| "无品牌"、"不用哈啰"、"通用"、"个人项目" | 无品牌模式 |

## 与其他 Skill 协同

| 需求场景 | 调用 Skill | 说明 |
|---------|-----------|------|
| 视觉冲击力不足 | bolder | 在风格约束内增强视觉张力 |
| 配色单调 | colorize | 在品牌色板约束内丰富配色 |
| 设计过于复杂 | distill | 精简到核心 |
| 需要动效 | animate | M3 弹簧动效 / iOS Spring + Liquid Glass |
| 需要健壮性 | harden | 补全边界状态 |
| 文案不清晰 | clarify | 优化文案表达 |
| 需要趣味性 | delight | 增加情感化细节 |

## 文件说明

```
design-eye-skill/
├── README.md                        # 本文件
├── install.sh                       # 一键安装脚本
├── kiro/
│   ├── steering/
│   │   ├── design-eye.md            # 设计之眼主规则（M3 + Apple 双风格）
│   │   └── icons.md                 # better-icons 图标规则
│   └── settings/
│       └── mcp.json                 # better-icons MCP 配置
└── examples/                        # 示例输出
```

## 卸载

删除对应文件即可：

```bash
# 项目级
rm 你的项目/.kiro/steering/design-eye.md
rm 你的项目/.kiro/steering/icons.md

# 用户级
rm ~/.kiro/steering/design-eye.md
rm ~/.kiro/steering/icons.md
```

## License

MIT
