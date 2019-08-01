import 'package:flutter/material.dart';

class ScrollNotificationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScrollNotificationState();
}

class _ScrollNotificationState extends State<ScrollNotificationRoute> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollNotification"),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            /*
             * metrics
             * 
             * pixels：当前滚动位置
             * maxScrollExtent：最大可滚动长度
             * extentBefore：滑出ViewPort顶部的长度
             * extentInside：ViewPort内部长度
             * extentAfter：未滑入ViewPort的长度
             * atEdge：是否滑到了边界
             */
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            return false;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0,
                  itemBuilder: (context, index) => ListTile(
                        title: Text("${index + 1}"),
                      )),
              CircleAvatar(
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
