Install
= 

### 一些必要的文件
```bash 
# 
wget https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/direct-list.txt 
wget https://raw.githubusercontent.com/IceCodeNew/4Share/master/geoip_china/china_ip_list.txt 
wget https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/proxy-list.txt 

# crontab
53 21 * * * curl -o /home/miaoyc/apps/mosdns/etc/direct-list.txt https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/direct-list.txt
53 21 * * * curl -o /home/miaoyc/apps/mosdns/etc/china_ip_list.txt https://raw.githubusercontent.com/IceCodeNew/4Share/master/geoip_china/china_ip_list.txt
53 21 * * * curl -o /home/miaoyc/apps/mosdns/etc/proxy-list.txt https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/proxy-list.txt

```
