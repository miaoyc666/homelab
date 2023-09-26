

#### 一键启动http代理
```bash 
docker run --rm -d --name squid-container -e TZ=UTC -p 3128:3128 ubuntu/squid:5.2-22.04_beta
```

#### acme.sh生成证书
```bas
# 常用的Let's Encrypt 证书生成工具有 certbot、acme.sh、acme-tiny，这里介绍的是acme.sh

dnf install socat -y
curl https://get.acme.sh | sh -s email=my@example.com
source ~/.bashrc
# 准备阿里云的key和secret
export Ali_Key="YourAccessKeyId"
export Ali_Secret="YourAccessKeySecret"
# 生成证书
acme.sh --issue --dns dns_ali -d example.com -d *.example.com
```