#!/bin/bash
# Design Eye Skill 安装脚本

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo -e "${BLUE}🎨 Design Eye — 设计之眼 Kiro Skill 安装${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 选择安装范围
echo "请选择安装范围："
echo "  1) 用户级（所有项目生效）"
echo "  2) 项目级（仅当前项目生效，需指定项目路径）"
echo ""
read -p "请输入选项 [1/2]（默认 1）: " SCOPE
SCOPE=${SCOPE:-1}

if [ "$SCOPE" = "1" ]; then
  TARGET_STEERING="$HOME/.kiro/steering"
  TARGET_SETTINGS="$HOME/.kiro/settings"
  SCOPE_NAME="用户级"
elif [ "$SCOPE" = "2" ]; then
  read -p "请输入项目路径: " PROJECT_PATH
  if [ ! -d "$PROJECT_PATH" ]; then
    echo -e "${YELLOW}⚠ 项目路径不存在: $PROJECT_PATH${NC}"
    exit 1
  fi
  TARGET_STEERING="$PROJECT_PATH/.kiro/steering"
  TARGET_SETTINGS="$PROJECT_PATH/.kiro/settings"
  SCOPE_NAME="项目级"
else
  echo "无效选项"
  exit 1
fi

echo ""
echo -e "安装范围: ${BLUE}${SCOPE_NAME}${NC}"
echo ""

# 创建目录
mkdir -p "$TARGET_STEERING"
mkdir -p "$TARGET_SETTINGS"

# 复制 steering 文件
echo "📋 安装 steering 规则..."
cp "$SCRIPT_DIR/kiro/steering/design-eye.md" "$TARGET_STEERING/"
echo -e "  ${GREEN}✓${NC} design-eye.md"
cp "$SCRIPT_DIR/kiro/steering/icons.md" "$TARGET_STEERING/"
echo -e "  ${GREEN}✓${NC} icons.md"

# 处理 MCP 配置
echo ""
echo "⚙️  配置 better-icons MCP server..."

MCP_FILE="$TARGET_SETTINGS/mcp.json"

if [ -f "$MCP_FILE" ]; then
  # 检查是否已有 better-icons 配置
  if grep -q "better-icons" "$MCP_FILE" 2>/dev/null; then
    echo -e "  ${GREEN}✓${NC} better-icons 已存在于 mcp.json，跳过"
  else
    echo -e "  ${YELLOW}⚠${NC} mcp.json 已存在，请手动将以下内容添加到 mcpServers 中："
    echo ""
    echo '    "better-icons": {'
    echo '      "command": "npx",'
    echo '      "args": ["-y", "better-icons"],'
    echo '      "disabled": false,'
    echo '      "autoApprove": ["search_icons", "get_icon", "get_icons"]'
    echo '    }'
    echo ""
  fi
else
  cp "$SCRIPT_DIR/kiro/settings/mcp.json" "$MCP_FILE"
  echo -e "  ${GREEN}✓${NC} mcp.json"
fi

echo ""
echo -e "${GREEN}✅ 安装完成！${NC}"
echo ""
echo "使用方式："
echo "  • 图标搜索：自动生效，生成代码时会自动搜索真实 SVG 图标"
echo "  • 设计审美：在 Kiro 聊天中输入 #design-eye.md 后描述需求"
echo ""
