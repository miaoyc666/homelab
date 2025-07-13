MAD
=

#### MAD是什么？
Mihomo(M) + AdGuard(A) + Mosdns(D) 
MAD 是一套基于容器技术的 DNS 解决方案，它由 Mihomo、Mosdns 和 AdGuard 三个组件组成，最实用的场景是路由器翻墙。


#### 关键配置步骤
物理机可以直接部署
```bash
# 安装docker
# docker compose启动
```

基于pve搭建的容器环境
```bash 
# lxc配置修改
# 配置路由器dns
```

在用的版本(其他版本也可以)：
- adguard/adguardhome:v0.107.57
- metacubex/mihomo:v1.19.2
- irinesistiana/mosdns:v5.3.3

#### 相关链接
- [原始视频学习资料](https://www.youtube.com/watch?v=ThD06zge-yI&list=PLI6JL1PjkZpy-jtttcplL8PO2LLkNeTjn&index=15&ab_channel=%E9%9A%94%E5%A3%81%E8%80%81%E8%B5%B5)
