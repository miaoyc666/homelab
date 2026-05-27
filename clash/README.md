# Clash 部署指南

基于 Clash Premium 的透明代理网关，以 systemd 服务方式运行在 Linux 主机上。

## 目录结构

```
/opt/clash/
├── clash              # 二进制文件
├── config.yaml        # 主配置（Fake-IP + TUN 模式）
├── Country.mmdb       # GeoIP 数据库
├── dashboard/         # yacd Web 管理面板
└── ruleset/           # 规则集（自动更新）
```

## 手动安装 Clash

如果目标机器上还没有 clash 二进制和相关文件，按以下步骤手动安装：

```bash
# 创建目录
mkdir -p /opt/clash

# 下载 clash premium 二进制（根据架构选择，此处以 amd64 为例）
wget -O /opt/clash/clash.gz https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-latest.gz
gzip -d /opt/clash/clash.gz
chmod +x /opt/clash/clash

# 下载 GeoIP 数据库
wget -O /opt/clash/Country.mmdb https://github.com/Loyalsoldier/geoip/releases/latest/download/Country.mmdb

# 下载 yacd 管理面板
wget -O /opt/clash/yacd.tar.xz https://github.com/haishanh/yacd/releases/latest/download/yacd.tar.xz
tar -xJf /opt/clash/yacd.tar.xz -C /opt/clash
mv /opt/clash/public /opt/clash/dashboard
rm -f /opt/clash/yacd.tar.xz

# 拷贝配置文件
cp config.yaml /opt/clash/config.yaml
```

如果是 ARM64 架构，将下载链接中的 `amd64` 替换为 `arm64`。

> **注意**：Clash Premium 原始 GitHub 仓库（Dreamacro/clash）已删库不存在，上述下载链接仅作参考。实际使用时需自行在网上搜索 clash premium 的备份/镜像站点获取二进制文件。

## 快速部署

1. 将本目录内容拷贝到目标机器的 `/opt/clash`：

```bash
scp -r ./clash root@<host>:/opt/clash
```

2. 在目标机器上执行部署脚本：

```bash
sudo bash /opt/clash/deploy.sh
```

脚本会自动完成：检查文件 → 写入 systemd service → 启用开机自启 → 启动服务 → 验证运行状态。

## 服务管理

```bash
# 查看状态
systemctl status clash

# 停止服务
systemctl stop clash

# 重启服务（修改配置后）
systemctl restart clash

# 查看实时日志
journalctl -u clash -f
```

## 配置说明

| 配置项 | 值 | 说明 |
|--------|-----|------|
| mixed-port | 7890 | HTTP/SOCKS5 混合代理端口 |
| redir-port | 7892 | 透明代理端口 |
| DNS | 0.0.0.0:53 | DNS 劫持（Fake-IP 模式） |
| external-controller | :9093 | API 控制端口 |
| external-ui | dashboard | yacd 面板路径 |
| TUN | system 栈 | 透明代理 |

## 管理面板

部署完成后访问 `http://<host>:9093/ui` 即可打开 yacd 管理界面。

## 客户端使用

局域网内其他设备将网关和 DNS 指向该主机 IP 即可实现透明代理，或手动设置 HTTP/SOCKS5 代理为 `<host>:7890`。
