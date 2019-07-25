import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning/7_widget/ImageAndIcon.dart';

class InputAndForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InputAndFormState();
}

class InputAndFormState extends State<InputAndForm> {
  @override
  Widget build(BuildContext context) {
    // controller还可以设置默认文本、选中文本、光标位置等
    TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("input and form"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: _getTextFiled(_controller),
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              margin: EdgeInsets.only(bottom: 30.0),
            ),
            Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              margin: EdgeInsets.only(bottom: 30.0),
              child: TextField(
                // 可输入的最大字数，不与counterText共存
                maxLength: 10,
                // 超过最大字数后是否允许继续输入，false时允许
                maxLengthEnforced: false,
                maxLines: 1,
                decoration: InputDecoration(
                    // 显示error文本
                    errorText: "error text",
                    errorMaxLines: 1,
                    errorStyle: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.green),
                    labelText: "no floating label text",
                    // 默认true，false时label text不浮动
                    hasFloatingPlaceholder: false),
              ),
            ),
            RaisedButton(
              child: Text("go form page"),
              onPressed: () {
                print(_controller.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => _FormRoute()));
              },
            ),
          ],
        ),
      ),
    );
  }

  TextField _getTextFiled(TextEditingController controller) => TextField(
        // 可以设置/获取编辑框内容、选择编辑内容、监听文本改变事件
        controller: controller,
        // 设置焦点节点，可通过FocusScope.of(context).requestFocus(targetFocusNode) 让指定节点获得焦点
        // 可以监听焦点改变事件
        focusNode: FocusNode(),
        // 装饰
        decoration: _getInputDecoration(),
        keyboardType: TextInputType.number,
        /* 键盘类型
         * text：文本
         * multiline：多行文本（maxLines为null或者大于1）
         * number：数字
         * phone：电话好吗输入键盘
         * datetime：日期输入键盘
         * emailAddress：电子邮箱输入键盘
         * url：url输入键盘
         */
        // 键盘回车键图标设置
        textInputAction: TextInputAction.search,
        textAlign: TextAlign.left,
        // 是否隐藏编辑中文本，可用于密码输入
        obscureText: true,
        onChanged: (str) => {
          // 内容变化监听
        },
        enabled: true,
        // cursor相关都是自定义光标用的
        cursorWidth: 2.0,
        // 指定输入格式，输入内容改变时触发
        inputFormatters: [
          TextInputFormatter.withFunction((oldValue, newValue) => newValue)
        ],
      );

  /*
   * border使用优先顺
   * · enabled == false，disabledBorder
   * · errorText有值，且没有焦点，errorBorder
   * · errorText有值，且有焦点，focusedErrorBorder
   * · errorText有值且没有设置任何errorBorder，默认红色
   * · errorText无值，且没有焦点，enabledBorder
   * · errorText无值，且有焦点，focusedBorder
   * · 什么都没有则默认border (UnderlineInputBorder)
   */
  InputDecoration _getInputDecoration() => InputDecoration(
      // hint
      hintText: "hint text",
      // 左侧icon
      icon: Icon(MyIcons.car),
      // 描述输入框，获得焦点后会浮动到上方
      labelText: "label text",
      // labelText式样
      labelStyle: TextStyle(color: Colors.red),
      // 帮助文本，位于输入框下方，不与error text共存
      helperText: "helper text",
      helperStyle: TextStyle(fontStyle: FontStyle.italic),
      // 固定开头内容
      prefixText: "prefixText",
      // 固定结尾内容
      suffixText: "suffix text",
      // 计数文本
      counterText: "counter text",
      // 颜色填充
      filled: true,
      // border
      enabledBorder: OutlineInputBorder(),
      fillColor: Colors.grey);
}

// ----------------------- form route ---------------------------

class _FormRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormRouteState();
  }
}

class _FormRouteState extends State<_FormRoute> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _formKey,
          // 自动校验
          autovalidate: true,
          child: Column(
            children: <Widget>[
              // 用户名输入框
              TextFormField(
                autofocus: true,
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户id或邮箱",
                  icon: Icon(Icons.person),
                ),
                // 设置校验
                validator: (v) {
                  if (v.trim().length < 0) {
                    return "用户名不能为空";
                  } else if (v.contains("-")) {
                    return "用户名不能包含\"-\"";
                  }
                  return null;
                },
              ),
              // 密码输入框
              TextFormField(
                obscureText: true,
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: "密码", hintText: "请输入密码", icon: Icon(Icons.lock)),
                validator: (v) => v.trim().length > 5 ? null : "密码不能少于6位",
              ),
              // 登录按钮
              Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text("登录"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          if ((_formKey.currentState as FormState).validate()) {
                            setState(() {
                              _result =
                                  "用户名：${_nameController.text} \n密码：${_pwdController.text}";
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Text("$_result"),
            ],
          ),
        ),
      ),
    );
  }
}
