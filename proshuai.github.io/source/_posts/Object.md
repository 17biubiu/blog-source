---
title: Object
date: 2017-04-26 09:47:11
tags:
---

构造函数，要创建新实例时，必须使用new操作符。此方式调用构造函数实际上将经历以下4个步骤：
1、创建一个对象
2、将构造函数的作用域赋给新对象（因此this就指向了这个新对象）
3、执行构造函数中的代码（为这个新对象添加属性）
4、返回新对象