import 'package:flutter/material.dart';

class HeroRouteA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: 'asset_icon',
            child: ClipOval(
              child: Image.asset(
                'pictures/asset_icon.png',
                width: 50.0,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('原图'),
                  ),
                  body: HeroRouteB(),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}

class HeroRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'asset_icon',
        child: Image.asset('pictures/asset_icon.png'),
      ),
    );
  }
}
