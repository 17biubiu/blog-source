---
title: 试试
---

&nbsp;&nbsp;之前做项目的时候，总会处理各式各样的数据，来进行绘图。但是当后台返回一个空数组的时候，页面中并不会显示没有数据的图。代码如下：
```javascript
var arr = []
if(arr){console.log(124)}else{console.log('无数据')}
```
我明明判断了，怎么会不显示呢？下面我们就来看看，具体是怎么回事。