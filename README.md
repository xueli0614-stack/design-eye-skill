# 🎨 Design Eye — 设计之眼 Kiro Skill

哈啰C端移动端审美增强系统。基于 Material Design 3 视觉系统 + 哈啰品牌规范，自动应用 M3 色彩角色、字体角色、形状 Token、弹簧动效、信息层级和无障碍标准。

## 功能

- 哈啰共享 C 端品牌规范（色彩/字体/圆角/间距/阴影/动效）
- Material Design 3 合规检查（色彩角色/字体角色/形状/动效）
- 防灾难检查清单（配色/排版/布局/动效/组件）
- 审美评分报告（每次输出自动附带）
- better-icons 图标集成（20 万+ 真实 SVG 图标，自动搜索内联）

## 前置要求

- [Kiro IDE](https://kiro.dev)
- Node.js（用于 better-icons MCP server）

## 安装

### 方式一：一键安装（推荐）

```bash
git clone https://github.com/你的用户名/design-eye-skill.git
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

### 图标搜索（自动生效）

`icons.md` 设置了 `inclusion: always`，安装后每次对话自动生效。生成 UI 代码时会自动从 better-icons 搜索真实 SVG 图标。

### 设计审美（手动调用）

`design-eye.md` 设置了 `inclusion: manual`，需要在 Kiro 聊天中引用：

```
#design-eye.md 生成一个骑行用户个人中心页面
```

调用后会自动：
1. 加载哈啰品牌规范
2. 执行 M3 视觉系统合规检查
3. 执行防灾难检查清单
4. 输出审美评分报告

## 文件说明

```
design-eye-skill/
├── README.md                        # 本文件
├── install.sh                       # 一键安装脚本
├── kiro/
│   ├── steering/
│   │   ├── design-eye.md            # 设计之眼主规则
│   │   └── icons.md                 # better-icons 图标规则
│   └── settings/
│       └── mcp.json                 # better-icons MCP 配置
└── examples/                        # 示例输出
    └── preview.png                  # 效果预览
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
