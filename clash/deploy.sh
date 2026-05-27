#!/usr/bin/env bash
set -euo pipefail

CLASH_DIR="/opt/clash"
CLASH_BIN="${CLASH_DIR}/clash"
CLASH_CONFIG="${CLASH_DIR}/config.yaml"
SERVICE_FILE="/etc/systemd/system/clash.service"

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

info()  { echo -e "${GREEN}[INFO]${NC} $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*"; exit 1; }

# 检查 root 权限
[[ $EUID -eq 0 ]] || error "请使用 root 权限运行此脚本"

# 检查必要文件
[[ -f "$CLASH_BIN" ]]    || error "未找到 clash 二进制: ${CLASH_BIN}"
[[ -f "$CLASH_CONFIG" ]] || error "未找到配置文件: ${CLASH_CONFIG}"

# 确保二进制有执行权限
chmod +x "$CLASH_BIN"

# 写入 systemd service
info "写入 systemd service 文件..."
cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=Clash daemon, A rule-based proxy in Go.
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
Restart=always
RestartSec=5
ExecStart=${CLASH_BIN} -d ${CLASH_DIR}

[Install]
WantedBy=multi-user.target
EOF

# 重载 systemd 并启动服务
info "重载 systemd daemon..."
systemctl daemon-reload

info "启用并启动 clash 服务..."
systemctl enable clash
systemctl restart clash

# 等待片刻后检查状态
sleep 2
if systemctl is-active --quiet clash; then
    info "clash 服务已成功启动"
    systemctl status clash --no-pager
else
    error "clash 服务启动失败，请检查日志: journalctl -u clash -f"
fi
