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

