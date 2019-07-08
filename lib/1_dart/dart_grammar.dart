// 类型定义
typedef bool CALLBACK();

class DartGrammar {
  // 变量声明
  void _VariableDefine() {
    var testVar;
    testVar = 1000;

    dynamic dynamicVar;
    dynamicVar = "1234";
    dynamicVar = 1234;

    String myString;
    myString = "1234";

    // 运行时常量
    final String finalA = myString;
    // 编译时常量
    const String constA = "const";
  }

  // 函数声明
  String getString() => "return String";

  dynamicFunction() {}

  bool callBack(CALLBACK callback) => callback();

  void execute(var function) {
    function();

    // assign function to variable
    var variableFunction = (message) {
      // do something
      var message1 = message;
      return message1;
    };
  }

  // 可选位置参数
  String param1(String arg1, String arg2, [String arg3]) {
    var result = "$arg1, $arg2";
    if (arg3 != null) result = "$result, $arg3";

    return result;
  }

  // 可选命名参数
  String param2(String arg1, {String arg2, String arg3}) {
    return arg1; // do something
  }
}
