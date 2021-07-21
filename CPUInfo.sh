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
# 	CPU基础信息
# 
# Used:
# 	source CPUInfo.sh
# 
# Copyrights © 2017 - 2021 Topstalk. All Rights Reserved.
# 

cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo | sed 's/^[ \t]*//;s/[ \t]*$//' )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F'[ :]' '/cpu MHz/ {print $4;exit}' /proc/cpuinfo )
ccache=$( awk -F: '/cache size/ {cache=$2} END {print cache}' /proc/cpuinfo | sed 's/^[ \t]*//;s/[ \t]*$//' )
