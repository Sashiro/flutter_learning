class DartFuture {
  DartFuture() {
    var doSomething = () => "hello world";
    var doSomethingThen = (String data) => print(data);

    Future.delayed(new Duration(days: 1), doSomething) // 创建延时任务
        .then(doSomethingThen)
        .catchError((e) => print(e)) // 异常处理
        .then(doSomethingThen, onError: (e) => print(e)) // then里做异常处理
        .whenComplete(() {}); // 无论成功失败都会调用，终止信号

    /*
        Future.wait
        可以实现等待多个异步任务执行结束后再进行后续操作
     */
    Future.wait([
      Future.delayed(new Duration(seconds: 2), () => "hello"),
      Future.delayed(new Duration(seconds: 3), () => "world")
    ])
        .then((results) => print("${results[0]} ${results[1]}"))
        .catchError((e) => print(e));
  }
}
