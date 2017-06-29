---
title: matrix
date: 2017-04-24 13:17:33
tags:
---

矩阵变换
``` javascript
function matrix(arr){
  var len = arr[0].length;
  var matrixArr = new Array();
  for (var i = 0; i < len; i++){
    matrixArr[i] = new Array(len);
  }

  for(var j = 0; j< arr.length; j++){
    for(var k = 0; k< matrixArr[j].length; k++){
      matrixArr[k][j] = arr[j][k]
    }
  }
  return matrixArr;
}
```