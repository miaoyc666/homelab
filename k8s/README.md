### 快照
![20220904.png](./snapshot/20220904.png)
![sc_20220905152157.png](./snapshot/sc_20220905152157.png)


#### install intel-gpu-plugin
```bash 
# https://github.com/intel/intel-device-plugins-for-kubernetes/tree/release-0.25/deployments/gpu_plugin
`kubectl apply -k https://github.com/intel/intel-device-plugins-for-kubernetes/deployments/gpu_plugin?ref=v0.25.1`
```

#### emby无法挂载nfs
```bash 
# 需要在宿主机安装nfs工具, 例如
apt-get install nfs-common -y
```

#### emby暴露端口
`kubectl port-forward $(kubectl get pods  --output=name | grep emby) 8096:8096 --address=192.168.88.110`

#### 安装helm
拷贝二进制文件即可，下载目录：https://github.com/helm/helm/releases/

#### helm配置源启动traefik
1. helm repo add traefik https://helm.traefik.io/traefik
2. helm repo update 
3. kubectl apply -f pvc.yaml 
4. helm install traefik -f traefik.yaml traefik/traefik