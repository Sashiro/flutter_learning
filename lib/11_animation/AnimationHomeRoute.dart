import 'package:flutter/material.dart';
import 'package:flutter_learning/11_animation/FadeRoute.dart';
import 'package:flutter_learning/11_animation/HeroRoute.dart';
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
            ),
            FlatButton(
              color: Colors.cyan[200],
              child: Text('PageRouteBuilder'),
              onPressed: () => Navigator.push(
                  context,
                  // 使用PageRouteBuilder自定route转场动画
                  PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          // 透明度渐变过度
                          opacity: animation,
                          child: ScaleAnimationRoute(),
                        );
                      })),
            ),
            FlatButton(
              color: Colors.cyan[300],
              child: Text('PageRoute'),
              onPressed: () => Navigator.push(context,
                  FadeRoute(builder: (context) => ScaleAnimationRoute())),
            ),
            FlatButton(
              color: Colors.cyan[400],
              child: Text('HeroAnimation'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HeroRouteA())),
            )
          ],
        ),
      ),
    );
  }
}
