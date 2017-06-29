---
title: location
date: 2017-04-24 13:16:54
tags: location.search obj
---

  'location'是最有用的BOM对象之一，它提供了与当前窗口中加载的文档有关的信息，还有一些导航功能的信息。此外
'window.location' 和 'document.location'引用的是同一个对象。
下面列一下location对象的属性
+ location.hash
  返回URL中的hash(#号后跟零或多个字符)，如果URL中不包含散列，则返回空字符串

  例如： #content

+ location.host
  返回服务器名称和端口号（如果有）

  例如： "www.17biu.cn:80"

+ location.hostname
  返回不带端口号的服务器名称

  例如： "www.17biu.cn"

+ location.href
  返回当前价在页面的完整URL。而location对象的 'toString()' 方法也返回这个值。

  例如： "http://www.17biu.cn"

+ location.pathname
  返回URL中的目录和（或）文件名

  例如： "/_post/"

+ location.port 
  返回URL中指定的端口号。如果URL中不包含端口号，则这个属性返回空字符串

+ location.protocal
  返回页面使用的协议。通常是 'http:' 或 'https:'

+ location.search
  返回URL的查询字符串。这个字符串以问号开头

  例如："?q=javascript"


### 查询字符串参数
  下面这个函数可以解析查询字符串，然后返回包含所有参数的一个对象  

``` javascript
function getQueryStringArgs() {
  var qs = (location.search.length > 0 ? location.search.substring(1) : ''),
    args = {},
  vitems = qs.length ? qs.split("&") : [],
    item = null, name = null, value = null,
    i = 0, len = items.length;

  for (var i = 0; i < len; i++) {
    item = items[i].split("=");
    name = decodeURIComponent(item[0])
    value = decodeURIComponent(item[1])

    if (name.length) {
      args[name] = value;
    }
  }

  return args
}

```