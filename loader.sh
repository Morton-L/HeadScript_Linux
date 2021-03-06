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
# 	通过参数在线加载各种功能
# 
# Used:
# 	source loader.sh
# 
# 参数:
#
# 	font - [字体颜色]
# 		调用方式:
# 		[red|green|yellow|blue|bold] "要打印的文字${变量}"$变量
# 
# 	CPUInfo - [获取CPU基础信息]
# 		调用方式:
# 		$[cname|cores|freq|ccache]
# 		分别对应:型号/核心数量/频率(不带单位)/缓存容量
# 
# 	getLinuxKernelVersion  -  [检测内核版本]
# 
# Copyrights © 2017 - 2021 Topstalk. All Rights Reserved.
# 

# 配置网址
url1=https://raw.githubusercontent.com/Morton-L/HeadScript_Linux/main
url2=https://tools.topstalk.com/shellscript


# 提取变量
font=$(echo $* | grep -o 'font')
CPUInfo=$(echo $* | grep -o 'CPUInfo')
Error=$(echo $* | grep -o 'error')
TCPCC=$(echo $* | grep -o 'TCPCC')
getLinuxKernelVersion=$(echo $* | grep -o 'getLinuxKernelVersion')

if [ -n "$font" ]; then
	if [ -d ${BASH_SOURCE[0]}/font.sh ]; then
		echo "从本地加载脚本"
	else
		curl -Oks $url1/font.sh
		if [ $? -ne 0 ]; then
            curl -Oks $url2/font.sh
            [ $? -ne 0 ] && error
		fi
	fi
	source font.sh
fi

if [ -n "$CPUInfo" ]; then
	if [ -d ${BASH_SOURCE[0]}/CPUInfo.sh ]; then
		echo "从本地加载脚本"
	else
		curl -Oks $url1/CPUInfo.sh
		if [ $? -ne 0 ]; then
            curl -Oks $url2/CPUInfo.sh
            [ $? -ne 0 ] && error
		fi
	fi
	source CPUInfo.sh
fi

if [ -n "$error" ]; then
	if [ -d ${BASH_SOURCE[0]}/error.sh ]; then
		echo "从本地加载脚本"
	else
		curl -Oks $url1/error.sh
		if [ $? -ne 0 ]; then
            curl -Oks $url2/error.sh
            [ $? -ne 0 ] && error
		fi
	fi
	source error.sh
fi

if [ -n "$TCPCC" ]; then
	if [ -d ${BASH_SOURCE[0]}/TCPCC.sh ]; then
		echo "从本地加载脚本"
	else
		curl -Oks $url1/TCPCC.sh
		if [ $? -ne 0 ]; then
            curl -Oks $url2/TCPCC.sh
            [ $? -ne 0 ] && error
		fi
	fi
	source TCPCC.sh
fi

if [ -n "$getLinuxKernelVersion" ]; then
	if [ -d ${BASH_SOURCE[0]}/getLinuxKernelVersion.sh ]; then
		echo "从本地加载脚本"
	else
		curl -Oks $url1/getLinuxKernelVersion.sh
		if [ $? -ne 0 ]; then
            curl -Oks $url2/getLinuxKernelVersion.sh
            [ $? -ne 0 ] && error
		fi
	fi
	source getLinuxKernelVersion.sh
fi


function error (){
	echo "请检查网络!"
	exit 1
}