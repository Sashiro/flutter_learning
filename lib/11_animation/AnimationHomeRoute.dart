import 'package:flutter/material.dart';
import 'package:flutter_learning/11_animation/ScaleAnimationRoute.dart';

class AnimationHomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.cyan[100],
              child: Text("Scale Animation"),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ScaleAnimationRoute())),
            )
          ],
        ),
      ),
    );
  }
}
