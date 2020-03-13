# XLForm表单使用
XLForm的使用和传值示例代码
```
iOS-微信支付流程
1.注册微信开放平台,创建应用获取appid,APPSecret,申请支付功能,申请成功之后会返回一些参数.
2.下载微信支付SDK.
3.客户端请求订单,后台与微信后台交互,返回给客户端支付参数.
4.调用微信客户端,由微信客户端和微信服务器打交道.
5.客户端和服务器都会收到支付结果.
```
```
iOS-微信支付流程
1.注册微信开放平台,创建应用获取appid,APPSecret,申请支付功能,申请成功之后会返回一些参数.
2.下载微信支付SDK.
3.客户端请求订单,后台与微信后台交互,返回给客户端支付参数.
4.调用微信客户端,由微信客户端和微信服务器打交道.
5.客户端和服务器都会收到支付结果.
```
```
因为使用 GCD 有很多好处啊
1、GCD 可用于多核的并行运算；
2、GCD 会自动利用更多的 CPU 内核（比如双核、四核）；
3、GCD 会自动管理线程的生命周期（创建线程、调度任务、销毁线程）；
4、程序员只需要告诉 GCD 想要执行什么任务，不需要编写任何线程管理代码。
```
```
一、先来了解 GCD 中两个核心概念：『任务』 和 『队列』
同步执行（sync）：
同步添加任务到指定的队列中，在添加的任务执行结束之前，会一直等待，直到队列里面的任务完成之后再继续执行。
只能在当前线程中执行任务，不具备开启新线程的能力。
异步执行（async）：
异步添加任务到指定的队列中，它不会做任何等待，可以继续执行任务。
可以在新的线程中执行任务，具备开启新线程的能力。
```
