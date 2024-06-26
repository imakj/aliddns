# aliddns.py
aliddns by python

### 使用方式

首先打开脚本修改 `aliddnsipv6_ak ` 以及 `aliddnsipv6_sk` ，获取方式见阿里云文档 [https://help.aliyun.com/document_detail/34414.html](https://help.aliyun.com/document_detail/34414.html)

运行方式 `python3 ./aliddns.py RR DomainName Type`

#### 参数说明

1. RR : 要设置的主机名，你要设置的域名前缀
2. DomainName：域名 ，在阿里云购买的域名  例如 www.baidu.com ，www为RR，baidu.com 为DomainName
3. Type：类型，IPv4 为 A，IPv6 为 AAAA
4. value：值（可选），可以手动设置值，若不传改参数，则默认获取本机的地址

#### 运行示例


1. 设置本机外网ip     `python3 ./aliddns.py www baidu.com A`

2. 手动设置ip   `python3 ./aliddns.py www baidu.com A --value 1.1.1.1`


#### aliddns.sh
1. 可以更新一组python列表。将所有数组写入domains。就会顺序更新所有列表。支持更新当前账号授权key下的所有域名
```
declare -a domains=(
    "storage yzltech.com"
    "storage yzltech.com"
    "dev yzltech.com"
    "gitlab yzltech.com"
    "vpn yzltech.com"
    "lsh yzltech.com"
    "sk yzltech.com"
    "seoms cloudlism.com"
)
```

#### 定时任务
每10分钟执行一次脚本
```
*/10 * * * * /opt/yzl/aliddns/aliddns.sh > /dev/null 2>&1
```
#### 配合群晖使用

配合群晖计划任务使用时，由于编码问题，需要在计划任务执行的代码里填入如下代码

```

export PYTHONIOENCODING=utf8
export LANG=en_US.utf8
python3 /path/to/aliddns.py www baidu.com A

```

![UTOOLS1587388368832.png](img/WX20200420-211610@2x.png)
