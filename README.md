# HeadScript_Linux

## About - 关于

写这套脚本的原因是因为我经常有服务器需要部署,一条一条机械化的输入命令机械化的流程很枯燥且有出错的可能性,

于是就想着写一套脚本来实现,后来觉得挺好用,但是也发现了一些问题,就是每次写脚本如果想要做到风格或者特性统一

,那就需要重复写很多代码,同样是为了统一,需要从其他脚本中拷贝代码,再去读,回忆我当时是怎么想的怎么写的,又变成

了一件头疼的事,所以便将它模块化了.

该脚本是模块化脚本的一部分,主要为相关脚本提供通用参数调用支持

## Used - 使用

为了避免有些系统可能并没有wget命令,所以加载脚本时使用了curl命令来做替代

```bash
curl -Oks https://raw.githubusercontent.com/Morton-L/HeadScript_Linux/main/loader.sh
```

这样你就把它下载下来了,然后我们调用它,注意根据需求需要在后面添加`参数`,否则它不会做任何事

```bash
source loader.sh [参数]
```

将两条命令合并在一起,写入你的脚本,这样你就可以调用里面的功能了,下面是一个示例:

```bash
curl -Oks https://raw.githubusercontent.com/Morton-L/HeadScript_Linux/main/loader.sh
source loader.sh font
```

这时在你的脚本中就调用了字体样式的支持

你在之后使用red,green,yellow等命令时,等同于使用了以下命令:

```bash
red(){ echo -e "\033[31m\033[01m你输入的内容\033[0m"; }
```

## 参数

目前支持的参数如下:

font

提供五种颜色的字体风格,分别为red|green|yellow|blue和bold

CPUInfo

提供四种获取处理器信息的参数,分别为cname|cores|freq|ccache,对应:型号/核心数量/频率(不带

单位)/缓存容量

getLinuxKernelVersion

调用后执行getLinuxKernelVersion,可检测当前Linux内核版本,可使用LinuxKernelVersion变量调用结果

TCPCC

调用后执行TCPCC,可检测当前TCP拥塞控制方式,可使用tcpcc变量调用结果

Error

提供了一种模板化的报错,将你要报错的信息写入ErrorInfo变量(区分大小写),随后执行Error跳转过去吧

