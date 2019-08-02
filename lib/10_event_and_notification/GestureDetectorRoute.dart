import 'package:flutter/material.dart';

class GestureDetectorRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GestureDetectorState();
}

class _GestureDetectorState extends State<GestureDetectorRoute> {
  String _operation = 'No gesture detected';
  double _topOffset = 0.0;
  double _leftOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture"),
      ),
      body: Center(
        child:
//        Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            GestureDetector(
//              child: Container(
//                alignment: Alignment.center,
//                color: Colors.blue,
//                width: 200.0,
//                height: 100.0,
//                child: Text(
//                  _operation,
//                  style: TextStyle(color: Colors.white),
//                ),
//              ),
//              onTap: () => _updateText("tap"),
//              onDoubleTap: () => _updateText("double tap"),
//              onLongPress: () => _updateText("long press"),
//            ),
//          ],
//        ),
            Stack(
          children: <Widget>[
            Positioned(
              top: _topOffset,
              left: _leftOffset,
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text('A'),
                ),
                onPanDown: (DragDownDetails e) {
                  print('PanDown position: ${e.globalPosition}');
                },
                onPanUpdate: (e) {
                  setState(() {
                    _leftOffset += e.delta.dx;
                    _topOffset += e.delta.dy;
                  });
                },
                onPanEnd: (e) {
                  print(e.velocity);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}
