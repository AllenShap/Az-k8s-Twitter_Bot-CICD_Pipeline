#!bin/bash
sed -i "s#\$client_1_prkey#$(printf %s "$(cat /etc/wireguard/client-privatekey)")#g" /etc/wireguard/client01.conf
sed -i "s#\$client_1_pubkey#$(printf %s "$(cat /etc/wireguard/server-publickey)")#g" /etc/wireguard/client01.conf
sed -i "s#\$client_1_addr#$(printf %s "$(echo '10.0.0.5/24')")#g" /etc/wireguard/client01.conf
sed -i "s#\$client_1_dns#$(printf %s "$(echo '168.63.129.16')")#g" /etc/wireguard/client01.conf
sed -i "s#\$client_1_allowed_addr#$(printf %s "$(echo '0.0.0.0/0')")#g" /etc/wireguard/client01.conf
sed -i "s#\$server_1_prkey#$(printf %s "$(cat /etc/wireguard/server-privatekey)")#g" /etc/wireguard/wg0.conf
sed -i "s#\$server_1_pubkey#$(printf %s "$(cat /etc/wireguard/client-publickey)")#g" /etc/wireguard/wg0.conf
sed -i "s#\$server_1_addr#$(printf %s "$(echo '10.0.0.6/24')")#g" /etc/wireguard/wg0.conf
sed -i "s#\$server_1_opt_conf_saveconfig_true#$(printf %s "$(echo 'true')")#g" /etc/wireguard/wg0.conf
sed -i "s#\$server_1_postup#$(printf %s "$(echo 'iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE')")#g" /etc/wireguard/wg0.conf
sed -i "s#\$server_1_postdown#$(printf %s "$(echo 'iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE')")#g" /etc/wireguard/wg0.conf
sed -i "s#\$server_1_listenport#$(printf %s "$(echo '55525')")#g" /etc/wireguard/wg0.conf
sed -i "s#\$server_1_allowed_addr#$(printf %s "$(echo '10.0.0.5/32')")#g" /etc/wireguard/wg0.conf
sed -i "s#\$server_1_endpoint#$(printf %s "$(echo '77.30.169.217:55525')")#g" /etc/wireguard/wg0.conf
sed -i "s#\$client_1_endpoint#$(printf %s:%d "$(curl ifconfig.me)" 55525)#g" /etc/wireguard/client01.conf