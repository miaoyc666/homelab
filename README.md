# homelab
homelab配置文件集合

### What is this?
- 本项目包含智能家居内的各种服务和配置
- 配置文件版本与程序版本是一一对应关系，不保证其他版本程序也能正确运行
- 版权所有：miaoyc

### 版本对应说明
- mosdns: v2.2.2
- v2ray: v4.43
- privoxy: 3.0.32


### 资源列表
- mosdns运行所需geoip.dat和geosites.dat为v2ray的规则文件，[参考文档](https://github.com/Loyalsoldier/v2ray-rules-dat)
- [mosdns下载](https://github.com/IrineSistiana/mosdns/releases)

### systemd相关
- /etc/systemd/system/mosdns.service
- /etc/systemd/system/clash.service  

### 安装资料索引
#### 1. mosdns

#### 2.v2ray
- 物料：[v2ray github](https://github.com/v2fly/v2ray-core)
- 安装方式：`download and copy install`
- 配置：[v2ray.service](./v2ray/v2ray.service), [config.json](./v2ray/config.json)

#### 3.privoxy
- 物料：[privoxy](https://www.privoxy.org/sf-download-mirror/)
- 安装方式：`yum or apt install privoxy`
- 配置：[privoxy.service](./privoxy/privoxy.service), [config](./privoxy/config)
- 添加密码：死了这条心吧，privoxy不能添加密码

### emby
[emby]()


