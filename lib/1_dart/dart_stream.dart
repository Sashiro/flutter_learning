class DartStream {
  DartStream() {
    Stream.fromFutures([
      Future.delayed(new Duration(seconds: 1), () => "hello first"),
      Future.delayed(
          new Duration(seconds: 3), () => throw AssertionError("Error second")),
      Future.delayed(new Duration(seconds: 5), () => "hello third")
    ]).listen((data) => print(data),
        onError: (e) => print(e.message), onDone: () {});
  }

  // 最终依次输出 hello first、Error second、hello third
}
