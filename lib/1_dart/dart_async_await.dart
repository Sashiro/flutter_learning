class DartAsyncAwait {
  DartAsyncAwait() {
    doSomethingAfterLogin();
  }

  /* 使用 async/await 消除 callback hell
   * await只能出现在async内部
   * async/await只是语法糖，编译器最终会将其转化为Future+then的调用链
   */
  doSomethingAfterLogin() async {
    try {
      String id = await login("name", "pwd");
      String info = await getUserInfo(id);
      await getUserSomething(info); // do something
    } catch (e) {
      // error handling
      print(e);
    }
  }

  // 模拟用户登录
  Future<String> login(String username, String pwd) {
    return Future.value("id");
  }

  // 模拟获取用户信息
  Future<String> getUserInfo(String userId) {
    return Future.value("info");
  }

  // 模拟其他操作
  Future<void> getUserSomething(String userInfo) {
    return Future.value("something");
  }
}
