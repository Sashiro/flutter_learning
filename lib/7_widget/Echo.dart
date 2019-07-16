import 'package:flutter/material.dart';
import 'package:flutter_learning/7_widget/LifecycleRoute.dart';

class Echo extends StatelessWidget {
  const Echo({Key key, @required this.text, this.backgroundColor: Colors.grey})
      : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: FlatButton(
          child: Text(text),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => LifecycleRoute())),
        ),
      ),
    );
  }

  static Widget getEcho(BuildContext context) => Echo(
        text: "hello world!",
      );
}