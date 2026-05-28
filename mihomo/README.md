# Mihomo 独立部署

基于 Docker Compose 独立部署的 Mihomo（Clash Meta）代理服务。

## 使用方式

```bash
# 启动
docker compose up -d

# 查看日志
docker compose logs -f

# 停止
docker compose down
```

## 端口说明

| 端口 | 用途 |
|------|------|
| 7890 | HTTP/SOCKS5 混合代理端口 |
| 9090 | API 控制 + Web UI 面板 |

## 管理面板

### 方式一：本地 UI（推荐）

下载 Web UI 静态文件到 `ui/` 目录：

```bash
# metacubexd（推荐）
wget -O ui.zip https://github.com/MetaCubeX/metacubexd/releases/latest/download/compressed-dist.zip
unzip ui.zip -d ui

# 或者 Yacd-meta
wget -O ui.zip https://github.com/MetaCubeX/Yacd-meta/releases/latest/download/Yacd-meta.zip
unzip ui.zip -d ui
```

重启容器后访问 `http://<host>:9090/ui`，密码为 config.yaml 中的 `secret` 字段值。

### 方式二：在线 UI

无需下载任何文件，直接访问 `https://metacubex.github.io/metacubexd`，填入 API 地址 `http://<host>:9090` 和密码即可连接管理。

## 客户端使用

将代理设置为 `http://<host>:7890` 或 `socks5://<host>:7890` 即可。

## 配置修改

编辑 `config.yaml` 后重启容器生效：

```bash
docker compose restart
```
