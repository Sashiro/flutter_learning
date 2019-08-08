import 'package:flutter/material.dart';
import 'package:flutter_learning/12_custom_widget/CustomPaintRoute.dart';

class CustomHomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("五子棋"),
              color: Colors.cyan[200],
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomPaintRoute())),
            ),
          ],
        ),
      ),
    );
  }
}
