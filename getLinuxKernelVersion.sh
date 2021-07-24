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
# 	检内核版本
# 
# Used:
# 	source getLinuxKernelVersion.sh
# 
# Copyrights © 2017 - 2021 Topstalk. All Rights Reserved.
# 

function getLinuxKernelVersion(){
	# 以"-"为分割符号打印第一个值
	LinuxKernelVersion=$(uname -r | awk -F "-" '{print $1}')
}