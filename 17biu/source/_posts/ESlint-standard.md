---
title: ESlint standard
date: 2017-06-29 13:29:34
tags:
---

规则
使用两个空格缩进
eslint: indent
``` javascript
function hello (name) {
  console.log('hi', name)
}
```

字符串使用单引号
eslint: quotes
``` javascript
console.log('hello there')
$("<div class='box'>")
```

禁止出现未使用过的变量
eslint: no-unused-vars
``` javascript
function myFunction () {
  var result = something()   // ✗ avoid
}
```

关键字后使用空格
eslint: keyword-spacing
``` javascript
if (condition) { ... }   // ✓ ok
if(condition) { ... }    // ✗ avoid
```

在function的左括号之前使用一致的空格
eslint: space-before-function-paren
``` javascript
function name (arg) { ... }   // ✓ ok
function name(arg) { ... }    // ✗ avoid

run(function () { ... })      // ✓ ok
run(function() { ... })       // ✗ avoid
```

要求使用 === 和 !==
此外： obj == null 被允许检查 null || undefined
eslint: eqeqeq
``` javascript
if (name === 'John')   // ✓ ok
if (name == 'John')    // ✗ avoid

if (name !== 'John')   // ✓ ok
if (name != 'John')    // ✗ avoid
```


要求操作符周围有空格
eslint: space-infix-ops
``` javascript
// ✓ ok
var x = 2
var message = 'hello, ' + name + '!'

// ✗ avoid
var x=2
var message = 'hello, '+name+'!'
```


强制在逗号后使用一致的空格
eslint: comma-spacing
``` javascript
// ✓ ok
var list = [1, 2, 3, 4]
function greet (name, options) { ... }

// ✗ avoid
var list = [1,2,3,4]
function greet (name,options) { ... }
```


强制在代码块中使用一致的大括号风格
eslint: brace-style
``` javascript
// ✓ ok
if (condition) {
  // ...
} else {
  // ...
}

// ✗ avoid
if (condition) {
  // ...
}
else {
  // ...
}
```


强制所有控制语句使用一致的括号风格
eslint: curly
``` javascript
// ✓ ok
if (options.quiet !== true) console.log('done')

// ✓ ok
if (options.quiet !== true) {
  console.log('done')
}

// ✗ avoid
if (options.quiet !== true)
  console.log('done')
```


要求回调函数中有容错处理
eslint: handle-callback-err
``` javascript
// ✓ ok
run(function (err) {
  if (err) throw err
  window.alert('done')
})

// ✗ avoid
run(function (err) {
  window.alert('done')
})
```


始终使用window.全局作为前缀
eslint: no-undef
``` javascript
window.alert('hi')   // ✓ ok
```

禁止出现多行空行
eslint: no-multiple-empty-lines
``` javascript
// ✓ ok 
var value = 'hello world' console.log(value)
 
// ✗ avoid 
var value = 'hello world' 


console.log(value)
```


强制操作符使用一致的换行符
eslint: operator-linebreak
``` javascript
// ✓ ok
var location = env.development ? 'localhost' : 'www.api.com'

// ✓ ok
var location = env.development
  ? 'localhost'
  : 'www.api.com'

// ✗ avoid
var location = env.development ?
  'localhost' :
  'www.api.com'

```

变量声明要分开声明
eslint:  one-var
``` javascript
// ✓ ok
var silent = true
var verbose = true

// ✗ avoid
var silent = true, verbose = true

// ✗ avoid
var silent = true,
    verbose = true
```

用附加的括号包含条件赋值。 这使得这个赋值（=）表达式有意，而不是一个等于（===）的拼写错误。
eslint: no-cond-assign
``` javascript
// ✓ ok
while ((m = text.match(expr))) {
  // ...
}

// ✗ avoid
while (m = text.match(expr)) {
  // ...
}
```

强制在单行代码块中使用一致的空格
eslint: block-spacing
``` javascript
 function foo () {return true}    // ✗ avoid
 function foo () { return true }  // ✓ ok
```

使用驼峰命名变量和方法名
eslint: camelcase
``` javascript
 function my_function () { }    // ✗ avoid
 function myFunction () { }     // ✓ ok

 var my_var = 'hello'           // ✗ avoid
 var myVar = 'hello'            // ✓ ok
```

禁止拖尾逗号
eslint: comma-dangle
``` javascript
 var obj = {
    message: 'hello',   // ✗ avoid
 }
```

强制使用一致的逗号风格
eslint: comma-style
``` javascript
 var obj = {
    foo: 'foo'
    ,bar: 'bar'   // ✗ avoid
  }

  var obj = {
    foo: 'foo',
    bar: 'bar'   // ✓ ok
  }
```

点号之前换行(点号应该和属性在一行)
eslint: dot-location
``` javascript
 console.
    log('hello')  // ✗ avoid

  console
    .log('hello') // ✓ ok
```

文件必须以换行符结尾。
eslint: eol-last

在功能表示符和其调用之间不能有空格(No space between function identifiers and their invocations.)
eslint: func-call-spacing
``` javascript
console.log ('hello') // ✗ avoid
console.log('hello')  // ✓ ok
```

强制在对象字面量的属性中键和值之间使用一致的间距
eslint: key-spacing
``` javascript
var obj = { 'key' : 'value' }    // ✗ avoid
var obj = { 'key' :'value' }     // ✗ avoid
var obj = { 'key':'value' }      // ✗ avoid
var obj = { 'key': 'value' }     // ✓ ok
```

要求构造函数首字母大写
eslint: new-cap
``` javascript
function animal () {}
var dog = new animal()    // ✗ avoid

function Animal () {}
var dog = new Animal()    // ✓ ok
```

要求调用无参构造函数时有圆括号
eslint: new-parens
``` javascript
function Animal () {}
var dog = new Animal    // ✗ avoid
var dog = new Animal()  // ✓ ok
```

强制 getter 和 setter 在对象中成对出现
eslint: accessor-pairs
``` javascript
var person = {
  set name (value) {    // ✗ avoid
    this.name = value
  }
}

var person = {
  set name (value) {
    this.name = value
  },
  get name () {         // ✓ ok
    return this.name
  }
}
```


要求在构造函数中有 super() 的调用
eslint: constructor-super
``` javascript
class Dog {
  constructor () {
    super()   // ✗ avoid
  }
}

class Dog extends Mammal {
  constructor () {
    super()   // ✓ ok
  }
}
```

禁用 Array 构造函数
eslint: no-array-constructor
``` javascript
var nums = new Array(1, 2, 3)   // ✗ avoid
var nums = [1, 2, 3]            // ✓ ok
```

禁用 arguments.caller 或 arguments.callee
eslint: no-caller
``` javascript
function foo (n) {
  if (n <= 0) return

  arguments.callee(n - 1)   // ✗ avoid
}

function foo (n) {
  if (n <= 0) return

  foo(n - 1)
}
```

禁止修改类声明的变量
eslint: no-class-assign
``` javascript
class Dog {}
Dog = 'Fido'    // ✗ avoid
```

禁止修改 const 声明的变量
eslint: no-const-assign
``` javascript
const score = 100
score = 125       // ✗ avoid
```

禁止在条件中使用常量表达式(除了循环)
eslint: no-constant-condition
``` javascript
if (false) {    // ✗ avoid
  // ...
}

if (x === 0) {  // ✓ ok
  // ...
}

while (true) {  // ✓ ok
  // ...
}
```

禁止在正则表达式中使用控制字符
eslint: no-control-regex
``` javascript
var pattern = /\x1f/    // ✗ avoid
var pattern = /\x20/    // ✓ ok
```

禁用bugger
eslint: no-debugger
``` javascript
function sum (a, b) {
  debugger      // ✗ avoid
  return a + b
}
```

禁止删除变量
eslint: no-delete-var
``` javascript
var name
delete name     // ✗ avoid
```

禁止 function 定义中出现重名参数
eslint: no-dupe-args
``` javascript
function sum (a, b, a) {  // ✗ avoid
  // ...
}

function sum (a, b, c) {  // ✓ ok
  // ...
}
```


禁止类成员中出现重复的名称
eslint: no-dupe-class-members
``` javascript
class Dog {
  bark () {}
  bark () {}    // ✗ avoid
}
```

禁止对象字面量中出现重复的 key
eslint: no-dupe-keys
``` javascript
var user = {
  name: 'Jane Doe',
  name: 'John Doe'    // ✗ avoid
}
```

禁止出现重复的 case 标签
eslint: no-duplicate-case
``` javascript
switch (id) {
  case 1:
    // ...
  case 1:     // ✗ avoid
}
```

每个module 使用一个import的语句
eslint: no-duplicate-imports
``` javascript
import { myFunc1 } from 'module'
import { myFunc2 } from 'module'          // ✗ avoid

import { myFunc1, myFunc2 } from 'module' // ✓ ok
```

禁用eval()
eslint: no-eval
``` javascript
eval( "var result = user." + propName ) // ✗ avoid
var result = user[propName]             // ✓ ok
```

禁止对 catch 子句的参数重新赋值
eslint: no-ex-assign
``` javascript
try {
  // ...
} catch (e) {
  e = 'new value'             // ✗ avoid
}

try {
  // ...
} catch (e) {
  const newVal = 'new value'  // ✓ ok
}
```

禁止扩展原生类型
eslint: no-extend-native
``` javascript
Object.prototype.age = 21     // ✗ avoid
```

禁止不必要的 .bind() 调用
eslint: no-extra-bind
``` javascript
const name = function () {
  getName()
}.bind(user)    // ✗ avoid

const name = function () {
  this.getName()
}.bind(user)    // ✓ ok
```

禁止不必要的布尔转换
eslint: no-extra-boolean-cast
``` javascript
const result = true
if (!!result) {   // ✗ avoid
  // ...
}

const result = true
if (result) {     // ✓ ok
  // ...
}
```

禁止不必要的括号
eslint: no-extra-parens
``` javascript
const myFunc = (function () { })   // ✗ avoid
const myFunc = function () { }     // ✓ ok
```

使用break禁止 case 语句落空
eslint: no-fallthrough
``` javascript
switch (filter) {
  case 1:
    doSomething()    // ✗ avoid
  case 2:
    doSomethingElse()
}

switch (filter) {
  case 1:
    doSomething()
    break           // ✓ ok
  case 2:
    doSomethingElse()
}

switch (filter) {
  case 1:
    doSomething()
    // fallthrough  // ✓ ok
  case 2:
    doSomethingElse()
}
```

禁止数字字面量中使用前导和末尾小数点
eslint: no-floating-decimal
``` javascript
const discount = .5      // ✗ avoid
const discount = 0.5     // ✓ ok
```

禁止对 function 声明重新赋值
eslint:  no-func-assign
``` javascript
function myFunc () { }
myFunc = myOtherFunc    // ✗ avoid
```

不能对只读的全局变量重新赋值
eslint: no-global-assign
``` javascript
window = {}     // ✗ avoid
```

禁止使用类似 eval() 的方法
eslint:  no-implied-eval
``` javascript
setTimeout("alert('Hello world')")                   // ✗ avoid
setTimeout(function () { alert('Hello world') })     // ✓ ok
```

禁止在嵌套的块中出现变量声明或 function 声明
eslint: no-inner-declarations
``` javascript
if (authenticated) {
  function setAuthUser () {}    // ✗ avoid
}
```

禁止 RegExp 构造函数中存在无效的正则表达式字符串
eslint: no-invalid-regexp
``` javascript
RegExp('[a-z')    // ✗ avoid
RegExp('[a-z]')   // ✓ ok
```

禁止在字符串和注释之外不规则的空白
eslint: no-irregular-whitespace
``` javascript
function myFunc () /*<NBSP>*/{}   // ✗ avoid
```

禁用 __iterator__ 属性
eslint: no-iterator
``` javascript
Foo.prototype.__iterator__ = function () {}   // ✗ avoid
```

不允许标签与变量同名
eslint: no-label-var
``` javascript
var score = 100
function game () {
  score: 50         // ✗ avoid
}
```

禁用标签语句
eslint: no-labels
``` javascript
label:
  while (true) {
    break label     // ✗ avoid
  }
```

禁用不必要的嵌套块
eslint: no-lone-blocks
``` javascript
function myFunc () {
  {                   // ✗ avoid
    myOtherFunc()
  }
}

function myFunc () {
  myOtherFunc()       // ✓ ok
}
```

禁止空格和 tab 的混合缩进
eslint: no-mixed-spaces-and-tabs
禁止使用多个空格
eslint: no-multi-spaces
``` javascript
const id =    1234    // ✗ avoid
const id = 1234       // ✓ ok
```

禁止使用多行字符串
eslint: no-multi-str
``` javascript
const message = 'Hello \
                 world'     // ✗ avoid
```

禁止在非赋值或条件语句中使用 new 操作符
eslint: no-new
``` javascript
new Character()                     // ✗ avoid
const character = new Character()   // ✓ ok
```

禁止对 Function 对象使用 new 操作符
eslint: no-new-func
``` javascript
var sum = new Function('a', 'b', 'return a + b')    // ✗ avoid
```

禁用 Object 的构造函数
eslint: no-new-object
``` javascript
let config = new Object()   // ✗ avoid
```

禁止调用 require 时使用 new 操作符
eslint: no-new-require
``` javascript
const myModule = new require('my-module')    // ✗ avoid
```

禁止Symbol构造函数
eslint:   no-new-symbol
``` javascript
const foo = new Symbol('foo')   // ✗ avoid 
```

禁止原函数包装实例
eslint: no-new-wrappers
``` javascript
const message = new String('hello')   // ✗ avoid
```

禁止把全局对象作为函数调用
eslint: no-obj-calls
``` javascript
const math = Math()   // ✗ avoid
```

禁止在字符串中使用八进制转义序列
eslint: no-octal-escape
``` javascript
const copyright = 'Copyright \251'  // ✗ avoid
```

禁用八进制字面量
eslint: no-octal
``` javascript
const num = 042     // ✗ avoid
const num = '042'   // ✓ ok
```

禁止对 __dirname 和 __filename 进行字符串连接
eslint: no-path-concat
``` javascript
const pathToFile = __dirname + '/app.js'            // ✗ avoid
const pathToFile = path.join(__dirname, 'app.js')   // ✓ ok
```

禁用 __proto__ 属性
eslint: no-proto
``` javascript
const foo = obj.__proto__               // ✗ avoid
const foo = Object.getPrototypeOf(obj)  // ✓ ok
```

禁止多次声明同一变量
eslint: no-redeclare
``` javascript
let name = 'John'
let name = 'Jane'     // ✗ avoid

let name = 'John'
name = 'Jane'         // ✓ ok
```

禁止正则表达式字面量中出现多个空格
eslint: no-regex-spaces
``` javascript
const regexp = /test   value/   // ✗ avoid

const regexp = /test {3}value/  // ✓ ok
const regexp = /test value/     // ✓ ok
```

禁止在 return 语句中使用赋值语句
eslint: no-return-assign
``` javascript
function sum (a, b) {
  return result = a + b     // ✗ avoid
}

function sum (a, b) {
  return (result = a + b)   // ✓ ok
}
```

禁止自我赋值
eslint : no-self-assign
``` javascript
name = name   // ✗ avoid
```

禁止自身比较
eslint: no-self-compare
``` javascript
if (score === score) {}   // ✗ avoid
```

禁用逗号操作符
eslint: no-sequences
``` javascript
if (doSomething(), !!test) {}   // ✗ avoid
```

禁止覆盖受限制的标识符
eslint: no-shadow-restricted-names
``` javascript
let undefined = 'value'     // ✗ avoid
```

禁用稀疏数组
eslint: no-sparse-arrays
``` javascript
let fruits = ['apple',, 'orange']       // ✗ avoid
```

disallow tabs in file
eslint: no-tabs

disallow template literal placeholder syntax in regular strings
eslint: no-template-curly-in-string
``` javascript
const message = 'Hello ${name}'   // ✗ avoid
const message = `Hello ${name}`   // ✓ ok
```

禁止在构造函数中，在调用 super() 之前使用 this 或 super
eslint: no-this-before-super
``` javascript
class Dog extends Animal {
  constructor () {
    this.legs = 4     // ✗ avoid
    super()
  }
}
```

禁止抛出异常字面量
eslint: no-throw-literal
``` javascript
throw 'error'               // ✗ avoid
throw new Error('error')    // ✓ ok
```

禁用行尾空格
eslint: no-trailing-spaces

禁止将变量初始化为 undefined
eslin: no-undef-init
``` javascript
let name = undefined    // ✗ avoid

let name
name = 'value'          // ✓ ok
```

禁用未修改的循环条件
eslint:  no-unmodified-loop-condition
``` javascript
for (let i = 0; i < items.length; j++) {...}    // ✗ avoid
for (let i = 0; i < items.length; i++) {...}    // ✓ ok
```

禁止可以在有更简单的可替代的表达式时使用三元操作符
eslint: no-unneeded-ternary
``` javascript
let score = val ? val : 0     // ✗ avoid
let score = val || 0          // ✓ ok
```

禁止在return、throw、continue 和 break 语句之后出现不可达代码
eslint: no-unreachable
``` javascript
function doSomething () {
  return true
  console.log('never called')     // ✗ avoid
}
```

禁止在 finally 语句块中出现控制流语句
eslint: no-unsafe-finally
``` javascript
try {
  // ...
} catch (e) {
  // ...
} finally {
  return 42     // ✗ avoid
}
```

disallow negating the left operand of relational operators
eslint: no-unsafe-negation
``` javascript
if (!key in obj) {}       // ✗ avoid
```

禁止不必要的 .call() 和 .apply()
``` javascript
sum.call(null, 1, 2, 3)   // ✗ avoid
```

disallow unnecessary computed property keys in object literals
eslint: no-useless-computed-key
``` javascript
const user = { ['name']: 'John Doe' }   // ✗ avoid
const user = { name: 'John Doe' }       // ✓ ok
```

禁用不必要的构造函数
eslint: no-useless-constructor
``` javascript
class Car {
  constructor () {      // ✗ avoid
  }
}
```

禁用不必要的转义字符
eslint: no-useless-escape
``` javascript
let message = 'Hell\o'  // ✗ avoid
```

disallow renaming import, export, and destructured assignments to the same name
eslint: no-useless-rename
``` javascript
import { config as config } from './config'     // ✗ avoid
import { config } from './config'               // ✓ ok
```

禁用 with 语句
eslint: no-with
``` javascript
with (val) {...}    // ✗ avoid
```

保持一致性将对象的属性放在不同的行上
eslint: object-property-newline
``` javascript
const user = {
  name: 'Jane Doe', age: 30,
  username: 'jdoe86'            // ✗ avoid
}

const user = { name: 'Jane Doe', age: 30, username: 'jdoe86' }    // ✓ ok

const user = {
  name: 'Jane Doe',
  age: 30,
  username: 'jdoe86'
}
```                               

禁止块内有空白填充
eslint: padded-blocks
``` javascript
if (user) {
                            // ✗ avoid
  const name = getName()

}

if (user) {
  const name = getName()    // ✓ ok
}
```

enforce spacing between rest and spread operators and their expressions
eslint: rest-spread-spacing
``` javascript
fn(... args)    // ✗ avoid
fn(...args)     // ✓ ok
```

强制分号前后有空格
eslint: semi-spacing
``` javascript
for (let i = 0 ;i < items.length ;i++) {...}    // ✗ avoid
for (let i = 0; i < items.length; i++) {...}    // ✓ ok
```

强制在块之前使用一致的空格
eslint:space-before-blocks
``` javascript
if (admin){...}     // ✗ avoid
if (admin) {...}    // ✓ ok
```

强制在圆括号内使用一致的空格
eslint: space-in-parens
``` javascript
getName( name )     // ✗ avoid
getName(name)       // ✓ ok
```

强制在一元操作符前后使用一致的空格
eslint: space-unary-ops
``` javascript
typeof!admin        // ✗ avoid
typeof !admin        // ✓ ok
```

强制在注释中 // 或 /* 使用一致的空格
eslint: spaced-comment
``` javascript
//comment           // ✗ avoid
// comment          // ✓ ok

/*comment*/         // ✗ avoid
/* comment */       // ✓ ok
```

要求或禁止模板字符串中的嵌入表达式周围空格的使用
eslint: template-curly-spacing
``` javascript
const message = `Hello, ${ name }`    // ✗ avoid
const message = `Hello, ${name}`      // ✓ ok
```

要求使用 isNaN() 检查 NaN
eslint: use-isnan
``` javascript
if (price === NaN) { }      // ✗ avoid
if (isNaN(price)) { }       // ✓ ok
```

强制 typeof 表达式与有效的字符串进行比较
eslint: valid-typeof
``` javascript
typeof name === 'undefimed'     // ✗ avoid
typeof name === 'undefined'     // ✓ ok
```

要求 IIFE 使用括号括起来
eslint: wrap-iife
``` javascript
const getName = function () { }()     // ✗ avoid

const getName = (function () { }())   // ✓ ok
const getName = (function () { })()   // ✓ ok
```

强制在 yield* 表达式中 * 周围使用空格
eslint: yield-star-spacing
``` javascript
yield* increment()    // ✗ avoid
yield * increment()   // ✓ ok
```

要求或禁止 “Yoda” 条件
eslint: yoda
``` javascript
if (42 === age) { }    // ✗ avoid
if (age === 42) { }    // ✓ ok
```

 禁止出现令人困惑的多行表达式
eslint: no-unexpected-multiline
``` javascript
// ✓ ok
;(function () {
  window.alert('ok')
}())

// ✗ avoid
(function () {
  window.alert('ok')
}())

// ✓ ok
;[1, 2, 3].forEach(bar)

// ✗ avoid
[1, 2, 3].forEach(bar)

// ✓ ok
;`hello`.indexOf('o')

// ✗ avoid
`hello`.indexOf('o')
```

要求或禁止使用分号而不是 ASI
eslint: semi
``` javascript
window.alert('hi')   // ✓ ok
window.alert('hi');  // ✗ avoid
```

如果想要调过某个规则的校验，可以采用eslint-disabled。

参考资料：
https://standardjs.com/readme-zhcn.html
http://eslint.cn/





