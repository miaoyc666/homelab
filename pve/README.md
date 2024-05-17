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
[Windows_10_guest_best_practices](https://pve.proxmox.com/wiki/Windows_10_guest_best_practices)

#### 导出虚拟机模板
```bash
# 先获取虚拟机列表，找到想要导出的虚拟机的vmid
qm list
# 导出模板
vzdump <vmid>  --dumpdir <directory> --compress gzip
# 在新的PVE服务器上，使用以下命令导入模板
qmrestore <path-to-vma.gz-file> <new-vmid>
```
