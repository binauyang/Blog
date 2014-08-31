# javascript动画设计简介 --- 动画效果指导思想

通过连贯的改变dom元素的位置达到视觉上动画效果

## 名词解释
* 帧
* 帧率
* 进度
* 缓动函数

## 动画效果中的问题
* 效果
	* 效果实现（属性分解）
	* 缓动函数
* 平滑度
	* 帧率控制
	* 变化量控制
* 动画的控制（暂停，继续，加速，减速，播放到指定进度，跳帧）
	* 动画实现思路（连续，瞬时）
* 性能问题
	* 重绘
	* 脏属性
* 代码结构
	* 解耦
	* 可复用

## STEP 1. 起步
先从最简单的动画效果说起，如下代码。
```javascript
var play = function(dom, end){
	var timer = setInterval(function(){
		var left = parseInt(dom.style.left);
		if(left >= end){
			clearInterval(timer);
			return;
		}
		dom.style.left = left + 10 + ‘px’；
	}, 16)；
}
//useage
play($('elem'), 1000);
```

> Question-1: 如何缓动，实现非线性变化

## STEP 2.匀加速缓动 
线性变化一般是指匀速运动，缓动是模拟显示物理效果，实现近似摩擦减速或逐步加速的运动过程，
```javascript
var play = function(dom, add, end){
	var delta = 10;
	var timer = setInterval(function(){
		v += add;
		var left = parseInt(dom.style.left);
		if(left >= end){
			clearInterval(timer);
			return;
		}
		dom.style.left = left + delta + ‘px’；
	}, 16)；
}
//useage
play($('elem'), 1, 1000);
```

> Question-2:匀加速不能满足需要，为了更好地模拟显示各种物理效果，需要实现变加速、减速效果

## STEP 3.缓动函数

非线性变化的过程需要数学函数的参与来简化代码和提高可控性，引入变化函数的概念

##### 变化函数
简单的缓动函数是由`x,y`组成的二元表达式，输入`x`，输出`y`，表示一种依赖变化关系

* 线性变化函数 
```javascipt
	function (x){
		return x;
	}
```
* 加速变化函数 
```javascipt
	function (x){
		return x * x;
	}
```

##### 在动画函数中如何应用？

为了便于控制和人类理解，一般的缓动函数都采取如下策略设计

* 当`x`由 0~1变化时，`y`的值也从0~1变化， 即 `x=0, y=0 && x=1,y=1`
* `x`表示播放进度的百分比，`y`值表示变化值的百分比，乘以变化总量获得当前变化值

```javascript
var leaner = function(x){
	return x;
}
var easeIn = function(x){
	return x * x;
}
var play = function(dom, end， timingFunction){
	var process = 0;
	var left = parseInt(dom.style.left);
	var delta = end - left;
	var timer = setInterval(function(){
		process += 0.1;
		left = left + timingFunction(process) * delta;
		dom.style.left = left + ‘px’；
		if(process == 1){
			clearInterval(timer);
			return;
		}
	}, 16)；
}
//useage
play($('elem'), 1000, leaner);
```

> Question-3:什么`process`只能每次递增`0.1`，想要控制时间，想要控制帧率

## STEP 3.帧率和时间
