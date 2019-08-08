import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    /* 动画状态监听
     * AnimationStatus
     * dismissed：动画在起始点停止
     * forward：动画正在正向执行
     * reverse：动画正在反向执行
     * completed：动画在终点停止
     */
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
//    return AnimatedImage(
//      animation: animation,
//    );
//    return AnimatedBuilder(
//      animation: animation,
//      child: Image.asset("pictures/asset_icon.png"),
//      // 渲染过程
//      builder: (context, child) => Center(
//        child: Container(
//          height: animation.value,
//          width: animation.value,
//          child: child,
//        ),
//      ),
//    );

    return Scaffold(
      appBar: AppBar(),
      body: GrowTransition(
        child: Image.asset("pictures/asset_icon.png"),
        animation: animation,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
          height: animation.value,
          width: animation.value,
          child: child,
        ),
        child: child,
      ),
    );
  }
}

// --------------AnimatedWidget--------------
//class AnimatedImage extends AnimatedWidget {
//  AnimatedImage({Key key, Animation<double> animation})
//      : super(key: key, listenable: animation);
//
//  @override
//  Widget build(BuildContext context) {
//    final Animation<double> animation = listenable;
//    return new Center(
//      child: Image.asset(
//        "pictures/asset_icon.png",
//        width: animation.value,
//        height: animation.value,
//      ),
//    );
//  }
//}

// --------------原始方法--------------

//
//class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
//    with SingleTickerProviderStateMixin {
//  Animation<double> animation;
//  AnimationController controller;
//
//  @override
//  void initState() {
//    super.initState();
//    controller =
//        AnimationController(duration: Duration(seconds: 5), vsync: this);
//    // 指定弹性曲线
//    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
//    // 定义一个从0到300的变化，且每回刷新UI
//    animation = Tween(begin: 0.0, end: 300.0).animate(animation) //animate(controller)
//      ..addListener(() {
//        setState(() {});
//      });
//    // 正向执行动画
//    controller.forward();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Image.asset(
//        "pictures/asset_icon.png",
//        width: animation.value,
//        height: animation.value,
//      ),
//    );
//  }
//
//  @override
//  void dispose() {
//    controller.dispose();
//    super.dispose();
//  }
//}
