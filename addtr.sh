#!/bin/bash
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo "Checking Vps"
curl -o.html https://icanhazip.com
sleep 0.5
clear
                read -rp "User: " -e user
                CLIENT_EXISTS=$(grep -w $user /etc/trojan/config.json | wc -l)

                if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
sleep 0.5
                        echo ""
                        echo "Klien yang  akan anda buat sudah ada, harap pakai username lain."
                        echo "Script By Haweng"
                        exit 1
                fi
        done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/"password1"$/a\,"'""$user""'"' /etc/trojan/config.json
echo -e "$user               $exp" >> /etc/trojan/akun.conf          
systemctl restart trojan
trojanlink="trojan://${user}@${domain}:2087"
clear
echo -e ""
echo -e "==========-V2RAY/Trojan-=========="
echo -e "Remarks        : ${user}"
echo -e "Host/IP        : ${domain}"
echo -e "port           : 2087"
echo -e "Key            : ${user}"
echo -e "link           : ${trojanlink}"
echo -e "================================="
echo -e "Expired On     : $exp"
echo -e ""
echo -e "By Haweng"
