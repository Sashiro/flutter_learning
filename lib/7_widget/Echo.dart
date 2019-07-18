import 'package:flutter/material.dart';
import 'package:flutter_learning/7_widget/ImageAndIcon.dart';
import 'package:flutter_learning/7_widget/LifecycleRoute.dart';
import 'package:flutter_learning/7_widget/state_management/StateManageRoute.dart';

class Echo extends StatelessWidget {
  const Echo({Key key, @required this.text, this.backgroundColor: Colors.grey})
      : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 300.0),
            color: backgroundColor,
            child: FlatButton(
              child: Text(text),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LifecycleRoute())),
            ),
          ),
          FlatButton(
            child: Text("state manage route"),
            color: Colors.white,
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => StateManageRoute())),
          ),
          RaisedButton(
            child: Text("Image and icon"),
            color: Colors.grey,
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ImageAndIcon())),
          )
        ],
      ),
    );
  }

  static Widget getEcho(BuildContext context) => Echo(
        text: "hello world!",
      );
}
