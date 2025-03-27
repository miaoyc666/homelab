1Panel
=

### 1. 安装前准备
- **系统要求**：
    - **操作系统**：支持 Debian/Ubuntu/CentOS/RedHat/openEuler 等主流 Linux 发行版
    - **架构**：x86_64、aarch64、armv7l
    - **内存**：建议 ≥1GB
    - **网络**：需可访问互联网

### 2. 安装命令
#### 通用安装
```bash
# RedHat/CentOS
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sh quick_start.sh

# Ubuntu
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sudo bash quick_start.sh

# Debian
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && bash quick_start.sh

# 先安装 Docker
bash <(curl -sSL https://linuxmirrors.cn/docker.sh)
# 再执行通用安装命令
```

#### 卸载
```bash
# 停止服务
sudo systemctl stop 1panel

# 卸载服务
sudo 1pctl uninstall

# 清理残留文件
sudo rm -rf /var/lib/1panel /etc/1panel /usr/local/bin/1pctl

# 清除旧日志
sudo journalctl --vacuum-time=3d
```
