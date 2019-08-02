import 'package:flutter/material.dart';
import 'package:flutter_learning/10_event_and_notification/PointerEventRoute.dart';

class EventAndNotificationHomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('event and notification'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.white70,
              child: Text('Pointer Event'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PointerEventRoute())),
            ),
          ],
        ),
      ),
    );
  }
}
