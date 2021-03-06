#!/bin/bash

clear
echo -e "====================[Script Info]===================="
echo -e "\nServices:
---------
1) SSH\t\t\t22
2) Dropbear\t\t85
3) Stunnel4\t\t465
4) Squid3\t\t8080
5) OpenVPN\t\t1194
6) Xray\t\t\t443
7) V2ray\t\t80
7) WireGuard\t\t51820
8) Open HTTP Puncher\t8000(OpenVPN), 3128(Dropbear)
9) BadVPN UDPGw\t\t7300

Other:
------
1) Timezone: Asia/Kuala_Lumpur
2) IPv6 Disabled
3) BBR+FQ
4) UFW
5) Screenfetch
6) Fail2Ban
7) DDoS Deflate

How to change:
--------------
1) SSH login banner - /etc/issue.net
2) Dropbear login banner - /etc/dropbear_issue.net
3) Timezone - timedatectl set-timezone <your_time_zone>
4) Auto-reboot - \"0 0 * * * root reboot\" at /etc/crontab

==============================================
Script written by Iriszz.
Report bugs: https://t.me/iriszz

Thank you for using my script :)\n"
