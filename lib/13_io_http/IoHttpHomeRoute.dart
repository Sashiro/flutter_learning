import 'package:flutter/material.dart';
import 'package:flutter_learning/13_io_http/FileOperationRoute.dart';

class IoHttpHomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IO Http home page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("File Operation"),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FileOperationRoute())),
            ),
          ],
        ),
      ),
    );
  }
}
