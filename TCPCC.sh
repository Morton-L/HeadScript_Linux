#!/bin/bash

#
#  _______              _        _ _    
# |__   __|            | |      | | |   
#    | | ___  _ __  ___| |_ __ _| | | __
#    | |/ _ \| '_ \/ __| __/ _` | | |/ /
#    | | (_) | |_) \__ \ || (_| | |   < 
#    |_|\___/| .__/|___/\__\__,_|_|_|\_\
#            | |                        
#            |_|                        
#
# Description: 
# 	因为很多脚本经常使用相同的功能或者变量,为了方便调用和降
# 低脚本体积,根据web相关语言的编写经验,特制作此head.sh脚本.
# 
# Function:
# 	检测TCP拥塞控制
# 
# Used:
# 	source TCPCC.sh
# 
# Copyrights © 2017 - 2021 Topstalk. All Rights Reserved.
# 

function TCPCC(){
	tcpcc=$( sysctl net.ipv4.tcp_congestion_control | awk -F ' ' '{print $3}' )
}