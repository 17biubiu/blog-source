---
title: apply、call及bind的区别
date: 2017-07-11 11:46:07
tags: apply call bind
---

先说call 和 apply吧：
ECMAScript3给Function的原型定义了两个方法，他们是Function.prototype.call 和 Function.prototype.apply. 在实际开发中，特别是在一些函数式风格的代码编写中，call和apply方法尤为有用。

1、call和apply区别
其实他们的作用是一样的，只是传递的参数不一样而已。
apply： 接受2个参数，第一个参数指定了函数体内this对象的指向，第二个参数为数组或者一个类数组。apply传入的是一个参数数组，也就是将多个参数组合成为一个数组传入，而call则作为call的参数传入（从第二个参数开始）。
例如：
```jacascript
let obj1 = {
    name: "copyes",
    getName: function(){
        return this.name;
    }
}
let obj2 = {
    name: 'Fanchao'
}

console.log(obj1.getName());  // "copyes"
console.log(obj1.getName.call(obj2));  // "Fanchao"
console.log(obj1.getName.apply(obj2));  // "Fanchao"
function showArgs(a, b, c){
    console.log(a,b,c);
}

showArgs.call(this, 3,4,5);
showArgs.apply(this, [5,6,7]);

```
2、常见的call 和 apply 用法
数组之间追加
```jacascript
let arr1 = [12, 'foo', {name: 'fanchao'}, -1024];
let arr2 = ['copyes', '22', 1024];

Array.prototype.push.apply(arr1, arr2);
console.log(arr1);
// [ 12, 'foo', { name: 'fanchao' }, -1024, 'copyes', '22', 1024 ]
```
获取数组中的最大值和最小值
```jacascript
let numbers = [5,665,32,773,77,3,996];
let maxNum = Math.max.apply(Math, numbers);
let maxNum2 = Math.min.call(Math, 5,665,32,773,77,3,996);

console.log(maxNum);
console.log(maxNum2);
```
验证是否是数组（前提是toString()方法没有被重写过）
```jacascript
function isArray(obj){
    return Object.prototype.toString.call(obj)  === '[object Array]';
}

console.log(isArray(1));
console.log(isArray([1,2]));
```
类（伪）数组使用数组方法
```jacascript
var domNodes = Array.prototype.slice.call(document.getElementsByTagName("*"));
```
3、通过一个面试题去深入理解下apply 和 call
定义一个 log 方法，让它可以代理 console.log 方法：
```jacascript
// 常规做法
function log(msg){
    console.log(msg);
}
log(12);
log(1,2)
```
上面能够基本解决打印输出问题，但是下面多参数的时候就gg了。换个更好的方式吧。
````jacascript
function log(){
    console.log.apply(console, arguments);
}
log(12);
log(1,2)
```
接下来是要在每一条打印信息前面都要加上一个特定字符串'fanchao`s'又怎么说呢？
```jacascript
function log(){

    let args = Array.prototype.slice.call(arguments);
    
    args.unshift('(fanchao`s)');

    console.log.apply(console, args);
}
log(12);
log(1,2)
```

4、说完了call和apply，接下来说说bind
bind() 方法与 apply 和 call 很相似，也是可以改变函数体内 this 的指向。
MDN的解释是：bind()方法会创建一个新函数，称为绑定函数，当调用这个绑定函数时，绑定函数会以创建它时传入 bind()方法的第一个参数作为 this，传入 bind() 方法的第二个以及以后的参数加上绑定函数运行时本身的参数按照顺序作为原函数的参数来调用原函数。
看个栗子：
```jacascript
var func = function(){
    console.log(this.x);
    console.log(arguments);
}

 
func();  // undefined, {}
var obj = {
    x: 2
}
var bar = func.bind(obj,1);

bar(); // 2 , {'0':1}
一个有意思的事：

var bar = function() {
    console.log(this.x);
}
var foo = {
    x: 3
}
var sed = {
    x: 4
}
var func = bar.bind(foo).bind(sed);
func(); //3

var fiv = {
    x: 5
}
var func = bar.bind(foo).bind(sed).bind(fiv);
func(); //3
```
在Javascript中，多次 bind() 是无效的。更深层次的原因， bind() 的实现，相当于使用函数在内部包了一个 call / apply ，第二次 bind() 相当于再包住第一次 bind() ,故第二次以后的 bind 是无法生效的。

5、这三个方法的异同点是什么呢？
还是先看个栗子：
```jacascript
var obj = {
x: 81,
};

var foo = {
getX: function() {
return this.x;
}
}

console.log(foo.getX.bind(obj)()); //81
console.log(foo.getX.call(obj)); //81
console.log(foo.getX.apply(obj)); //81
```
看到bind后面对了一对括号。区别是，当你希望改变上下文环境之后并非立即执行，而是回调执行的时候，使用 bind() 方法。而 apply/call 则会立即执行函数。

总结
apply 、 call 、bind 三者都是用来改变函数的this对象的指向的；
apply 、 call 、bind 三者第一个参数都是this要指向的对象，也就是想指定的上下文；
apply 、 call 、bind 三者都可以利用后续参数传参；
bind是返回对应函数，便于稍后调用；apply、call则是立即调用 。