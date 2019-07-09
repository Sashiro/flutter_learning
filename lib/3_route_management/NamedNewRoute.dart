import 'package:flutter/material.dart';

class NamedNewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("Named new route")),
      body: Center(
        child: Text("named new route $args!"),
      ),
    );
  }
}

/*
 * https://api.flutter.dev/flutter/widgets/ModalRoute-class.html
 * ModalRoute.of(context)
 * 获取当前路由对象，通过该对象获取当前页面所有属性
 */
