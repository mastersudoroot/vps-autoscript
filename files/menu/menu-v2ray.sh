#!/bin/bash

function block-conn() {
	clear
	status=$(cat /iriszz/block-status)
	if [ "$status" == on ]; then
		echo -e "Do you want to allow all connections?"
		echo -e "  [1] Yes"
		echo -e "  [2] No"
		echo -e ""
		until [[ ${option} =~ ^[1-2]$ ]]; do
			read -rp "Select an option [1-2]: " option
		done
		if [ $option -eq 1 ]; then
			ufw allow 85 > /dev/null 2>&1
			ufw allow 465 > /dev/null 2>&1
			ufw allow 8080 > /dev/null 2>&1
			ufw allow 1194 > /dev/null 2>&1
			ufw allow 80 > /dev/null 2>&1
			ufw allow 443 > /dev/null 2>&1
			ufw allow 51820 > /dev/null 2>&1
			ufw allow 7300 > /dev/null 2>&1
			ufw allow 8000 > /dev/null 2>&1
			ufw allow 3128 > /dev/null 2>&1
			echo off > /iriszz/block-status
		elif [ $option -eq 2 ]; then
			clear
			echo -e "Operation cancelled."
			echo -e ""
			exit 0
		fi
		clear
		echo -e ""
		echo -e "All connections to the VPS is allowed."
		echo -e ""
	elif [ "$status" == off ]; then
		echo -e "Do you want to block all connections?"
		echo -e "  [1] Yes"
		echo -e "  [2] No"
		echo -e ""
		until [[ ${option} =~ ^[1-2]$ ]]; do
			read -rp "Select an option [1-2]: " option
		done
		if [ $option -eq 1 ]; then
			ufw delete allow 85 > /dev/null 2>&1
			ufw delete allow 465 > /dev/null 2>&1
			ufw delete allow 8080 > /dev/null 2>&1
			ufw delete allow 1194 > /dev/null 2>&1
			ufw delete allow 80 > /dev/null 2>&1
			ufw delete allow 443 > /dev/null 2>&1
			ufw delete allow 51820 > /dev/null 2>&1
			ufw delete allow 7300 > /dev/null 2>&1
			ufw delete allow 8000 > /dev/null 2>&1
			ufw delete allow 3128 > /dev/null 2>&1
			echo on > /iriszz/block-status
		elif [ $option -eq 2 ]; then
			clear
			echo -e "Operation cancelled."
			echo -e ""
			exit 0
		fi
		clear
		echo -e ""
		echo -e "All connections to the VPS is blocked, except SSH (22)."
		echo -e ""
	else
		echo -e "Error!"
	fi
}

status=$(cat /iriszz/block-status)

clear
echo -e "===========[ Script Menu ]==========="
echo -e ""
echo -e "VPN Services"
echo -e "------------"
echo -e "  [1] SSH & OVPN Menu"
echo -e "  [2] V2Ray (VMESS) Menu"
echo -e "  [3] WireGuard Menu"
echo -e ""
echo -e "Server Tools"
echo -e "------------"
echo -e "  [4] Server Speedtest"
echo -e "  [5] Server Benchmark"
echo -e ""
echo -e "Script Settings"
echo -e "---------------"
echo -e "  [6] Block all connections"
echo -e "      + Current status: $status"
echo -e "  [7] Script info"
echo -e ""
echo -e "  [8] Exit"
echo -e ""
until [[ ${option} =~ ^[1-8]$ ]]; do
	read -rp "Select an option [1-8]: " option
done

case "${option}" in
	1)
		ssh-vpn-script
		exit
		;;
	2)
		v2ray-script
		exit
		;;
	3)
		wireguard-script
		exit
		;;
	4)
		clear
		speedtest
		echo -e ""
		exit
		;;
	5)
		clear
		echo -e ""
		wget -qO- wget.racing/nench.sh | bash
		exit
		;;
	6)
		block-conn
		exit
		;;
	7)
		script-info
		exit
		;;
	8)
		clear
		exit 0
		;;
esac
