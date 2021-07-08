#!/bin/bash
rm /etc/v2ray/domain
rm /var/lib/premium-script/ipvps.conf
echo "Checking Vps"
curl -o.html https://icanhazip.com
sleep 0.5
clear                                                     
read -p "Hostname / Domain: " host
echo "$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain
sleep 1
clear
echo -e DOMAIN BERHASIL DITAMBAHKAN                                                                                            
echo "Harap Update certificate v2ray dengan"
echo "Mengetikkan Perintah certv2ray"
