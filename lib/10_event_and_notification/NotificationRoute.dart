import 'package:flutter/material.dart';

class NotificationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationRoute> {
  String _msg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: NotificationListener<_MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += "${notification.msg} ";
          });
          return true;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Builder(
                builder: (context) => RaisedButton(
                  onPressed: () => _MyNotification("Hi").dispatch(context),
                  child: Text('Send Notification'),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(_msg),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyNotification extends Notification {
  _MyNotification(this.msg);

  final String msg;
}
