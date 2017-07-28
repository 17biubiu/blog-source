---
title: 时间延迟函数详解
date: 2017-07-18 22:37:05
tags: setTimeout setInterval
---

js是单线程语言，但它允许通过设置超时值和间歇时间值来调度代码在特定的时刻执行。setTimeout是在指定delay时间后，将指定方法作为异步任务添加到异步任务队列中，而setInterval则是可以循环地每隔一个delay就向异步任务队列中添加一个任务

# 语法

#### setTimeout
```javascript
// 返回唯一的ID
let timeoutID = window.setTimeout(func[, delay, param1, param2, ...]);
let timeoutID = window.setTimeout(code[, delay]);
```
#### setInterval
```javascript
// 返回唯一的ID
let intervalID = window.setInterval(func, delay[, param1, param2, ...]);
let intervalID = window.setInterval(code, delay);
```

#### clearTimeout和clearInterval
```javascript
window.clearTimeout(timeoutID)
window.clearInterval(intervalID)
```

+ timeoutID/intervalID 可以用来作为clearTimeout/clearInterval方法的参数
+ func是在delay毫秒之后执行的函数
+ code 在第二种语法,是指你想要在delay毫秒之后执行的代码字符串 (使用该语法是不推荐的, 不推荐的原因和eval()一样)
+ delay 是延迟的毫秒数 (一秒等于1000毫秒)，函数的调用会在该延迟之后发生。如果省略该参数，delay取默认值0。实际的延迟时间可能会比 delay 值长，原因看下面的介绍。此外，根据w3c文档得知，当delay小于0的时候，delay按0来计算

setTimeout 和setInterval的使用方法类似，重点以setTimeout为例，有差异的地方再单独分析。

# 例子

1、比较一下下面两个函数的区别
```javascript
setTimeout(function () {
  func1（）
}, 0)

setTimeout(function () {
  func1（）
})
```

> 0秒延迟，此回调将会放到一个能立即执行的时段进行触发。javascript代码大体上是自顶向下的，但中间穿插着有关DOM渲染，事件回应等异步代码，他们将组成一个队列，零秒延迟将会实现插队操作。不写第二个参数，浏览器自动配置时间，在IE，FireFox中，第一次配可能给个很大的数字，100ms上下，往后会缩小到最小时间间隔，Safari，chrome，opera则多为10ms上下。
> ---出自《javascript框架设计》

如果对0s的例子不明白，不要紧，我们继续看下面这个：
```javascript
var arr = [1,2,3];
for(var i in arr){
  setTimeout(function(){console.log(arr[i])},0);
  console.log(arr[i]);
}
```
控制台会打印什么？

```javascript
 1
 2
 3
 3  //3次
```
虽然setTimeout函数在每次循环的开始就调用了，但是却被放到循环结束才执行，循环结束，i=3，接着连续打印了3次3。
这里涉及到了js单线程执行的问题：js在浏览器中是单线程执行的，必须在完成当前任务后才执行队列中的下一个任务。此外对于js还维护着一个setTimeout队列，未执行的setTimeout任务就按先后顺序排在队列中，等到主线程的普通任务队列执行完后，主线程就按顺序执行积累在setTimeout中的任务。所以上面的问题会先打印1、2、3.最后才打印3个3。

此时就有个疑问了，设置delay为0，而实际是大于0才执行的，何必呢？
实际上这里我们主要用来改变任务的执行顺序，因为浏览器会在执行完当前任务队列中的任务，再执行setTimeout队列中积累的任务。通过设置任务在延迟到0s后执行，就能改变任务执行的先后顺序，延迟该任务发生，使之异步执行。

2、delay后可以传递第三个及多个参数。
```javascript
for (var i = 1; i < 4; i++) {
  var t = setTimeout(function(i) {
    console.log(i); // 2\. 1  4.2
    console.log(t); // 3\. 3  5.3
    clearTimeout(t);
  }, 10, i);
}
console.log(i);
```

控制台会打印什么？

```javascript
 4
 1
 3
 2
 3
```
此处在每次循环中，都将i作为回调函数的参数i传入，第一次传入1，第二次传入2，第三次传入3。第四次不满足循环条件，跳出循环，然后执行console.log(i)。主线程执行完当前任务队里的任务，然后开始执行seTimeout的队列。此时t为setTimeout最后的返回ID值3，则一次打印1，3   2，3。因为clearTimeout清楚了id为3的延时任务，所以只执行了两次。故一次打印41323

**仅IE不支持第三个及以上参数**

3、关于this指向的问题

```
myArray = ["zero", "one", "two"];
myArray.myMethod = function (sProperty) {
    alert(arguments.length > 0 ? this[sProperty] : this);
};

myArray.myMethod(); // prints "zero,one,two"
myArray.myMethod(1); // prints "one"
setTimeout(myArray.myMethod, 1000); // prints "[object Window]" after 1 second
setTimeout(myArray.myMethod, 1500, "1"); // prints "undefined" after 1,5 seconds
```

由setTimeout()调用的代码运行在与所在函数完全分离的执行环境上. 这会导致,这些代码中包含的 this 关键字会指向 window (或全局)对象,这和所期望的this的值是不一样的

如何解决this指向不确定的问题，我们可以用Function.prototype.bind()方法。
```
myArray = ["zero", "one", "two"];
myBoundMethod = (function (sProperty) {
    console.log(arguments.length > 0 ? this[sProperty] : this);
}).bind(myArray);

myBoundMethod(); // prints "zero,one,two" because 'this' is bound to myArray in the function
myBoundMethod(1); // prints "one"
setTimeout(myBoundMethod, 1000); // still prints "zero,one,two" after 1 second because of the binding
setTimeout(myBoundMethod, 1500, "1"); // prints "one" after 1.5 seconds
```

# 应用
1、替换setInterval来实现重复定时
2、防止事件疯狂触发
3、IE下重新播放单次gif动画
4、blur事件延时生效

# 参考资料
[https://html.spec.whatwg.org/multipage/timers-and-user-prompts.html#timers]
[http://imweb.io/topic/56ac67fbe39ca21162ae6c78]
[https://developer.mozilla.org/zh-CN/docs/Web/API/Window/setTimeout]
[http://www.cnblogs.com/suspiderweb/p/4943473.html]
[https://johnresig.com/blog/how-javascript-timers-work/]
[http://www.cnblogs.com/snandy/archive/2011/05/18/2050315.html]
[http://www.ruanyifeng.com/blog/2014/10/event-loop.html]
[http://www.cnblogs.com/silin6/p/4333999.html]
