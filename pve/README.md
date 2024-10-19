# pve
包含使用pve的经验与坑


#### pve镜像源配置
- 安装[CT Templates](https://mirrors.tuna.tsinghua.edu.cn/help/proxmox/)加速

#### 关闭假死虚拟机
```bash
1.ssh pve主机
2.cd /var/lock/qemu-server/
3.rm lock-假死虚拟机id.conf
4.qm stop 假死虚拟机id
```

#### pve安装windows客户机最佳实践
- [Windows_10_guest_best_practices](https://pve.proxmox.com/wiki/Windows_10_guest_best_practices)

#### 导出虚拟机模板
```bash
# 先获取虚拟机列表，找到想要导出的虚拟机的vmid
qm list
# 导出模板
vzdump <vmid>  --dumpdir <directory> --compress gzip
# 在新的PVE服务器上，使用以下命令导入模板
qmrestore <path-to-vma.gz-file> <new-vmid>
```

#### 查看&导入本地镜像
```bash
ls /var/lib/vz/template/iso
cp xx.iso /var/lib/vz/template/iso
```

#### 集群拆分
```bash
# 1
pvecm nodes
pvecm delnode <node-name>

# 2
systemctl stop pvedaemon pve-cluster
rm /etc/pve/corosync.conf
rm -rf /var/lib/corosync/*
rm -rf /etc/pve/ha/
systemctl restart pvedaemon pve-cluster
systemctl stop corosync
rm /etc/corosync/corosync.conf
systemctl restart corosync
```
