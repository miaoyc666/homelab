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

启动后访问 `http://<host>:9090/ui`，密码为 config.yaml 中的 `secret` 字段值。

## 客户端使用

将代理设置为 `http://<host>:7890` 或 `socks5://<host>:7890` 即可。

## 配置修改

编辑 `config.yaml` 后重启容器生效：

```bash
docker compose restart
```
